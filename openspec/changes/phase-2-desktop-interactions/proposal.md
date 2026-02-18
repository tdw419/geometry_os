# Change: phase-2-desktop-interactions

## Problem Statement
Enhance Phase 1's static desktop shell with interactive window management capabilities. This includes implementing drag-to-resize logic for windows, a scrollable content container (ScrollBox) to handle overflow scenarios in complex apps or settings panels, an accessible 'Start' menu launcher system that spawns demo applications programmatically, and dynamic Z-index layering so user interaction brings the active application into focus.

## Proposed Solution
To transform PixiJS Desktop Environment from a visual prototype into a functional desktop simulation. Window resizing provides necessary screen real estate management for complex apps; scrolling is essential to support content-heavy interfaces without breaking immersion or canvas scaling limits (if applicable); and Z-indexing ensures the user can multitask effectively by focusing on specific applications.

## Impact Assessment
- **Scope**: Large complexity
- **Risk**: Medium (automated implementation)
- **Dependencies**: phase-setup-desktop-shell

## Success Criteria
- Implement Window Resizing Logic: Add resize handles/regions to window containers. Handle mouse down events at edges/corners, track drag movement during 'mousemove', and update container width/height or scale factors accordingly while constraining min/max dimensions.
- Implement Z-Indexing and Focus Management: Add click event listeners to all active windows. When a user clicks or interacts with any window, it must be moved above other non-active windows in the render order (e.g., re-inserted into parent container at index 0).
- Implement ScrollBox Component: Create a reusable PixiJS container class that renders scrollbars and handles content overflow. It must detect when child sprites/text exceed the parent bounds, render vertical/horizontal scrollbar tracks based on percentage of hidden area.
- Implement Start Menu / App Launcher: Create a UI element (e.g., button or keybind) that toggles visibility of the launcher menu. The launchers must be clickable buttons which, when clicked, instantiate and open specific demo windows defined in Phase 1.

---
*Generated automatically from roadmap decomposition*
*Change ID: phase-2-desktop-interactions*
*Complexity: Large*
