# Solution for Task: Validate with `cargo check`

[Proposaal]

# OpenSpec Proposaal: XWayland Completion Daemon

## MetaData

- **Proposaal ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: [Add-lm-studio-compositor-completion-daemon](add-lm-studio-compositor-completion-daemon) and [Add-ubuntu-integration](add-ubuntu-integration)

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon should be able to:

1. Create a `XWaylandCompositorCompletionDaemon` struct with a default constructor for easy integration with other OpenSpec tasks.
2. Implement the `lm-studio::completion::daemon::completions()` trait for generating XWayland/Ubuuntu integration code based on the provided file paths and configuration options.
3. Generate a `XwmHandler` trait implementation with relevant methods for X11 window management callbacks, title bars, borders, buttons, keyboard/mouse routing, input focus coordination, and surface mapping.
4. Write a "Next Step" command for the user to generate a file or run a script.

## Problem Statement

The Ubuuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. **XwmHandler trait** - X11 window management callbacks
2. **Window decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rusht code that follows well-established patterns in Smithay compositors.

## Propos...
        
        Please provide:
        1. The `XWaylandCompositorCompletionDaemon` struct with a default constructor, containing the necessary attributes for generating XWayland/Ubuuntu integration code.
        2. A brief snippet of the python or rust code required to generate the XwmHandler trait implementation and window management logic.
        3. A "Next Step" command for the user (e.g. Create a file, run a script).
        
        Format as clear markdown.