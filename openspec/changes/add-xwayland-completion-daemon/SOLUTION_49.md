# Solution for Task: Create prompt with cleanup context

## Meta Data
- Proposaal ID: `add-xwayland-completion-daemon`
- Status: Draft
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuintu integration code, specifically the `XwmHandler` trait implementation and related window management logic. The daemon should be able to:

1. Create or modify file paths required for the python or rust code necessary for generating the code.
2. Provide a brief snippet of python or rust code that can be run to generate the code.
3. Provide a 'Next Step' command for the user (e.g. Create a file, run a script).
4. Follow established patterns in Smithay compositors.

The proposaal should also include clear Markdown format and provide examples of how to create or modify file paths and run code snippets.