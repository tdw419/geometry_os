---
spec: visual-bridge-gui-integration
phase: requirements
created: 2026-02-23T12:00:00Z
generated: auto
---

# Requirements: Visual Bridge GUI Integration

## Summary

Integrate ASCII GUI system with Visual Bridge WebSocket for real-time GUI state broadcasting to PixiJS clients and AI command processing from agents.

## User Stories

### US-1: GUI State Broadcasting
As a PixiJS client, I want to receive real-time GUI state updates so that I can render the AI-readable GUI overlay.

**Acceptance Criteria**:
- AC-1.1: WebSocket broadcasts `gui_scene_update` when `.geometry/gui/fragments/` files change
- AC-1.2: Client can request current GUI scene list via `gui_scene_request`
- AC-1.3: Poll interval is 500ms for responsive updates
- AC-1.4: Files include `windows.yaml`, `focus.ascii`, `mouse.ascii`, `keyboard.ascii`

### US-2: AI GUI Commands
As an AI agent, I want to send GUI commands (focus, close, click) so that I can control the visual shell programmatically.

**Acceptance Criteria**:
- AC-2.1: Commands written to `.geometry/gui/commands/pending/` are processed
- AC-2.2: Validated commands broadcast `gui_command` event to clients
- AC-2.3: Processed commands moved to `completed/` with success/error status
- AC-2.4: Invalid commands rejected with clear error messages

### US-3: GUI Event Forwarding
As a PixiJS visual shell, I want to forward GUI events (window create/focus/close, mouse, keyboard) so that AI can perceive GUI state changes.

**Acceptance Criteria**:
- AC-3.1: `gui_event` with `event_type=window_create` triggers `GUIHookBroadcaster.on_window_create`
- AC-3.2: `gui_event` with `event_type=window_focus` triggers focus change
- AC-3.3: `gui_event` with `event_type=mouse_move` updates mouse state
- AC-3.4: `gui_event` with `event_type=key_press` updates keyboard state

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | VisualBridge must track GUI scene files in `gui_scene_files` dict | Must | US-1 |
| FR-2 | `_gui_scene_poller()` must poll `.geometry/gui/fragments/` every 500ms | Must | US-1 |
| FR-3 | Changes must broadcast as `gui_scene_update` messages | Must | US-1 |
| FR-4 | `register_gui_renderers()` must wire GUIFragmentRenderer to GUIHookBroadcaster | Must | US-1 |
| FR-5 | `_setup_gui_command_processor()` must create GUICommandProcessor | Must | US-2 |
| FR-6 | `_execute_gui_command()` must broadcast `gui_command` and call broadcaster | Must | US-2 |
| FR-7 | WebSocket must handle `gui_scene_request`, `gui_scene_update`, `gui_event` | Must | US-1, US-3 |
| FR-8 | `broadcast_gui_scene_list()` must list available GUI fragment files | Should | US-1 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | GUI poll latency must be <100ms overhead on file changes | Performance |
| NFR-2 | Command processing must complete within 50ms | Performance |
| NFR-3 | Invalid commands must not crash the bridge | Reliability |

## Out of Scope

- PixiJS-side GUI rendering (handled by visual shell)
- AI semantic understanding of GUI (future enhancement)
- Multi-client command conflict resolution

## Dependencies

- `systems.visual_shell.ascii_gui` module (61 tests passing)
- `systems.visual_shell.api.visual_bridge` WebSocket server
- `.geometry/gui/` directory structure
