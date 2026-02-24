---
spec: visual-bridge-gui-integration
phase: tasks
total_tasks: 9
created: 2026-02-23T12:00:00Z
generated: auto
---

# Tasks: Visual Bridge GUI Integration

## Phase 1: Make It Work (POC)

Focus: Wire up GUI integration following ASCII Scene Graph pattern. Skip comprehensive error handling initially.

- [x] 1.1 Add GUI State Variables to VisualBridge
  - **Do**: Add `gui_scene_dir`, `gui_scene_files`, `_gui_renderers_registered`, `_gui_command_processor`, `_gui_broadcaster`, `_gui_renderer` to `__init__`
  - **Files**: `systems/visual_shell/api/visual_bridge.py` (after line 113)
  - **Done when**: Variables initialized, import check passes
  - **Verify**: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; v = VisualBridge(); print('OK')"`
  - **Commit**: `feat(visual-bridge): add GUI state variables`
  - _Requirements: FR-1_
  - _Design: GUI State Variables_

- [x] 1.2 Implement GUI Renderer Registration
  - **Do**: Add `register_gui_renderers()` method that creates `GUIHookBroadcaster`, `GUIFragmentRenderer`, wires them together
  - **Files**: `systems/visual_shell/api/visual_bridge.py` (after line 1547)
  - **Done when**: Method exists, creates directories, imports work
  - **Verify**: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; v = VisualBridge(); v.register_gui_renderers(); print('OK')"`
  - **Commit**: `feat(visual-bridge): add GUI renderer registration`
  - _Requirements: FR-4_
  - _Design: GUI Scene Poller_

- [ ] 1.3 Implement GUI Scene Watcher
  - **Do**: Add `_setup_gui_scene_watcher()` and `_gui_scene_poller()` methods following `_ascii_scene_poller()` pattern
  - **Files**: `systems/visual_shell/api/visual_bridge.py` (after line 1581)
  - **Done when**: Poller loops, detects file changes, broadcasts `gui_scene_update`
  - **Verify**: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('OK')"`
  - **Commit**: `feat(visual-bridge): add GUI scene poller`
  - _Requirements: FR-2, FR-3_
  - _Design: GUI Scene Poller_

- [ ] 1.4 Implement GUI Command Processor
  - **Do**: Add `_setup_gui_command_processor()` and `_execute_gui_command()` methods
  - **Files**: `systems/visual_shell/api/visual_bridge.py` (after `_setup_gui_scene_watcher`)
  - **Done when**: Processor created with executor callback, commands broadcast `gui_command`
  - **Verify**: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('OK')"`
  - **Commit**: `feat(visual-bridge): add GUI command processor integration`
  - _Requirements: FR-5, FR-6_
  - _Design: GUI Command Processor_

- [ ] 1.5 Wire Up in start() Method
  - **Do**: Add calls to `register_gui_renderers()`, `_setup_gui_scene_watcher()`, `_setup_gui_command_processor()` in `start()` method
  - **Files**: `systems/visual_shell/api/visual_bridge.py` (after line 1653)
  - **Done when**: GUI setup runs on bridge start
  - **Verify**: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; v = VisualBridge(); print('OK')"`
  - **Commit**: `feat(visual-bridge): wire GUI integration in start()`
  - _Requirements: FR-4, FR-5_
  - _Design: Architecture_

- [ ] 1.6 Add WebSocket Message Handlers
  - **Do**: Add handlers for `gui_scene_request`, `gui_scene_update`, `gui_event` in `_handle_client_message` and add `broadcast_gui_scene_list()` method
  - **Files**: `systems/visual_shell/api/visual_bridge.py` (after line 1007)
  - **Done when**: WebSocket handles GUI messages, routes events to broadcaster
  - **Verify**: `python -c "from systems.visual_shell.api.visual_bridge import VisualBridge; print('OK')"`
  - **Commit**: `feat(visual-bridge): add GUI WebSocket message handlers`
  - _Requirements: FR-7, FR-8_
  - _Design: WebSocket Message Handlers_

- [ ] 1.7 POC Checkpoint
  - **Do**: Manual test - start bridge, verify GUI poller runs, test WebSocket messages
  - **Done when**: Bridge starts without error, GUI directories created
  - **Verify**: `python systems/visual_shell/api/visual_bridge.py &` then check logs
  - **Commit**: `feat(visual-bridge): complete GUI integration POC`

## Phase 2: Testing

- [ ] 2.1 Write Integration Tests
  - **Do**: Create test file with tests for GUI state variables, renderer registration, scene poller, command processor
  - **Files**: `tests/systems/visual_shell/api/test_visual_bridge_gui.py`
  - **Done when**: Tests cover main integration points
  - **Verify**: `python -m pytest tests/systems/visual_shell/api/test_visual_bridge_gui.py -v`
  - **Commit**: `test(visual-bridge): add GUI integration tests`
  - _Requirements: AC-1.1, AC-2.1, AC-3.1_

## Phase 3: Documentation

- [ ] 3.1 Update Documentation
  - **Do**: Create `docs/gui-visual-bridge-integration.md` with WebSocket protocol, directory structure, usage examples
  - **Files**: `docs/gui-visual-bridge-integration.md`
  - **Done when**: Documentation covers all message types and usage
  - **Verify**: Read file, verify completeness
  - **Commit**: `docs: add GUI Visual Bridge integration documentation`

## Phase 4: Quality Gates

- [ ] 4.1 Run All Tests
  - **Do**: Run all Visual Bridge and ASCII GUI tests
  - **Verify**: `python -m pytest tests/systems/visual_shell/api/ tests/systems/visual_shell/ascii_gui/ -v --tb=short`
  - **Done when**: All tests pass (61 ASCII GUI + new integration tests)
  - **Commit**: `test(visual-bridge): verify all integration tests pass`

## Notes

- **POC shortcuts**: Minimal error handling, no retry logic
- **Production TODOs**: Add watchdog-based file watching instead of polling, command rate limiting
- **Integration pattern**: Directly mirrors ASCII Scene Graph integration for consistency
