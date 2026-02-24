---
spec: geometry-os-ascii-gui
phase: requirements
created: 2026-02-23T19:00:00Z
generated: auto
---

# Requirements: geometry-os-ascii-gui

## Summary

Dual-audience GUI system exposing all state as ASCII fragments in `.geometry/gui/` for zero-cost AI perception while maintaining human visual rendering. Components: GUIFragmentRenderer (state to ASCII), GUICommandProcessor (commands to actions), GUIHookBroadcaster (event dispatch).

## User Stories

### US-1: AI Reads GUI State

As an AI agent, I want to read the current GUI state from ASCII files so that I can understand the interface without visual processing.

**Acceptance Criteria**:
- AC-1.1: Windows fragment contains all active windows with id, title, pos, size, z-index, focused state
- AC-1.2: Focus fragment shows current focused window and element
- AC-1.3: Mouse fragment shows position, buttons, hover element
- AC-1.4: Keyboard fragment shows pressed keys, modifiers, last key time
- AC-1.5: All fragments use atomic writes (temp+rename) to prevent partial reads

### US-2: AI Controls GUI

As an AI agent, I want to write commands to control the GUI so that I can interact with the interface programmatically.

**Acceptance Criteria**:
- AC-2.1: Commands written to `.geometry/gui/commands/pending/` are processed
- AC-2.2: Valid commands execute and move to `completed/` with SUCCESS status
- AC-2.3: Invalid commands move to `completed/` with FAILED status and error message
- AC-2.4: Command validation checks required fields (command_id, action, timestamp)
- AC-2.5: Supported actions: click, type, key, move, scroll, drag, resize, close, focus

### US-3: GUI Events Broadcast to Hooks

As a system component, I want to subscribe to GUI events so that I can react to state changes in real-time.

**Acceptance Criteria**:
- AC-3.1: GUIShellHook interface defines event methods (window_create, window_focus, window_close, mouse_move, key_press, menu_open)
- AC-3.2: GUIHookBroadcaster dispatches events to all registered hooks
- AC-3.3: Hook exceptions do not prevent other hooks from receiving events
- AC-3.4: All hook methods are async for non-blocking dispatch

### US-4: Fragment Renderer Generates ASCII

As the system, I want to automatically generate ASCII fragments when GUI state changes so that AI can always access current state.

**Acceptance Criteria**:
- AC-4.1: GUIFragmentRenderer implements GUIShellHook interface
- AC-4.2: Window events update windows.ascii and focus.ascii
- AC-4.3: Mouse events update mouse.ascii
- AC-4.4: Keyboard events update keyboard.ascii
- AC-4.5: YAML format for structured data (windows, menus, panels)
- AC-4.6: ASCII box format for quick-scan state (focus, mouse, keyboard)

### US-5: Dual-Audience Transparency

As a user (human or AI), I want the same interface to serve both audiences transparently so that no special accommodations are needed.

**Acceptance Criteria**:
- AC-5.1: Human interactions via PixiJS update ASCII fragments
- AC-5.2: AI commands via file queue update PixiJS visual
- AC-5.3: State synchronization maintains consistency between visual and ASCII
- AC-5.4: Visual Bridge broadcasts ASCII changes via WebSocket

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | GUIFragmentRenderer generates ASCII fragments for all GUI state | Must | US-1, US-4 |
| FR-2 | Fragment files use atomic writes (temp+rename) | Must | AC-1.5 |
| FR-3 | GUICommandProcessor processes commands from pending queue | Must | US-2 |
| FR-4 | Commands validated against schema before execution | Must | AC-2.4 |
| FR-5 | GUIHookBroadcaster dispatches events to all hooks | Must | US-3 |
| FR-6 | Hook exceptions isolated (return_exceptions=True) | Must | AC-3.3 |
| FR-7 | GUIShellHook interface defines 6 event methods | Must | AC-3.1 |
| FR-8 | Windows fragment includes id, title, pos, size, z, focused | Must | AC-1.1 |
| FR-9 | Focus fragment shows window, element, cursor, mode | Must | AC-1.2 |
| FR-10 | Mouse fragment shows pos, screen, window, buttons, hover | Must | AC-1.3 |
| FR-11 | Keyboard fragment shows pressed, modifiers, last key | Must | AC-1.4 |
| FR-12 | Command actions: click, type, key, move, scroll, drag, resize, close, focus | Must | AC-2.5 |
| FR-13 | Processed commands move to completed with status | Must | AC-2.2, AC-2.3 |
| FR-14 | Visual Bridge integration for WebSocket broadcast | Should | AC-5.4 |
| FR-15 | Example script demonstrating full workflow | Should | Documentation |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Fragment write latency < 50ms | Performance |
| NFR-2 | Command processing latency < 100ms | Performance |
| NFR-3 | Atomic writes ensure no partial reads | Reliability |
| NFR-4 | Write throttling (100ms minimum interval) | Performance |
| NFR-5 | Memory efficient (no fragment caching) | Resource |
| NFR-6 | Async operations throughout | Concurrency |
| NFR-7 | Type hints for all public interfaces | Maintainability |
| NFR-8 | 80% test coverage minimum | Quality |

## Out of Scope

- PixiJS visual rendering (separate system)
- WebSocket server implementation (Visual Bridge handles)
- Schema validation library (manual validation for POC)
- Command signing/authentication
- Semantic search on fragments
- Fragment history/versioning

## Dependencies

| Dependency | Version | Purpose |
|------------|---------|---------|
| Python | 3.12+ | Runtime |
| PyYAML | any | Fragment serialization |
| asyncio | stdlib | Async operations |
| pytest | any | Testing |
| pytest-asyncio | any | Async test support |

## Related Context

| Document | Path | Relationship |
|----------|------|--------------|
| Implementation Plan | `docs/plans/2026-02-23-geometry-os-ascii-gui-implementation.md` | Detailed code for 8 tasks |
| Design Doc | `docs/plans/2026-02-23-geometry-os-ascii-gui-design.md` | Architecture and data flow |
| ASCII Manifesto | `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md` | Philosophy and principles |
| VisualShellAsciiRenderer | `systems/visual_shell/ascii_scene/renderers/visual_shell.py` | Pattern reference |
| Hook System | `systems/visual_shell/ascii_scene/hooks.py` | Pattern reference |
