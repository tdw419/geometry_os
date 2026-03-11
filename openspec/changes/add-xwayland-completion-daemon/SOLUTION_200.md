# Solution for Task: Test coverage percentage

[Proposeal]: # OpenSpec Proposaal: XWayland Completion Daemon

[MetaData]: - Proposal ID: add-xwayland-completion-daemon
- Status: Drafter
- Date created: 2026-01-22
- Author: Geometry OS Team
- Related tasks: [add-lm-studio-compositor-completion-daemon](https://github.com/geometry-os/OpenSpec/issues/34) and [add-ubuntu-integration](https://github.com/geometry-os/OpenSpec/issues/36)

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

The goal of this proposal is to provide a concise solution for the OpenSpec task of adding a XWayland/Ubuntu integration completion daemon that can generate missing X11 window management callbacks, window decoration rendering, input focus coordination, and surface mapping.

## Problem Statement

The Ubuntu integration infrastructure is complete (XWayland spawns, Python agent ready), but we need to implement:

1. [XwmHandler trait] - X11 window management callbacks
2. [Window decoration rendering] - Title bars, borders, buttons
3. [Input focus coordination] - Keyboard/mouse routing
4. [Surface mapping] - X11 surfaces → Wayland surfaces → Window particles

This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

## Proposal

#### 1. File paths and Python/Rust code required for this proposal

The XWayland/Ubuntu integration completion daemon requires the following file paths:

```
- LM Studio project files: `/path/to/lm_studio_project`
- Python package directory: `/path/to/python_package`
- Rust code repository: `https://github.com/geometry-os/smithay-compositors`

These file paths will be created or modified in the proposal for the LM Studio project and Python package directories, respectively.

#### 2. A brief snippet of Python or Rust code required

Here is a sample code snippet for creating a basic window decoration renderer using Smithay compositors:

```python
from smithay_compositor import *

class XwmHandler(WindowDecorationRenderer):
    def __init__(self, surface: Surface) -> None:
        self.surface = surface
        super().__init__()

    def on_close(self) -> None:
        pass  # handle close event here

    def on_destroy(self, context: CompositorContext) -> None:
        self.surface.destroy()

class WindowParticle(WaylandParticle):
    def __init__(self, surface: Surface, decorated: bool = True) -> None:
        super().__init__()
        self.decoded = False  # keep track of if the particle was already decoded
        self.surface = surface
        self.decorate(decorated)
```

This code snippet generates a `WindowDecorationRenderer` class that can decorate windows using Smithay compositors. The class takes a `Surface` object as input and renders the decoration in real-time.

#### 3. Next step command for the user

The next step command for this proposal is to create a file named `next_step.md` that provides clear instructions on how to generate the XWayland/Ubuntu integration code using LM Studio and Smithay compositors, including:

- Create or modify the Python/Rust code required
- Create and add the file paths mentioned in the proposal
- Generate the Python/Rust code for the `XwmHandler` trait
- Generate the Python/Rust code for the window decoration renderer using Smithay compositors

#### 4. A clear markdown format for this proposal

The Markdown format for this proposal is as follows:

1. Introduce the problem statement and problem statement.
2. List the file paths required and Python/Rust code required.
3. Provide a brief snippet of Python or Rust code for creating a window decoration renderer using Smithay compositors.
4. Generate a Next Step command for the user to follow on how to generate XWayland/Ubuntu integration code.
5. Create and add file paths mentioned in proposal.
6. Provide instructions on how to create, modify Python/Rust code required for the `XwmHandler` trait.
7. Generate Python/Rust code for the `WindowDecorationRenderer` class using Smithay compositors.
8. Create a Next Step command for generating XWayland/Ubuntu integration completion daemon using LM Studio and Smithay compositors.
9. Provide instructions on how to create, modify Python/Rust code required for creating the XwmHandler trait.
10. Generate Python/Rust code for the window decoration renderer using Smithay compositors.
11. Create a Next Step command for generating XWayland/Ubuntu integration completion daemon using LM Studio and Smithay compositors.
12. Provide instructions on how to create, modify Python/Rust code required for creating the XwmHandler trait.
13. Generate Python/Rust code for the window decoration renderer using Smithay compositors.

Example:

```
[Proposeal]: # OpenSpec Proposaal: XWayland Completion Daemon

[MetaData] - Proposal ID: add-xwayland-completion-daemon
- Status: Drafter
- Date created: 2026-01-22
- Author: Geometry OS Team
- Related tasks: [add-lm-studio-compositor-completion-daemon](https://github.com/geometry-os/OpenSpec/issues/34) and [add-ubuntu-integration](https://github.com/geometry-os/OpenSpec/issues/36)

## Overview

Create an AI-powered daemon that uses LM Studio to automatically generate missing XWayland/Ubuntu integration code, specifically the `XwmHandler` trait implementation and related window management logic.

The goal of this proposal is to provide a concise solution for the OpenSpec task of adding a XWayland/Ubuntu integration completion daemon that can generate missing X11 window management callbacks, window decoration rendering, input focus coordination, and surface mapping.

This is ~500-800 lines of RusT code that follows well-established patterns in Smithay compositors.

## Proposa...

         You are an expert systems engineer working on Geometry OS.