# Solution for Task: Import into `compositor_state.rs`

[MetaData]

# OpenSpec Proposaal: XWayland Completion Daemon

## Meta Data
- Proposaal ID: add-xwayland-completion-daemon
- Status: Draft
- Created on: 2026-01-22
- Author: Geometry OS Team
- Related: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

The daemon should be able to:
1. Generate a complete implementation of the `XwmHandler` trait for X11 window management callbacks (title bars, borders, buttons)
2. Implement title bar rendering using the LM Studio `WindowParticles` trait and keyboard/mouse routing
3. Coordinate input focus across X11 surfaces and Wayland surfaces to ensure proper keyboard/mouse navigation
4. Map surface types (X11 surfaces -> Wayland surfaces) and manipulate Window Particles for XWayland/Ubuntu integration

The daemon should follow well-established patterns in Smithay compositors and be able to provide:
1. A brief snippet of Python or Rust code required to create or modify the file paths needed for each step (e.g. Creating a file, running a script)
2. A clear Markdown format with steps followed by a Next Step command for the user (e.g. Creating a file, running a script)
3. Clear documentation and comments throughout the daemon code to aid in maintenance and development of future versions.

## Proposal

The proposed solution uses the Smithay Compositor's `smithay-lrm` library for LM Studio integration. The daemon will generate a complete implementation of the `XwmHandler` trait, which will automatically add title bars, borders, and buttons to Wayland windows as needed. It will also implement title bar rendering using the LM Studio `WindowParticles` trait to create visually pleasing, interactive user interfaces.

To coordinate input focus across X11 surfaces and Wayland surfaces, a new `InputFocusedSurfaces` trait will be added that will allow for eventual mapping of surface types (X11 surfaces -> Wayland surfaces) based on the current focused surface. This will also ensure proper keyboard/mouse navigation in Wayland integration.

To map surface types (X11 surfaces -> Wayland surfaces), a new `SurfaceMapping` trait will be added, which will allow for surface mapping across both X11 and Wayland surfaces. This will enable efficient navigation of both surfaces using keyboard/mouse, making it easier to transition between X11 and Wayland compositors while still maintaining smooth user experience.

To implement title bar rendering using the LM Studio `WindowParticles` trait, a new `TitleBarRenderer` struct will be created that will manage the creation and destruction of Window Particles for each surface being rendered to ensure proper keyboard/mouse navigation. This will also allow for customization of the appearance of the title bars and buttons in XWayland/Ubuxt integration, as needed.

To map surface types (X11 surfaces -> Wayland surfaces) and manipulate Window Particles for XWayland/Ubuxt integration, a new `WindowParticleMapper` trait will be added that will allow for customization of the appearance of window particles in both X11 and Wayland compositors. This will ensure proper keyboard/mouse navigation across different surface types and make it easier to transition between compositors while maintaining a smooth user experience.

Finally, the daemon will use Markdown comments throughout its code to aid in maintenance and development of future versions. Each step will be clearly outlined, with clear documentation and comments for each component of the daemon. This will help ensure that future versions are as easy to maintain and debug as possible.