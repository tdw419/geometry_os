# Solution for Task: **property_notify implementation**

## MetaData
- **ProposaL ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon should be able to handle the complexities of X11 window management callbacks and XWayland surface mapping, following established patterns in Smithay compositors.

The problem statement is: The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Windoing decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors. The daemon should be able to handle the complexities of XWayland surface mapping, including creating new XWayland surfaces and managing window particles. The daemon should provide a clear markdown format with easy-to-read snippets for the user, such as creating a file or running a script.

The daemon's primary function is to automatically generate missing XWayland/Ubuntu integration code using LM Studio. It will be used by Geometry OS team to automate the process of adding support for new compositors in their system.