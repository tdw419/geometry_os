# OpenSpec: Ubuntu Substrate Integration

## Overview
This specification defines the protocol for wrapping a host Ubuntu session and its applications into the Geometry OS Infinite Map Compositor.

## Objectives
1. **XWayland Implementation**: Enable the Rust compositor to handle legacy X11 applications.
2. **Standard Desktop Wrapper**: Create a mechanism to launch and manage Ubuntu's GNOME/apps as "Window Particles".
3. **Spatial Mapping**: Map Ubuntu apps to specific coordinates on the infinite Hilbert plane.
4. **Visual Continuity**: Ensure clipboard and input pass-through between Host (Ubuntu) and Guest (Geometry OS).

## Technical Requirements
- **Compositor**: `systems/infinite_map_rs`
- **Feature**: `smithay/xwayland`
- **Display Connection**: `WAYLAND_DISPLAY=geometry-0`
- **Coordination**: `UbuntuIntegrationAgent` (New Area Agent)

## Success Criteria
- [ ] XWayland is initialized successfully by the Rust compositor.
- [ ] A standard Ubuntu app (e.g., `gnome-terminal`) renders on the infinite map.
- [ ] Mouse/Keyboard input works seamlessly inside the wrapped Ubuntu window.
