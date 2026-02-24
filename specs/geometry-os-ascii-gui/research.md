---
spec: geometry-os-ascii-gui
phase: research
created: 2026-02-23T19:00:00Z
generated: auto
---

# Research: geometry-os-ascii-gui

## Executive Summary

Build dual-audience GUI system where every state is exposed as ASCII fragments. Humans use PixiJS visual rendering; AIs read/write `.geometry/gui/` files. Implementation plan exists at `docs/plans/2026-02-23-geometry-os-ascii-gui-implementation.md` with 8 TDD tasks. **Feasibility: High** - existing VisualShellAsciiRenderer and hook patterns provide proven templates.

## Existing Components

### VisualShellAsciiRenderer (`systems/visual_shell/ascii_scene/renderers/visual_shell.py`)

| Feature | Description |
|---------|-------------|
| Pattern | Hook-based ASCII fragment emission |
| Output | shell_fragments.ascii, shell_focus.ascii, shell_state.ascii |
| Atomic Writes | temp file + rename for consistency |
| Data Models | Window, InputState dataclasses |

**Ready**: Direct template for GUIFragmentRenderer.

### VisualShellHook System (`systems/visual_shell/ascii_scene/hooks.py`)

| Class | Purpose |
|-------|---------|
| `VisualShellHook` | ABC with on_window_create, on_window_focus, on_window_close, on_fragment_update |
| `VisualShellHookBroadcaster` | Async dispatch to multiple hooks with gather(return_exceptions=True) |
| `LoggingHook` / `NoOpHook` | Convenience base classes |

**Ready**: Pattern for GUIShellHook and GUIHookBroadcaster.

### Visual Bridge (`systems/visual_shell/api/visual_bridge.py`)

| Feature | Description |
|---------|-------------|
| Port | 8768 WebSocket |
| ASCII Scene | `.geometry/ascii_scene/` file watching |
| Clients | Maintains set of connected WebSocket clients |
| Broadcast | Pushes ASCII updates to all clients |

**Integration Point**: Will add `.geometry/gui/` watching and broadcasting.

### ASCII Scene Graph Directory Structure

```
.geometry/ascii_scene/
  shell_fragments.ascii
  shell_focus.ascii
  shell_state.ascii
  neural_city.ascii
  evolution.ascii
```

**Pattern**: Same structure for `.geometry/gui/fragments/`.

## Implementation Plan Reference

The detailed implementation plan at: `docs/plans/2026-02-23-geometry-os-ascii-gui-implementation.md`

### Plan Summary

| Phase | Tasks | Description |
|-------|-------|-------------|
| Phase 1 | 1-3 | Core Infrastructure (module, models, hooks) |
| Phase 2 | 4 | Fragment Renderer (windows, focus, mouse, keyboard) |
| Phase 3 | 5 | Command Processor (validation, execution) |
| Phase 4 | 6-8 | Integration (exports, tests, example) |

### File Locations (from plan)

| File | Purpose |
|------|---------|
| `systems/visual_shell/ascii_gui/__init__.py` | Module exports |
| `systems/visual_shell/ascii_gui/models.py` | Data classes |
| `systems/visual_shell/ascii_gui/hooks.py` | Hook system |
| `systems/visual_shell/ascii_gui/fragment_renderer.py` | ASCII renderer |
| `systems/visual_shell/ascii_gui/command_processor.py` | Command queue |
| `.geometry/gui/` | ASCII Control Surface |

## Design Reference

Design document at: `docs/plans/2026-02-23-geometry-os-ascii-gui-design.md`

### Key Design Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Fragment format | YAML + ASCII boxes | YAML for structured, boxes for quick scanning |
| Command delivery | File queue | Atomic writes, replay-able, no connection mgmt |
| File watching | watchdog | Cross-platform, already used in Visual Bridge |
| Atomicity | temp+rename | Consistent with ASCII Scene Graph pattern |
| State sync | push via WS + pull via files | Real-time + persistence |

### Fragment Types

| Fragment | Content | Format |
|----------|---------|--------|
| windows.ascii | Active windows tree | YAML |
| focus.ascii | Current focus state | ASCII box |
| mouse.ascii | Mouse position/state | ASCII box |
| keyboard.ascii | Keyboard state | ASCII box |
| menus.ascii | Menu hierarchy | YAML |
| panels.ascii | Panel layouts | YAML |

### Command Actions

| Action | Description |
|--------|-------------|
| click | Click element at target |
| type | Type text into target |
| key | Press key combination |
| move | Move mouse to position |
| scroll | Scroll element |
| drag | Drag from A to B |
| resize | Resize window |
| close | Close window |
| focus | Focus element |

## Technical Recommendations

1. **Follow VisualShellAsciiRenderer pattern**: Hook-based, atomic writes, auto_flush option
2. **Extend VisualShellHook interface**: Add on_mouse_move, on_key_press, on_menu_open
3. **Separate concerns**: FragmentRenderer for state output, CommandProcessor for AI input
4. **Use PyYAML**: Already in project dependencies for fragment serialization
5. **Throttle writes**: 100ms minimum interval to prevent rapid file churn

## Quality Commands

| Type | Command |
|------|---------|
| Unit Test | `pytest tests/systems/visual_shell/ascii_gui/ -v` |
| Import Check | `python -c "from systems.visual_shell.ascii_gui import GUIFragmentRenderer, GUICommandProcessor"` |

## Risks & Mitigations

| Risk | Likelihood | Mitigation |
|------|------------|------------|
| Import path mismatch | Low | Plan uses `systems.visual_shell.ascii_gui.` - verified correct |
| PyYAML not available | Low | Already used in project |
| Test isolation | Low | Use tempfile.TemporaryDirectory following existing patterns |
| Fragment write contention | Low | Atomic writes with temp+rename |

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Clear patterns exist in VisualShellAsciiRenderer |
| Effort Estimate | M | 8 tasks with detailed code in plan |
| Risk Level | Low | Additive change, extends existing ASCII Scene Graph |

## Conclusion

**Feasibility: HIGH**

The implementation plan is well-structured with complete code samples for each task. Existing VisualShellAsciiRenderer and hook system provide proven patterns. The dual-audience approach (human visual + AI text) aligns with ASCII Exposed Computing manifesto.

**Recommended Actions:**
1. Execute Phase 1 (Tasks 1-3) to build core infrastructure
2. Execute Phase 2 (Task 4) for fragment renderer
3. Execute Phase 3 (Task 5) for command processor
4. Execute Phase 4 (Tasks 6-8) for integration and testing
