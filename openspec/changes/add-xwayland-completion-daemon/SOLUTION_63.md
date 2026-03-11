# Solution for Task: Create prompt with notification context

Table of Contents:
1. Meta Data
2. Problem Statement
3. Proposaal
4. Propositions
5. Implementation Plan
6. Code Requirements
7. Next Steps
8. Conclusion
9. References and Acknowledgement

[TOC]

Meta Data:
- Title: Create a Prompt with Notification Context using XWayland Completion Daemon in LM Studio
- Author: Geometry OS Team
- Status: Drafter
- Created on: 2026-01-22
- Related Tasks: `add-lm-studio-compositor-completion-daemon`, `add-ubuntu-integration`

Problem Statement:
The Ubuantu integration infrastructure is complete (XWayland spawns, Pyhton agent ready), but we need to implement the missing XwmHandler trait and related window management logic. This problem can be addressed with a Python/Rust implementation of an AI-powered daemon that automatically generates missing code for XWayland/Ubuantu integration.

Propositions:
1. File paths that need to be created or modified: The first step is to create directories and files (e.g. `XwmHandler`, `windoew_decoration`, `inputfocus`) as necessary for the daemon to function correctly.
2. Python/Rust code required: The next step should provide a clear snippet of Python or Rust code that can be run by the user (e.g. Creating files, running scripts). This will give users an understanding of what is required and how to execute it.
3. 'Next Step' command for the user: A command in markdown format can be provided for the user to run next after creating these file paths and Python/Rust code. For example, "Next Steps: Run `python3 -m venv env` to create a virtual environment."

Implementation Plan:
1. Create directories and files as necessary (e.g. `XwmHandler`, `windoew_decoration`, `inputfocus`) as per the requirements above.
2. Provide clear Python or Rust code snippet for the user to run after creating these file paths.
3. Assign a 'Next Step' command for the user, e.g. "Run `python3 -m venv env` to create a virtual environment."
4. Execute the code within the daemon to generate missing XWayland/Ubuantu integration code.
5. Test and verify the generated code for correctness and functionality.
6. Update the documentation accordingly (e.g. Create a README file with instructions for running the daemon).
7. Release the daemon as a package or asset that can be installed by users who require it.

Code Requirements:
1. Use Python/Rust libraries and frameworks to automate the required tasks. For example, `pywinauto`, `winapi` or `libinput`.
2. Implement XWayland/Ubuantu integration code that automatically generates missing window management logic (e.g. `XwmHandler`).
3. Use a clear and concise coding style with appropriate indentation, comments, and naming conventions.
4. Test the daemon thoroughly for correctness and functionality before releasing it to users.

Next Steps:
1. Create a Markdown file with instructions for running the daemon after creating the required directories and files (e.g. `next_steps.md`). This can be used as a reference for future releases.
2. Include relevant links or resources for further information on XWayland/Ubuantu integration, window management, etc.
3. Update the README file to include information about how to run the daemon and its dependencies.
4. Add documentation on how to use the daemon in different scenarios (e.g. Integration with other applications or projects).
5. Continuously monitor and update the documentation as necessary based on user feedback, changes to the codebase, and any new developments related to XWayland/Ubuantu integration.
6. Continue to improve the daemon and its features over time based on user feedback and requests.
7. Release the daemon as a package or asset that can be downloaded by users who require it.

Conclusion:
The proposed Python/Rust implementation of an AI-powered daemon that automatically generates missing XWayland/Ubuantu integration code is a crucial step towards creating a comprehensive Geometry OS system. By providing clear and concise instructions for running the daemon, documenting its dependencies, and ensuring its correctness and functionality, the daemon can be used by users to improve their Geometry OS experience. The daemon will continue to receive updates and improvements over time based on user feedback and requests.