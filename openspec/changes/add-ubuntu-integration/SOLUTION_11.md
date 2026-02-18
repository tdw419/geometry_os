# Solution for Task: Implement texture mapping for XWayland buffers.

Purpose:
This spec defines the protocol for wrapping Ubuntu Substrate Integration with Geometry OS Infinite Map Compositor. The objective is to enable a standard desktop wrapper and spatial mapping of X11 applications on the infinite Hilbert plane, and ensure clipboard and input pass-through between host (Ubuntu) and guest (Geometry OS).

Objectives:
1. XWayland Implementation: Enable Rusht compositor to handle legacy X11 applications.
2. Standard Desktop Wrapper: Create a mechanism to launch and manage UbuNTU's GNOME/apps as "Window Particles".
3. Spatial Mapping: Map UbuNTU apps to specific coordinates on the infinite Hilbert plane.
4. Visual Continuity: Ensure clipboard and input pass-through between Host (UbuNTU) and Guest (Geometry OS).

Technical Requirements:
1. Compositor: System `systems/infinite_map_rs`
2. Feature: `smithay/xwayland`
3. Display Connection: `WAYLAND_DISPLAY=geometry-0`
4. Coordination: New Area Agent

Success Criteria:
1. XWayland is initialized successfully by the Rusht compositor.
2. A standard UbuNTU app (e.g., `gnome-terminal`) renders on the infinite Hilbert plane and passes over to the Geometry OS.
3. A brief snippet of python or rust code required to create or modify file paths. A brief snippet of a "next step" command for the user is provided.
4. The spec follows clear markdown formatting.