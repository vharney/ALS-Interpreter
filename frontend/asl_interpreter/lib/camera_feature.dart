// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// class CameraFeature extends StatefulWidget {
//   @override
//   _CameraFeatureState createState() => _CameraFeatureState();
// }

// class _CameraFeatureState extends State<CameraFeature> {
//   CameraController controller;
//   List cameras;
//   int selectedCameraIdx;
//   String imagePath;
// @override
// void initState() {
//   super.initState();
//   // 1
//   availableCameras().then((availableCameras) {
//     cameras = availableCameras;
//     if (cameras.length > 0) {
//       setState(() {
//         // 2
//         selectedCameraIdx = 0;
//       });

//       _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
//     } else {
//       print("No camera available");
//     }
//   }).catchError((err) {
//     // 3
//     print('Error: $err.code\nError Message: $err.message');
//   });
// }

// Widget build(BuildContext context) {
//   return AspectRatio(
//       aspectRatio: controller.value.aspectRatio,
//       child: Stack(fit: StackFit.expand, children: [
//         CameraPreview(controller),
//         cameraOverlay(padding: 50, aspectRatio: 1, color: Color(0x55000000))
//       ]));
// }

// Widget cameraOverlay({double padding, double aspectRatio, Color color}) {
//   return LayoutBuilder(builder: (context, constraints) {
//     double parentAspectRatio = constraints.maxWidth / constraints.maxHeight;
//     double horizontalPadding;
//     double verticalPadding;

//     if (parentAspectRatio < aspectRatio) {
//       horizontalPadding = padding;
//       verticalPadding = (constraints.maxHeight -
//               ((constraints.maxWidth - 2 * padding) / aspectRatio)) /
//           2;
//     } else {
//       verticalPadding = padding;
//       horizontalPadding = (constraints.maxWidth -
//               ((constraints.maxHeight - 2 * padding) * aspectRatio)) /
//           2;
//     }
//     return Stack(fit: StackFit.expand, children: [
//       Align(
//           alignment: Alignment.centerLeft,
//           child: Container(width: horizontalPadding, color: color)),
//       Align(
//           alignment: Alignment.centerRight,
//           child: Container(width: horizontalPadding, color: color)),
//       Align(
//           alignment: Alignment.topCenter,
//           child: Container(
//               margin: EdgeInsets.only(
//                   left: horizontalPadding, right: horizontalPadding),
//               height: verticalPadding,
//               color: color)),
//       Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//               margin: EdgeInsets.only(
//                   left: horizontalPadding, right: horizontalPadding),
//               height: verticalPadding,
//               color: color)),
//       Container(
//         margin: EdgeInsets.symmetric(
//             horizontal: horizontalPadding, vertical: verticalPadding),
//         decoration: BoxDecoration(border: Border.all(color: Colors.cyan)),
//       )
//     ]);
//   });
// }

// // 1, 2
// Future _initCameraController(CameraDescription cameraDescription) async {
//   if (controller != null) {
//     await controller.dispose();
//   }

//   // 3
//   controller = CameraController(cameraDescription, ResolutionPreset.high);

//   // If the controller is updated then update the UI.
//   // 4
//   controller.addListener(() {
//     // 5
//     if (mounted) {
//       setState(() {});
//     }

//     if (controller.value.hasError) {
//       print('Camera error ${controller.value.errorDescription}');
//     }
//   });

//   // 6
//   try {
//     await controller.initialize();
//   } on CameraException catch (e) {
//     _showCameraException(e);
//   }

//   if (mounted) {
//     setState(() {});
//   }
// }
// }
