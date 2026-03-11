# Solution for Task: Minimize/maximize

Title: Minimize/Maximize

## MetaData

- Proposaal ID: `add-xwayland-completion-daemon`
- Status: Draft
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon should be able to create a minimal or maximum version of this code based on user input, depending on their preference for minimizing or maximizing the complexity. The daemon should also include a brief snippet of Python/Rust code required for the LM Studio integration to work.

The problem statement can be summarized as follows:

1. The Ubuunt integration infrastructure is complete (XWayland spawns, Python agent ready). However, we need to implement the following features:
    1. XwmHandler trait - window management callbacks (e.g., title bars, borders, buttons)
    2. Windoing decoration rendering (e.g., Title bars, borders, buttons)
    3. Input focus coordination (e.g., Keyboard/mouse routing)
    4. Surface mapping (X11 surfaces → Wayland surfaces → Window particles)

The proposaal will provide:

1. Snippets of Python and Rust code required for LM Studio integration to work. The snippet can be created using the Smithay toolkit.
2. File paths that need to be created or modified, as well as a brief explanation of what each file should contain.
3. A "Next Step" command for the user (e.g., create a file, run a script)

This proposaal is intended to provide a concise and clear overview of the proposed solution, but additional details may be necessary depending on the specific use case. If you require further clarification or have any questions, feel free to ask!