# Tasks: phase-2-desktop-interactions

- [x] **Task 1**: Implement Window Resizing Logic: Add resize handles/regions to window containers. Handle mouse down events at edges/corners, track drag movement during 'mousemove', and update container width/height or scale factors accordingly while constraining min/max dimensions.
  - **Acceptance Criteria**:
    - Resized windows maintain aspect ratio if locked (optional) but must allow free resizing via bottom-right corner handle
    - Window boundaries cannot be resized to negative values; minimum size is enforced.
    - Resize interaction does not trigger window dragging when interacting with the resize grip area.
  - **Estimated Effort**: Medium
  - **Dependencies**: phase-setup-desktop-shell

- [x] **Task 2**: Implement Z-Indexing and Focus Management: Add click event listeners to all active windows. When a user clicks or interacts with any window, it must be moved above other non-active windows in the render order (e.g., re-inserted into parent container at index 0).
  - **Acceptance Criteria**:
    - Clicking an inactive window brings that specific instance visually and logically 'to front'.
    - Z-index changes persist correctly during subsequent interactions with different applications.
    - Background elements remain obscured by active windows.
  - **Estimated Effort**: Small|Medium (depending on event system)

- [x] **Task 3**: Implement ScrollBox Component: Create a reusable PixiJS container class that renders scrollbars and handles content overflow. It must detect when child sprites/text exceed the parent bounds, render vertical/horizontal scrollbar tracks based on percentage of hidden area.
  - **Acceptance Criteria**:
    - Scrolling vertically works correctly for oversized text or sprite lists.
    - Scrollbar thumb position accurately reflects current viewport offset relative to total height/width
    - Content remains clipped within container boundaries during scroll.
  - **Estimated Effort**: XLarge

- [x] **Task 4**: Implement Start Menu / App Launcher: Create a UI element (e.g., button or keybind) that toggles visibility of the launcher menu. The launchers must be clickable buttons which, when clicked, instantiate and open specific demo windows defined in Phase 1.
  - **Acceptance Criteria**:
    - Launcher can be opened via mouse click on an icon/button.
    - Menu items are visible within a reasonable viewport area (using ScrollBox if necessary).
    - Clicking menu item spawns the corresponding window at default coordinates without overlapping other active apps.
  - **Estimated Effort**: Medium


## Summary
- **Total Tasks**: 4
- **Estimated Complexity**: Large
- **Dependencies**: phase-setup-desktop-shell

---
*Generated automatically from roadmap decomposition*
*Change ID: phase-2-desktop-interactions*
*Last Updated: 2026-01-25T14:31:15.733247*
