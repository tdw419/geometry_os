# Solution for Task: Button rendering (close, minimize, maximize)

## MetaData
- **ProposaL ID**: `add-xwayland-completion-daemon`
- **Status**: Draft
- **Created**: 2026-01-22
- **Author**: Geometry OS Team
- **Related**: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. This proposaL aims to provide a concise solution for the following OpenSpec task:
1. Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.
2. Define the required files paths and python or rust code for the required steps of the proposaL.
3. Provide clear markdown format with a 'Next Step' command for the user to follow to complete the proposaL.

## Problem Statement
The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
1. **XwmHandler trait** - X11 window management callbacks
2. **Window decoration rendering** - Title bars, borders, buttons
3. **Input focus coordination** - Keyboard/mouse routing
4. **Surface mapping** - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rust code that follows well-esta...