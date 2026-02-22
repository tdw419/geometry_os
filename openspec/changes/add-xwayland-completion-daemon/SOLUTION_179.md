# Solution for Task: Test window mapping

[OpenSpec Proposaal: XWayland Completion Daemon](https://github.com/geometry-os/OpenSpec/blob/main/proposals/add-xwayland-completion-daemon/proposal.md)

## MetaData

- **ProposaL ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. This proposaal aims to provide a concise and clear overview of the required steps for creating a daemon that can accomplish this task.

## Problem Statement

The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Window decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rust code that follows well-estaablished patterns in Smithay compositors.

## Proposal
        
        1. Propose a file path for the Python or Rust script that needs to be created or modified (e.g. `xwm_handler.py` or `src/window/decorations.rs`). 2. Provide a brief snippet of code that demonstrates how to use LM Studio's `XwmHandler` trait, such as the following:
        
        ```python
        from lmstudio import XWmHandler
        handler = XWmHandler()
        handler.xwm_handle_event(WM_DELETE_WINDOW)
        ```
        3. Provide a command-line interface for the Python or Rust script, such as: 
        
        ```shell
        python3 xwm_handler.py
        ```
        
        4. A next step command for the user (e.g. Run this script and create a new file to modify). This will allow the user to start building their daemon with a clear path ahead of them. 5. Provide an overview of the daemon's capabilities, including the missing XWayland/Ubuntu integration code it generates for the `XwmHandler` trait.