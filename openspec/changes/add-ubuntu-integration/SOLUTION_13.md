# Solution for Task: Test launching `xclock` inside Geometry OS.

**Overview:**
The goal of this OpenSpec task is to provide a concise and detailed specification that outlines the protocol for wrapping Ubuntu sessions and applications into Geometry OS, integrating them within the Infinite Map Compositor. The objective is to enable Rusht compositor to handle legacy X11 applications, launch and manage Ubuntu GNOME/apps as "Window Particles", map Ubuntu apps to specific coordinates on the infinite Hilbert plane, and ensure clipboard and input pass-through between Host (Ubuntu) and Guest (Geometry OS).

**Objectives:**
1. XWayland implementation: Enable Rusht compositor to handle legacy X11 applications.
2. Standard desktop wrapper: Create a mechanism to launch and manage Ubuntu GNOME/apps as "Window Particles".
3. Spatial mapping: Map Ubuntu apps to specific coordinates on the infinite Hilbert plane.
4. Visual continuity: Ensure clipboard and input pass-through between Host (Ubuntu) and Guest (Geometry OS).

**Technical requirements:**
1. Rusht compositor: System with `systems/infinite_map_rs` package for handling XWayland.
2. Display connection: `WAYLAND_DISPLAY=geometry-0` parameter in the Rusht compositor's configuration file.
3. Coordination: New area agent to manage the coordination between Ubuntu and Geometry OS.

**Success criteria:**
1. XWayland is initialized successfully by Rusht compositor.
2. A standard Ubuntu app (e.g., `gnome-terminal`) renders correctly on the Guest (Geometry OS) using the standard Desktop Wrapper and spatial mapping.
3. A Python or Rust code snippet is provided for creating a Window Particle file, and a 'Next Step' command to launch and manage Ubuntu GNOME/apps as "Window Particles".
4. The Rusht compositor configuration is customized to integrate Ubuntu applications into the Infinite Map Compositor with standard desktop mapping.
5. A brief code snippet that runs a script to create a Window Particle file and launch Ubuntu apps on the Guest (Geometry OS) is provided for users to follow.