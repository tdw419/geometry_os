# Solution for Task: Test window visibility

--- Proposaal ---
# OpenSpec Propoasaal: XWayland Completion Daemon

## MetaData
- **Proposal ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. This will allow for a more seamless and efficient integration process.

## Problem Statement

The Ubuxtu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Window decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors. However, it requires manual intervention to create the necessary files and scripts. This proposal aims to automate this process using Python/Rust.

## Proposal
1. File paths: The proposal will require creating two new subfolders in the `workspace` directory:
   - `lm-studio`: This will contain all Python-based code used by LM Studio, including XWayland integration and other OS-specific libraries.
   - `ubuntu-integration`: This will contain all Rust-based code used by Ubuntu Integration, including XWayland integration and other OS-specific libraries.
2. Python script: A new Python script will be created in the `workspace/lm-studio` directory that automatically creates the necessary files and scripts needed for the XWayland/Ubuntu integration. The script will prompt the user to input file paths, which are then used to create the necessary Python files in the `lm-studio` subfolder.
3. Rust script: A new Rust script will be created in the `workspace/ubuntu-integration` directory that also automates the creation of the necessary files and scripts needed for Ubuntu integration. The script will prompt the user to input file paths, which are then used to create the necessary Rust files in the `ubuntu-integration` subfolder.
4. Automated testing: Once the Python/Rust code is complete, it will be tested thoroughly to ensure that it generates all necessary files and scripts as expected.
5. Documentation: The documentation for the new daemon will include a step-by-step guide on how to create the necessary files and scripts using both Python and Rust. This will allow for easy integration with other Geometry OS components.

Overall, this proposal seeks to automate the XWayland/Ubuntu integration process in Geometry OS by providing a seamless workflow that requires minimal manual intervention.