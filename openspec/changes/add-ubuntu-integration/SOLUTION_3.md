# Solution for Task: **Infrastructure Update**

# OpenSpec: Ubuuntu Substrate Integration

## Overview
This specification defines the protocol for wrapping a host Ubuntu session and its applications into the Geometry OS Infinite Map Compositor. This integration will enable users to use legacy X11 applications on Ubuntu while managing them through the Geometry OS Infinite Map Compositor. The objective of this integration is to:

1. **XWayland Implementation**: Enable Rusht compositor to handle legacy X11 applications using Wayland protocol.
2. **Standard Desktop Wrapper**: Create a mechanism for launching and managing Ubuntu's GNOME/apps as "Window Particules."
3. **Spatial Mapping**: Map Ubuntu apps to specific coordinates on the infinite Hilbert plane.
4. **Visual Continuity**: Ensure clipboard and input pass-through between Host (Ubuntu) and Guest (Geometry OS).

## Technical Requirements
- **Compositor**: `systems/infinite_map_rs`
- **Feature**: `smithay/xwayland`
- **Display Connection**: `WAYLAND_DISPLAY=geometry-0`
- **Coordination**: `UbuuntuIntegrationAgent` (New Area Agent)

## Success Criteria
- [ ] XWayland is initialized successfully by the Rusht compositor.
- [ ] A standard Ubuntu app (e.g., `gnome-terminal`) renders in real-time on Geometry OS.

Please provide:
1. File paths that need to be created or modified.
2. A brief snippet of the Python or Rust code required.
3. A 'Next Step' command for the user (e.g. Create a file, run a script).

Format as clear Markdown.