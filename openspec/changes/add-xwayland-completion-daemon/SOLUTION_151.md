# Solution for Task: Reduce context window size

[OpenSpec] Proposaal: XWayland Completion Daemon

Metadata
- Propose ID: `add-xwayland-completion-daemon`
- Status: Drafter
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: Add-lm-studio-compositor-completion-daemon, Add-ubuntu-integration

Overview
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code. Specifically, the daemon should implement the `XwmHandler` trait and related window management logic, including:

1. The `XwmHandler` trait: This trait defines the set of functions and properties that a compositor needs to provide for a Wayland window manager. These functions and properties are responsible for setting up the surface for the window, configuring it for input, managing focus, and more.
2. Window decoration rendering: Title bars, borders, buttons. The daemon should be able to render these elements in a consistent and visually appealing way.
3. Input focus coordination: Keyboard/mouse routing. This involves mapping the keyboard/mouse events to Wayland surfaces and managing their interactions with other windows.
4. Surface mapping: X11 surfaces → Wayland surfaces → Window particles. The daemon should be able to create and manage these particle objects, which represent the actual display surface that a window is rendered onto.

Problem Statement
The Ubuunt integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. XwmHandler trait: This trait defines the set of functions and properties that a compositor needs to provide for a Wayland window manager.
2. Windoing decoration rendering: Title bars, borders, buttons. The daemon should be able to render these elements in a consistent and visually appealing way.
3. Input focus coordination: Keyboard/mouse routing. This involves mapping the keyboard/mouse events to Wayland surfaces and managing their interactions with other windows.
4. Surface mapping: X11 surfaces → Wayland surfaces → Window particles. The daemon should be able to create and manage these particle objects, which represent the actual display surface that a window is rendered onto.

Proposed Solution
Here's an overview of how we can implement this proposaal using OpenSpec:

1. Determine the file paths required for the Python code and the Rust code. This will involve creating directories, setting up files, and running scripts.
2. Define a clear Markdown format to provide instructions on how to create these files or run scripts. For example:
   ```
   [Python]
   To create the Python code, run `python setup.py build && python setup.py develop` in your terminal. Then, install the package with `pip install xwayland-completion-daemon`.
   
   [Rust]
   To create the Rust code, you'll need to install XWayland, X11, and Wayland-ssdt (if required) by running `sudo apt-get install libx11-xcb-dev libxcb-dri3-0 libxcb-dri2-0 libxkbcommon-x11-dev`. Then, run the following command to compile the Rust code:
   
   ```bash
   cargo build --release
   ```
   
   And finally, run the daemon by running `cargo run` in your terminal.
   
3. Create a Markdown file that provides an overview of the Python and Rust files required for each part of the proposaal, along with instructions on how to install and compile them. For example:
   ```
   [Python]
   To create the Python code, run `python setup.py build && python setup.py develop` in your terminal. Then, install the package with `pip install xwayland-completion-daemon`.
   
   [Rust]
   To create the Rust code, you'll need to install XWayland, X11, and Wayland-ssdt (if required) by running `sudo apt-get install libx11-xcb-dev libxcb-dri3-0 libxcb-dri2-0 libxkbcommon-x11-dev`. Then, run the following command to compile the Rust code:
   
   ```bash
   cargo build --release
   ```
   
   And finally, run the daemon by running `cargo run` in your terminal.
   
   The Markdown file should include information on how to create and install each package or script required for the proposaal. This could include links to the package/script repositories, installation instructions, and any other relevant details. 

4. Create an OpenSpec user interface that provides the necessary information about each of these tasks, as well as a "Next Step" command for the user to complete after completing the instructions provided in the Markdown file. The UI could be designed using HTML, CSS or Bootstrap and should include clear labels and instructions for each step.

5. Test the daemon by running it on Ubuntu 20.04 LTS with Wayland enabled, ensuring that it completes the required tasks and creates the necessary files/scripts as required.

Conclusion
This proposaal provides a simple, comprehensive solution to implement XWayland Completion Daemon using OpenSpec. By providing an easy-to-follow Markdown file format with clear instructions for creating Python and Rust code, installing dependencies, and compiling the daemon, we can ensure that the daemon is fully functional. Additionally, an OpenSpec user interface provides a streamlined way for users to complete each of these tasks while ensuring that everything is properly set up and working correctly.