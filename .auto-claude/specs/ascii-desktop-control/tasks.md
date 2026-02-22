# Tasks: ASCII Desktop Control

## Phase 1: Enhanced ASCII Capture

- [x] 1.1 Add ImageMagick screenshot fallback to get_ascii_view.py
  - **Do**: Add `capture_screenshot_ascii()` and `detect_black_box_window()` functions
  - **Files**: `.gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py`
  - **Done when**: Screenshot-to-ASCII works for black-box windows (browsers, Electron)
  - **Verify**: `python3 .gemini/skills/ascii-desktop-control/scripts/get_ascii_view.py` outputs ASCII map
  - **Commit**: `feat(ascii): add ImageMagick screenshot fallback for black-box windows`

- [x] 1.2 Write tests for screenshot fallback
  - **Do**: Create test_ascii_view.py with tests for capture_screenshot_ascii, detect_black_box_window, generate_ascii_view
  - **Files**: `tests/test_ascii_view.py`
  - **Done when**: Tests pass with pytest
  - **Verify**: `python3 -m pytest tests/test_ascii_view.py -v`
  - **Commit**: `test(ascii): add screenshot fallback tests`

## Phase 2: Claude Code Skill

- [x] 2.1 Create Claude Code skill directory structure
  - **Do**: Create `.claude/skills/ascii-desktop-control/` with SKILL.md and scripts/__init__.py
  - **Files**: `.claude/skills/ascii-desktop-control/SKILL.md`, `.claude/skills/ascii-desktop-control/scripts/__init__.py`
  - **Done when**: Claude skill directory exists with SKILL.md
  - **Verify**: `ls .claude/skills/ascii-desktop-control/SKILL.md`
  - **Commit**: `feat(claude): create proper ascii-desktop-control skill`

- [x] 2.2 Clean up old instruction file
  - **Do**: Remove `.claude_ascii_control` if it exists
  - **Files**: `.claude_ascii_control`
  - **Done when**: Old file removed
  - **Verify**: `test ! -f .claude_ascii_control`
  - **Commit**: (included in 2.1)

## Phase 3: LLM-Powered Directive Daemon

- [x] 3.1 Add intent parsing to directive daemon
  - **Do**: Add `parse_directive_intent()`, `build_llm_prompt()`, `parse_llm_response()` functions
  - **Files**: `scripts/directive_daemon.py`
  - **Done when**: Daemon can parse directive intent heuristically
  - **Verify**: `python3 -c "from directive_daemon import parse_directive_intent; print(parse_directive_intent({'title': 'Open Browser', 'content': 'Click Firefox'}))"`
  - **Commit**: `feat(daemon): add heuristic intent parsing`

- [ ] 3.2 Add LLM integration to directive daemon
  - **Do**: Add `call_llm()` function with Ollama/LM Studio support, integrate with execute_directive
  - **Files**: `scripts/directive_daemon.py`
  - **Done when**: Daemon can use LLM for decision making when USE_LLM=true
  - **Verify**: `python3 -c "from directive_daemon import call_llm; print('LLM function exists')"`
  - **Commit**: `feat(daemon): add LLM-powered execution`

- [x] 3.3 Write tests for directive daemon
  - **Do**: Create test_directive_daemon.py with tests for intent parsing, action execution, LLM prompt building
  - **Files**: `tests/test_directive_daemon.py`
  - **Done when**: Tests pass with pytest
  - **Verify**: `python3 -m pytest tests/test_directive_daemon.py -v`
  - **Commit**: `test(daemon): add directive daemon tests`

## Phase 4: Integration & Service

- [ ] 4.1 Create WordPress integration tests
  - **Do**: Create test_ascii_wp_integration.py testing directive post/retrieve/respond flow
  - **Files**: `tests/test_ascii_wp_integration.py`
  - **Done when**: Integration tests pass (or skip if WordPress unavailable)
  - **Verify**: `python3 -m pytest tests/test_ascii_wp_integration.py -v`
  - **Commit**: `test(integration): add WordPress directive flow tests`

- [ ] 4.2 Create systemd service file
  - **Do**: Create `systemd/geometryos-directive-daemon.service` and `scripts/install_daemon.sh`
  - **Files**: `systemd/geometryos-directive-daemon.service`, `scripts/install_daemon.sh`
  - **Done when**: Service file exists and install script is executable
  - **Verify**: `test -x scripts/install_daemon.sh && test -f systemd/geometryos-directive-daemon.service`
  - **Commit**: `feat(daemon): add systemd service for directive polling`

## Phase 5: Documentation

- [ ] 5.1 Create documentation
  - **Do**: Create `docs/ASCII_DESKTOP_CONTROL.md` with quickstart guide, architecture, configuration
  - **Files**: `docs/ASCII_DESKTOP_CONTROL.md`
  - **Done when**: Documentation exists and covers all features
  - **Verify**: `test -f docs/ASCII_DESKTOP_CONTROL.md && grep -q "Quick Start" docs/ASCII_DESKTOP_CONTROL.md`
  - **Commit**: `docs: add ASCII desktop control quickstart guide`
