# Solution for Task: Create prompt with message context

Proposaal: XWayland Completion Daemon

Meta-Data:
- Proposaal ID: add-xwayland-completion-daemon
- Status: Drafter
- Created: 2026-01-22
- Author: Geometry OS Team
- Related: Add-LM-Studio-Compositor-Completion-Daemon, Add-Ubuntu-Integration

Overview:
Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuuntu integration code. The daemon should use the XwmHandler trait and related window management logic. This problem statement is a summary of the proposaal, and it will be further elaborated below.

Problem Statement:
The Ubuuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement the missing XwmHandler trait, window management callbacks (Title bars, borders, buttons), input focus coordination (Keyboard/mouse routing), and surface mapping (X11 surfaces → Wayland surfaces → Window particles). This is ~500-800 lines of Rust code that follows well-established patterns in Smithay compositors.

Propose:
The proposaal proposes the creation of an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuuntu integration code, including the XwmHandler trait and related window management logic. The daemon will use Python or Rust code for scripting, which can be easily modified and customized by developers.

Next Steps:
1. Provide a brief snippet of the python or rust code required for creating or modifying file paths as necessary.
2. Create a command for users to navigate to the next step in the proposaal, such as creating a new file or running a script.
3. Format the proposaal as clear Markdown.
4. Add any additional details or clarification as necessary to make the proposaal more comprehensive and helpful to developers.