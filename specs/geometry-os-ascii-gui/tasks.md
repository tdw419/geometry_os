---
spec: geometry-os-ascii-gui
phase: tasks
total_tasks: 8
created: 2026-02-23T19:00:00Z
generated: auto
---

# Tasks: geometry-os-ascii-gui

## Phase 1: Make It Work (POC)

Focus: Build core infrastructure. Module structure, data models, hook system.

- [x] 1.1 Create module structure and directories
  - **Do**:
    1. Create `systems/visual_shell/ascii_gui/__init__.py`
    2. Create `systems/visual_shell/ascii_gui/py.typed`
    3. Create `.geometry/gui/fragments/`, `.geometry/gui/schemas/`, `.geometry/gui/commands/pending/`, `.geometry/gui/commands/completed/`, `.geometry/gui/state/`
    4. Add `.gitkeep` files to empty directories
  - **Files**:
    - `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/ascii_gui/__init__.py`
    - `/home/jericho/zion/projects/geometry_os/geometry_os/.geometry/gui/`
  - **Done when**: Module imports successfully, directories exist
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "import systems.visual_shell.ascii_gui; print('OK')" && ls -la .geometry/gui/`
  - **Commit**: `feat(ascii-gui): create module structure and directories`
  - _Requirements: FR-1_
  - _Design: ASCII Control Surface_

- [x] 1.2 Implement data models
  - **Do**:
    1. Create `systems/visual_shell/ascii_gui/models.py`
    2. Define WindowType, PanelType enums
    3. Define Window dataclass with to_yaml_dict() method
    4. Define FocusState, MouseState, KeyboardState dataclasses
    5. Define MenuItem, Menu, Panel dataclasses
    6. Define Command dataclass with to_yaml() and from_yaml() methods
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/ascii_gui/models.py`
  - **Done when**: All models importable, serialization works
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "
from systems.visual_shell.ascii_gui.models import Window, WindowType, Command
from datetime import datetime
w = Window(id='test', title='Test', type=WindowType.TERMINAL)
c = Command(command_id='cmd-1', action='click', timestamp=datetime.now())
print('Models OK')
"`
  - **Commit**: `feat(ascii-gui): add data models for windows, focus, mouse, keyboard, commands`
  - _Requirements: FR-8, FR-9, FR-10, FR-11_
  - _Design: Data Flow_

- [x] 1.3 Implement hook system
  - **Do**:
    1. Create `systems/visual_shell/ascii_gui/hooks.py`
    2. Define GUIShellHook ABC with 6 event methods (window_create, window_focus, window_close, mouse_move, key_press, menu_open)
    3. Define GUIHookBroadcaster with add_hook, remove_hook, _dispatch methods
    4. Use asyncio.gather with return_exceptions=True for dispatch
    5. Create test file at `tests/systems/visual_shell/ascii_gui/test_hooks.py`
    6. Test broadcaster dispatches to all hooks
    7. Test broadcaster handles hook exceptions
  - **Files**:
    - `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/ascii_gui/hooks.py`
    - `/home/jericho/zion/projects/geometry_os/geometry_os/tests/systems/visual_shell/ascii_gui/test_hooks.py`
  - **Done when**: Hook tests pass
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/test_hooks.py -v`
  - **Commit**: `feat(ascii-gui): implement hook system with broadcaster`
  - _Requirements: FR-5, FR-6, FR-7_
  - _Design: GUIHookBroadcaster_

- [x] 1.4 POC Checkpoint
  - **Do**: Verify all Phase 1 components work together
  - **Done when**: Module imports, models serialize, hooks dispatch
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "
from systems.visual_shell.ascii_gui import GUIShellHook, GUIHookBroadcaster
from systems.visual_shell.ascii_gui.models import Window, Command
print('Phase 1 POC OK')
"`
  - **Commit**: `feat(ascii-gui): complete Phase 1 POC`

## Phase 2: Fragment Renderer

