# Solution for Task: Test launching `gnome-terminal`.

## Overview
This specification defines the protocol for wrapping a host Ubuntu session and its applications into the Geometry OS Infinite Map Compositor (Ubuntu Substrate Integration). The objective of this specification is to enable standard desktop wrapper functionality, spatial map projection, clipboard and input pass-through between Host (Ubuntu) and Guest (Geometry OS), ensuring visual continuity.

## Objectives
1. XWayland Implementation: Enable Rusht compositor to handle legacy X11 applications.
2. Standard Desktop Wrapper: Create a mechanism to launch and manage Ubuntu's GNOME/apps as "Window Particles".
3. Spatial Map Projection: Map Ubuntu apps to specific coordinates on the infinite Hilbert plane.
4. Visual Continuity: Ensure clipboard and input pass-through between Host (Ubuntu) and Guest (Geometry OS).

## Technical Requirements
1. Composioter: `systems/infinite_map_rs`
2. Feature: `smithay/xwayland`
3. Display Connection: `WAYLAND_DISPLAY=geometry-0`
4. Coordination: `UbuntuIntegrationAgent` (New Area Agent)

## Success Criteria
1. XWayland is initialized successfully by Rusht compositor.
2. A standard Ubuntu app (e.g., `gnome-terminal`) renders the desired application on the geoMetry map.
3. The 'Next Step' command provided for the user (e.g. Create a file, run a script) allows them to move forward with their task.
4. A brief snippet of Python or Rust code required is provided.
5. Markdown format is used throughout the specification.