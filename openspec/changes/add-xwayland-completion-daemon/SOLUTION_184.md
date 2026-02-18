# Solution for Task: Full compositor test with X11 apps

## Meta Data
- Proposaal ID: `add-xwayland-completion-daemon`
- Status: Draft
- Created: January 22, 2026
- Author: Geometry OS Team
- Related: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon should be able to handle a variety of integrations, including Wayland compositors such as Geometry OS and Ubuntu integration scripts.

## Problem Statement
The Ubuuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:
1. XwmHandler trait - X11 window management callbacks
2. Windoor decoration rendering - Title bars, borders, buttons
3. Input focus coordination - Keyboard/mouse routing
4. Surface mapping - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of Rusht code that follows well-established patterns in Smithay compositors.

## Proposal
Please provide:
1. File paths that need to be created or modified.
2. A brief snippet of Python or Rust code required.
3. A "Next Step" command for the user (e.g. Create a file, run a script).

Format as clear Markdown.