import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["wake up", true],
    ["exersize", true],
    ["breakfast", false],
    ["college", false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void addNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Add a new task",
                    filled: true,
                    fillColor: const Color.fromARGB(255, 233, 233, 238),

                  ),
                ), 
              ),
            ),
            FloatingActionButton(
              tooltip: "Add",
              elevation: 0,
              backgroundColor: Colors.deepPurple,
              onPressed: addNewTask,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ), 
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "TODO APPLICATION",
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: toDoList.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoList(
                  deleteFunction: (context) => deleteTask(index),
                  onChanged: (value) => checkBoxChanged(index), 
                  taskCompleted: toDoList[index][1],
                  taskName: toDoList[index][0],
                  );
                
              },
            ),
    );
  }
}



                  // trailing: Checkbox(
                  //   value: toDoList[index][1],
                  //   onChanged: (bool? value) {
                  //     setState(() {
                  //       toDoList[index][1] = value!;
                  //     });
                  //   },
                  // ),
