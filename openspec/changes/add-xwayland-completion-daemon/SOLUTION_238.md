# Solution for Task: Generation completes in < 10 minutes total

[Meta Data](https://github.com/GeometryOS/OpenSpec/blob/main/Additions/add-xwayland-completion-daemon/meta.md)

## Meta Data
- Propose ID: `add-xwayland-completion-daemon`
- Status: Drafter
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon should be able to handle all of the necessary steps for generating, testing, and deploying the required code, including:

1. Generating the required LM Studio files for XWayland/Ubuntu integration.
2. Testing the generated code with a Python script to ensure it works correctly on both systems.
3. Creating required files in the `Xwayland/Ubuxt` directories, such as `xwm_handler.h`, `windo.c`, and other relevant files.
4. Deploying the generated code using the appropriate toolchain (e.g. Ubutu 20.04).
5. Documenting the complete process in a clear, concise Markdown format.

## Problem Statement

The Ubuunt integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. XwmHandler trait - X11 window management callbacks
2. Windower decoration rendering - Title bars, borders, buttons
3. Input focus coordination - Keyboard/mouse routing
4. Surface mapping - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rusht code that follows well-established patterns in Smithay compositors.

## Propousal

Please provide:

1. File paths that need to be created or modified.
2. A brief snippet of the Python/Rust code required.
3. A "Next Step" command for the user (e.g. Create a file, run a script).

For Python:
- The Python script should have the following structure:
  - The `generate_xwayland_handler` function should take the input arguments (`lm_studio_config_path`, `path_to_lm_files`) and create the XWayland/Ubuxt integration code. This will be stored in a file named `xwm_handler.h`.
  - The `generate_windo` function should take the input arguments (`lm_studio_config_path`, `path_to_lm_files`) and generate the XWayland/Ubuxt window decoration rendering code. This will be stored in a file named `windo.c`.
  - The `generate_input_focus` function should take the input arguments (`lm_studio_config_path`, `path_to_lm_files`) and generate the XWayland/Ubuxt input focus coordination code. This will be stored in a file named `input_focus.h`.
  - The `generate_surface_mapping` function should take the input arguments (`lm_studio_config_path`, `path_to_lm_files`) and generate the XWayland/Ubuxt surface mapping code. This will be stored in a file named `surface_mapping.h`.
  - The `generate_all_code` function should take all input arguments (`lm_studio_config_path`, `path_to_lm_files`) and generate the XWayland/Ubuxt integration code. This will be stored in a file named `xwayland_integration.h`.
- The Python script should use the LM Studio files to create the requested XWayland/Ubuxt integration code, with the appropriate comments explaining the purpose of each section.
- The Python script should also include comments explaining how to run the generated code using a Python script, and any necessary dependencies or configuration required for this.

For Rust:
- The `generate_xwayland_handler` function should take the input arguments (`lm_studio_config_path`, `path_to_lm_files`) and create the XWayland/Ubuxt integration code in a file named `xwm_handler.rs`.
- The `generate_windo` function should take the input arguments (`lm_studio_config_path`, `path_to_lm_files`) and generate the XWayland/Ubuxt window decoration rendering code in a file named `windo.rs`.
- The `generate_input_focus` function should take the input arguments (`lm_studio_config_path`, `path_to_lm_files`) and generate the XWayland/Ubuxt input focus coordination code in a file named `input_focus.rs`.
- The `generate_surface_mapping` function should take the input arguments (`lm_studio_config_path`, `path_to_lm_files`) and generate the XWayland/Ubuxt surface mapping code in a file named `surface_mapping.rs`.
- The `generate_all_code` function should take all input arguments (`lm_studio_config_path`, `path_to_lm_files`) and generate the XWayland/Ubuxt integration code in a file named `xwayland_integration.rs`.
- The Rust script should use the LM Studio files to create the requested XWayland/Ubuxt integration code, with the appropriate comments explaining the purpose of each section.
- The Rust script should also include comments explaining how to run the generated code using a Rust script, and any necessary dependencies or configuration required for this.

I hope that helps! Let me know if you have any questions.