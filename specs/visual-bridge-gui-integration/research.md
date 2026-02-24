---
spec: visual-bridge-gui-integration
phase: research
created: 2026-02-23T12:00:00Z
generated: auto
---

# Research: Visual Bridge GUI Integration

## Executive Summary

Integrate ASCII GUI system (61 tests) with Visual Bridge WebSocket. Add GUI scene poller following `_ascii_scene_poller()` pattern, command processor, and bi-directional WebSocket handlers. Feasibility: HIGH - direct extension of existing patterns.

## Codebase Analysis

### Existing Patterns

| Pattern | Location | Usage |
|---------|----------|-------|
| ASCII Scene Poller | `visual_bridge.py:1582-1610` | `_ascii_scene_poller()` polls `.geometry/ascii_scene/` |
| ASCII Renderer Registration | `visual_bridge.py:1546-1569` | `register_ascii_renderers()` wires renderers |
| WebSocket Message Handlers | `visual_bridge.py:996-1019` | `ascii_scene_update`, `ascii_scene_request` |
| Broadcast Helper | `visual_bridge.py:1493-1500` | `_broadcast()` to all clients |
| GUIHookBroadcaster | `ascii_gui/hooks.py:115-222` | Event dispatch to hooks |
| GUIFragmentRenderer | `ascii_gui/fragment_renderer.py:63-225` | Emits .ascii/.yaml files |
| GUICommandProcessor | `ascii_gui/command_processor.py:45-358` | Processes YAML commands |

### Dependencies

```
VisualBridge (port 8768)
  ├── GUIHookBroadcaster (from ascii_gui)
  ├── GUIFragmentRenderer (from ascii_gui)
  ├── GUICommandProcessor (from ascii_gui)
  └── asyncio, websockets, pathlib
```

### Constraints

- Poll interval: 500ms (faster than ASCII's 1s for UI responsiveness)
- Directory: `.geometry/gui/fragments/` (parallel to `.geometry/ascii_scene/`)
- Command dirs: `.geometry/gui/commands/pending/` and `completed/`
- WebSocket handlers must match existing message format

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Direct pattern copy from ASCII integration |
| Effort Estimate | S | 9 tasks, ~150 LOC additions |
| Risk Level | Low | No new dependencies, isolated changes |

## Recommendations

1. Follow `_ascii_scene_poller()` pattern exactly for `_gui_scene_poller()`
2. Register GUI renderers in `start()` after ASCII renderers
3. Add GUI message handlers adjacent to ASCII handlers in `_handle_client_message`
4. Use same atomic write pattern for command processing
