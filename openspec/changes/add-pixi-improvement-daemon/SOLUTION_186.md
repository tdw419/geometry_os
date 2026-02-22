# Solution for Task: Measure FPS with 1000 tiles

Title: Improving Geometry OS with PiXi Improvement Daemon

Introduction:
The task of change ID `add-pixi-improvement-daemon` is to enhance the performance of OpenSpec by implementing a daemon that monitors and adjusts the rendering process for 1000 tiles. The goal is to improve FPS (frames per second) while keeping the rendering time consistent.

Context:
The Geometry OS software is a highly complex and computationally-intensive application with millions of lines of code. To optimize its performance, we need to identify and eliminate bottlenecks that can slow down the system. In this task, we will add a daemon that monitors the rendering process for 1000 tiles and adjusts the processing parameters accordingly.

Requirements:
The daemon should be able to monitor the rendering process and adjust its settings as needed based on the performance metrics collected. The daemon should run in the background and communicate with OpenSpec to update the rendering time and FPS values.

Task Breakdown:
1. File paths that need to be created or modified:
   - A script `pixi_daemon.py` that initializes the daemon and starts it up. This script should have a few options for the user to configure the daemon.
      - `-d`: specify the directory where the daemon should store its log files.
      - `-p`: specify the path of the PiXi profiler executable (default: `/usr/bin/pipxi`).
   - A file `pixi_settings.json` that contains the daemon's settings, including the rendering parameters and optimization targets. The JSON should be structured as follows:
      ```json
      {
          "optimize_rendering": true,
          "tiles_per_frame": 256,
          "target_fps": 60,
          "max_memory_usage_percentage": 80,
          "profile_directory": "/var/log/piXi"
      }
      ```
   - A script `start.sh` that launches the daemon and configures it to start at boot. This script should use the `systemd` package manager to create a service file and start the daemon on system boot.
   
2. Python or Rust code:
   - A Python script `pixi_daemon.py` that listens for incoming connections from OpenSpec, receives the rendering parameters specified by the user, adjusts the settings as needed, and updates the FPS values in real-time. This script should communicate with OpenSpec using the `pyspecsession` module.
   - A Rust program named `pixi_daemon` that implements the Python script for running on a Linux system. The daemon should be able to handle multiple OpenSpec sessions concurrently and manage the communication between OpenSpec and itself.

3. 'Next Step' command:
   - Create a file named `next_step.md` with the following content:
      ```markdown
      Next Step:
      * Configure OpenSpec session settings to optimize rendering for 1000 tiles
      * Monitor FPS and adjust as needed (using the piXi profiler)
      * Launch a command-line tool that compares the rendering time with the optimized setting and logs it to a file
      ```
   - Save this file in the same directory where the `pixi_daemon.py` Python script is located. This will be the 'Next Step' command for the user during the task completion.

4. Testing:
   - Run OpenSpec with the daemon enabled and see if it improves FPS while keeping rendering time consistent.
   - If there are any issues, update the daemon settings as needed and try again.
   - Once everything is working correctly, remove the 'Next Step' command from the file and make sure to communicate with OpenSpec using `pyspecsession`.

Conclusion:
By implementing a daemon that monitors and adjusts the rendering process for 1000 tiles in Geometry OS, we can improve FPS while keeping rendering time consistent. This enhancement will be valuable for improving the overall user experience of OpenSpec on Linux systems.