- [x] 2.1 Implement fragment renderer
  - **Do**:
    1. Create `systems/visual_shell/ascii_gui/fragment_renderer.py`
    2. Define GUIFragmentRenderer class implementing GUIShellHook
    3. Implement atomic_write helper (temp file + rename)
    4. Implement on_window_create, on_window_focus, on_window_close handlers
    5. Implement on_mouse_move, on_key_press handlers
    6. Implement _write_windows (YAML format), _write_focus (ASCII box), _write_mouse, _write_keyboard
    7. Create test file at `tests/systems/visual_shell/ascii_gui/test_fragment_renderer.py`
    8. Test windows fragment contains correct data
    9. Test focus fragment shows focused window
  - **Files**:
    - `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/ascii_gui/fragment_renderer.py`
    - `/home/jericho/zion/projects/geometry_os/geometry_os/tests/systems/visual_shell/ascii_gui/test_fragment_renderer.py`
  - **Done when**: Fragment tests pass, files written correctly
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/test_fragment_renderer.py -v`
  - **Commit**: `feat(ascii-gui): implement fragment renderer with windows, focus, mouse, keyboard`
  - _Requirements: FR-1, FR-2, FR-8, FR-9, FR-10, FR-11_
  - _Design: GUIFragmentRenderer_

## Phase 3: Command Processor

- [x] 3.1 Implement command processor
  - **Do**:
    1. Create `systems/visual_shell/ascii_gui/command_processor.py`
    2. Define GUICommandProcessor class
    3. Implement process_pending() to scan pending directory
    4. Implement _load_command() with YAML parsing and validation
    5. Implement _execute_command() with injected executor callback
    6. Implement _move_to_completed() with status annotation
    7. Define VALID_ACTIONS set: click, type, key, move, scroll, drag, resize, close, focus
    8. Create test file at `tests/systems/visual_shell/ascii_gui/test_command_processor.py`
    9. Test valid command executes and moves to completed
    10. Test invalid command rejected with error
  - **Files**:
    - `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/ascii_gui/command_processor.py`
    - `/home/jericho/zion/projects/geometry_os/geometry_os/tests/systems/visual_shell/ascii_gui/test_command_processor.py`
  - **Done when**: Command processor tests pass
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/test_command_processor.py -v`
  - **Commit**: `feat(ascii-gui): implement command processor with validation`
  - _Requirements: FR-3, FR-4, FR-12, FR-13_
  - _Design: GUICommandProcessor_

## Phase 4: Integration

- [x] 4.1 Update module exports
  - **Do**:
    1. Update `systems/visual_shell/ascii_gui/__init__.py` with all exports
    2. Export GUIShellHook, GUIHookBroadcaster
    3. Export Window, WindowType, FocusState, MouseState, KeyboardState, Command
    4. Export GUIFragmentRenderer, atomic_write
    5. Export GUICommandProcessor
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/ascii_gui/__init__.py`
  - **Done when**: All components importable from module root
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -c "from systems.visual_shell.ascii_gui import GUIFragmentRenderer, GUICommandProcessor, GUIHookBroadcaster, Window, Command; print('Module exports OK')"`
  - **Commit**: `feat(ascii-gui): update module exports`

- [x] 4.2 Run all tests
  - **Do**: Run complete test suite for ascii_gui module
  - **Done when**: All tests pass
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/ -v`
  - **Commit**: `test(ascii-gui): verify all tests pass`

- [x] 4.3 Create integration example
  - **Do**:
    1. Create `systems/visual_shell/ascii_gui/example.py`
    2. Demonstrate hook broadcaster setup
    3. Demonstrate fragment renderer registration
    4. Simulate GUI events (window create, focus, mouse move)
    5. Read fragments as AI would
    6. Write command as AI would
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/ascii_gui/example.py`
  - **Done when**: Example runs successfully, fragments created
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python systems/visual_shell/ascii_gui/example.py`
  - **Commit**: `docs(ascii-gui): add example usage script`
  - _Requirements: FR-15_

## Phase 5: Quality Gates

- [ ] 5.1 Local quality check
  - **Do**: Run all quality checks locally
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python -m pytest tests/systems/visual_shell/ascii_gui/ -v --tb=short`
  - **Done when**: All tests pass
  - **Commit**: `fix(ascii-gui): address test issues` (if fixes needed)

- [ ] 5.2 Verify directory structure
  - **Do**: Verify `.geometry/gui/` structure created correctly
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && tree .geometry/gui/`
  - **Done when**: Directory structure matches design

- [ ] 5.3 Verify fragments exist after example
  - **Do**: Run example and verify fragment files
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python systems/visual_shell/ascii_gui/example.py && ls -la .geometry/gui/fragments/`
  - **Done when**: windows.ascii, focus.ascii, mouse.ascii, keyboard.ascii exist

## Notes

- **POC shortcuts**: Direct inline verification via python -c commands
- **Test isolation**: Using tempfile.TemporaryDirectory following existing patterns
- **Atomic writes**: temp file + rename pattern from VisualShellAsciiRenderer

## Unresolved Questions

None - patterns are well-established from VisualShellAsciiRenderer and hook system.
