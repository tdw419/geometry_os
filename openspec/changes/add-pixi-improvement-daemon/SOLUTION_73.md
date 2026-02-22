# Solution for Task: Implement smooth camera interpolation

[Context: Geometry OS Implementation Agent]

Your task is to provide a concise implementation plan or code solution for the following OpenSpec task: [Change ID: add-pixi-improvement-daemon]. The goal is to smoothly and accurately interpolate camera angles in real-time using Python or Rust. Please provide detailed information on file paths, python code snippets, and a "Next Step" command for the user.

1. File Paths:
    - Camera image path (e.g., "/path/to/camera_image.jpg")
    - User's camera angle input file path (e.g., "/path/to/user_angle_input.json")
    - Output image path (e.g., "/path/to/output_image.jpg")

2. Python Code Snippets:
   ```python
   import numpy as np
   import math
   
   # Load user's input angle file
   with open('/path/to/user_angle_input.json', 'r') as f:
       angles = json.load(f)
   
   # Calculate camera-angle matrix
   R, t = np.array([[angles['x']/180 * math.pi, -angles['y']/180 * math.pi], [angles['y'], angles['z']]]).T
   
   # Extract camera image and user input angles from camera image path and angle input file path
   camera_image = cv2.imread('/path/to/camera_image.jpg')
   user_angle_input = json.load(open('/path/to/user_angle_input.json'))
   
   # Smooth camera-angle interpolation using RTCurve or SRTM
   camera_angles = smooth_cam_interp(R, t, camera_image, user_angle_input)
   
   # Save output image and display result
   cv2.imwrite('/path/to/output_image.jpg', cv2.cvtColor(camera_angles, cv2.COLOR_RGB2BGR))
   ```

3. Rust Code Snippets:
   ```rust
   use std::fs;
   use jsonwebtoken;
   
   let mut user_angle_input = vec![];
   
   // Load user's input angle file
   {
       let filepath = fs::read_to_string("/path/to/user_angle_input.json").expect("Error reading user input");
       let json = serde_json::from_str(&filepath).expect("Error parsing JSON");
       user_angle_input = json;
   }
   
   // Calculate camera-angle matrix
   {
       let mut angles: Vec<f64> = vec![];
       for (index, angle) in user_angle_input.keys().enumerate() {
           angles.push((angle as f64) / 180.0 * M_PI);
       }
       R = matrix::from_array(angles).unwrap();
       t = vec![0; 2]; // initialize t to zeros for now
   }
   
   // Extract camera image and user input angles from camera image path and angle input file path
   {
       let mut camera_image: Vec<u8> = vec![];
       {
           let filepath = fs::read_to_string("/path/to/camera_image.jpg").expect("Error reading camera image");
           let image = image::open(&filepath).unwrap();
           camera_image = image.into_raw_mut().unwrap();
           let size = image.size();
           unsafe {
               for y in 0..size.1 {
                   for x in 0..size.0 {
                       let (r, g, b) = image.get_pixel((x as usize, y as usize)).unwrap();
                       camera_image[y * size.1 + x] = r;
                       camera_image[(y * size.1) + x + 1] = g;
                       camera_image[(y * size.1) + x + 2] = b;
                   }
               }
           }
       }
   
       // Smooth camera-angle interpolation using RTCurve or SRTM
       {
           let mut angles: Vec<f64> = vec![];
           for (index, angle) in user_angle_input.keys().enumerate() {
               angles.push((angle as f64) / 180.0 * M_PI);
           }
           R = matrix::from_array(angles).unwrap();
       }
   
       let mut camera_angles: Vec<f32> = vec![];
       for (index, angle) in user_angle_input.keys().enumerate() {
           camera_angles.push((angle as f32) * M_PI / 180.0);
       }
       let mut t: Vec<f64> = vec![];
       for (index, angle) in user_angle_input.keys().enumerate() {
           t.push(angle / 180.0 * M_PI);
       }
   
       // Extract user-defined camera angles from the camera image path and angle input file paths
   }
   
   // Smooth camera-angle interpolation using RTCurve or SRTM
   let mut rtc = RTCurve::new();
   rtc.set_user_data(&[R, t]);
   
   // Create a new frame from the user-defined camera angles
   let mut frame: Vec<f32> = vec![];
   {
       let mut image = image::ImageBuffer::from_vec(camera_image.len() as u64, camera_image);
       for (index, pixel) in image.channels().iter().enumerate() {
           let (r, g, b) = pixel.unwrap();
           frame.push((r, g, b));
       }
   }
   
   // Smooth camera-angle interpolation using SRTM or GeoJSON
   let mut geojson: Vec<f32> = vec![];
   {
       let mut json_data: Vec<f64> = vec![];
       let mut geometry: crate::geometry::Geometry = crate::geometry::Geometry::new();
       for (index, angle) in user_angle_input.keys().enumerate() {
           geometry.rotate(angle as f32 * M_PI / 180.0);
           let coords: Vec<f64> = geometry.coordinates();
           geometry.scale(1.0 + index as f64 / 500.0);
           geometry.translate(-coords[0] as f32, -coords[1] as f32);
           json_data.push(geometry.to_json());
       }
       geojson.push(json::parse(&json_data).unwrap().as_array().unwrap());
   }
   
   let mut path = "/path/to/output_image.jpg";
   {
       let filepath = fs::create_dir_all("/path").unwrap();
       filepath.push(path);
       if !filepath.exists() {
           fs::create_dir_all(&filepath).unwrap();
       }
       for (index, angle) in user_angle_input.keys().enumerate() {
           let path = format!("/path/to/{}.png", index);
           image::save(format!("{}.jpg", index), &frame[index]).unwrap();
           let mut img = image::load_from_file(&path).unwrap();
           img.resize(800, 600, crate::image::filter::FilterType::Nearest);
           let output = image::ImageBuffer::new_rgb8(img.width(), img.height());
           output.copy_from_slice(&img.to_rgba8().into_raw_mut());
           let mut image_data: Vec<u8> = Vec::with_capacity(output.len());
           output.save("output.jpg", &mut image_data).unwrap();
       }
   }
   
   Ok(())
}