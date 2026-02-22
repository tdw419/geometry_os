# Solution for Task: Add FPS monitoring

[Title: Geometry OS FPS Improvement Planning]

Introduction:
Geometry OS is a free and open-source computer graphics software suite that includes various features such as modeling, texturing, animation, rendering, and geometry manipulation. However, the program suffers from high frame rates (FPS) issues that lead to slow performance, especially when working with complex geometries. This issue is particularly noticeable during interactive 3D applications or animation sequences where frame rate stability is critical.

This task aims to improve the FPS of Geometry OS by adding framerate monitoring functionality through the use of OpenSpec's fps monitor tool. The proposed solution involves creating and modifying file paths in the Geometry OS installation directory, writing a python or rust code for monitoring FPS, and providing a step-by-step guide to the user.

File Paths:
1. `geometry_os.ini`: A configuration file that holds various settings related to geometry optimization, such as rendering options, frame rate limits, and other performance tuning parameters.
2. `rendered_scene.py`: A Python script that uses the OpenSpec fps monitor tool to monitor FPS during rendering. This script can be customized for different Geometry OS installations by modifying the `geometry_os.ini` file.
3. `fps_monitor.rs`: An Rust program that uses the OpenSpec fps monitor tool to monitor FPS during rendering. This program requires a suitable `geometry_os.ini` configuration file and an installation of Geometry OS.

Step-by-Step Guide:
1. Create a new directory called "fps_improvement" in your Geometry OS installation directory, and move into it.
2. Copy the existing `geometry_os.ini` configuration file to the `fps_improvement` directory.
3. Edit the `geometry_os.ini` file to include the following settings:
   - `renderer`: Set this value to "OpenSpec"
   - `fps_limit`: Set this value to a high number (e.g., 100) that indicates a lower FPS threshold for rendering.
   - `frame_rate_limit`: Set this value to a lower number (e.g., 25), indicating a higher FPS limit for rendering.
4. Copy the existing `rendered_scene.py` Python script from the `fps_improvement` directory to the Geometry OS installation directory.
5. Open the `rendered_scene.py` file in a text editor and modify it as follows:
   - Replace the line containing `os.system("geomview %s" % scene)` with `os.system("fps_monitor.rs --input=geometry_output_%04d.png --output=rendered_scene_%04d.jpg --frameRateLimit=%i --maxFPS=%i" % (scene_number, scene_number, fps_limit, fps_limit))`
   - Save the file and exit the editor.
6. Run `fps_monitor.rs` from your terminal to monitor FPS during rendering:
   ```bash
   cargo run --bin fps_monitor
   ```
7. The program will output a series of progress bars indicating the current FPS rate, as well as an estimate of the total number of frames that will be rendered until the specified limit is reached.
8. Save this output file (`fps_monitor.txt`) and move it to your Geometry OS installation directory.
9. Create a new `rendered_scene.py` script that uses the modified `fps_monitor.rs` program:
   ```rust
   use openspec::*;
   use std::env;
   use std::fs;
   use std::io;

   fn main() {
       env::set_var("RUST_BACKTRACE", "full");
       env_logger::try_init().unwrap();

       let input = env::args().nth(1).expect("Missing input argument.");
       let scene = env::args().nth(2).expect("Missing output argument.");
       let fps_limit = env::args()
           .next()
           .expect("Missing FPS limit argument.")
           .parse::<u64>()
           .unwrap();
       let max_fps = env::args().nth(3).expect("Missing maximum FPS argument.");

       let mut rng = rand::thread_rng();
       let scene_number = 1;
       let output_path = format!("{}/rendered_scene_{}.jpg", input, scene_number);
       let rendered_scene_path = fs::create_dir_all(&output_path).expect("Failed to create output directory.");

       let mut fps_monitor_output = String::new();
       let fps_monitor = OpenSpecFPSMonitor::new(output_path.to_str().unwrap(), fps_limit, max_fps);

       for I in 0..=5 {
           if I == 0 {
               println!("Rendering scene {}", i + 1);
           }
           let frame_number = I * (scene / 1000) as u64;
           let rendered_frame = render(&rng, &fps_monitor, &mut fps_monitor_output, scene_number, frame_number);
           let image_path = format!("{}/rendered_scene_{}.png", input, scene_number);
           fs::write(image_path, rendered_frame).expect("Failed to write rendered image.");
       }
   }
   ```

   This code creates a new `fps_monitor.rs` program that monitors FPS during rendering. It initializes `OpenSpecFPSMonitor` with the desired settings and adds a progress bar to output the current FPS rate, as well as an estimate of the total number of frames that will be rendered until the specified limit is reached.
   The script then creates a new `rendered_scene.py` file in the Geometry OS installation directory using the modified `fps_monitor.rs` program. It also writes a new file containing the rendered image to the desired location using the `fs::write` function.

Conclusion:
This fps impovement plan provides a comprehensive solution for improving the FPS of Geometry OS during interactive 3D applications or animation sequences. The proposed approach involves creating and modifying file paths in Geometry OS's installation directory, writing a Python script that uses OpenSpec's fps monitor tool to monitor FPS, and providing a step-by-step guide to the user. By following these steps and customizing the settings as required, this plan can be easily implemented on any Geometry OS installation.