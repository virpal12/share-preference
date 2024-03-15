import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preference/Pages/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';

class splash_Screen extends StatefulWidget {
  const splash_Screen({super.key});

  @override
  State<splash_Screen> createState() => splash_ScreenState();
}

class splash_ScreenState extends State<splash_Screen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.deepOrange.shade200,
        child: Center(
          child: CircleAvatar(
              backgroundColor: Colors.deepOrange,
              radius: 60,
              child: Icon(
                Icons.person,
                size: 55,
              )),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool("Login");

    Timer(
      Duration(seconds: 2),
      () {
        if (isLoggedIn != null) {
          if (isLoggedIn) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => LoginPage()));
          }
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => LoginPage()));
        }
      },
    );
  }
}
