# ASCII GUI Validation Tests

## Overview

These tests prove that AI agents can successfully read and control the ASCII GUI system through multiple interfaces.

## Test Suites

### 1. LM Studio Perception Tests (`test_lm_studio_perception.py`)

**Purpose:** Validate that a local LLM can read and understand GUI state from ASCII fragments.

**Tests:**
- `test_llm_identifies_windows` - LLM correctly identifies all windows
- `test_llm_identifies_focus_state` - LLM identifies focused window
- `test_llm_identifies_mouse_state` - LLM reads mouse position

**Requirements:**
- LM Studio running at `http://localhost:1234`
- Model loaded and ready

### 2. LM Studio Action Tests (`test_lm_studio_action.py`)

**Purpose:** Validate that a local LLM can generate valid commands to control the GUI.

**Tests:**
- `test_llm_generates_valid_focus_command` - LLM generates focus command
- `test_llm_command_execution_flow` - Complete command execution

**Requirements:**
- LM Studio running at `http://localhost:1234`

### 3. WebMCP Integration Tests (`test_webmcp_integration.py`)

**Purpose:** Validate that remote AI agents can interact with GUI via REST API.

**Tests:**
- `test_get_gui_state` - Retrieve GUI state via REST
- `test_list_gui_fragments` - List available fragments
- `test_submit_gui_command` - Submit command via REST
- `test_command_then_verify_state` - Complete flow verification

**Requirements:**
- Visual Bridge running at `http://localhost:8769`

### 4. End-to-End Loop Tests (`test_e2e_loop.py`)

**Purpose:** Validate complete perception-decision-action cycles.

**Tests:**
- `test_complete_perception_action_loop` - Read -> Decide -> Act -> Verify
- `test_multi_step_interaction` - Multiple sequential commands

**Requirements:**
- LM Studio running at `http://localhost:1234`

## Running Tests

### Check Service Availability

```bash
python tests/validation/run_ascii_gui_tests.py --check
```

### Run All Tests

```bash
python tests/validation/run_ascii_gui_tests.py --all
```

### Run Specific Test Suite

```bash
# LM Studio tests only
python tests/validation/run_ascii_gui_tests.py --lm-studio

# WebMCP tests only
python tests/validation/run_ascii_gui_tests.py --webmcp

# E2E tests only
python tests/validation/run_ascii_gui_tests.py --e2e
```

### Run with pytest directly

```bash
# All validation tests
pytest tests/validation/ascii_gui/ -v

# Specific test file
pytest tests/validation/ascii_gui/test_lm_studio_perception.py -v

# Specific test
pytest tests/validation/ascii_gui/test_lm_studio_perception.py::TestLMStudioPerception::test_llm_identifies_windows -v
```

## Setup Requirements

### LM Studio

1. Download and install LM Studio
2. Load a model (e.g., Llama 3, Mistral)
3. Start the local server on port 1234
4. Verify: `curl http://localhost:1234/v1/models`

### Visual Bridge (for WebMCP tests)

1. Start Visual Bridge:
   ```bash
   python systems/visual_shell/api/visual_bridge.py
   ```
2. Verify: `curl http://localhost:8769/health`

## Success Criteria

| Test Suite | Success Criteria |
|------------|------------------|
| LM Studio Perception | LLM correctly identifies windows, focus, mouse state |
| LM Studio Action | LLM generates valid YAML commands that execute |
| WebMCP Integration | REST API returns correct state, accepts commands |
| E2E Loop | Complete read-decide-act-verify cycle works |

## Troubleshooting

### LM Studio not responding

- Check LM Studio is running: `curl http://localhost:1234/v1/models`
- Ensure a model is loaded
- Check server settings in LM Studio

### WebMCP tests failing

- Check Visual Bridge is running: `curl http://localhost:8769/health`
- Verify GUI fragments directory exists: `.geometry/gui/fragments/`
- Check Visual Bridge logs for errors

### Tests skipped

- Tests are skipped automatically if required services are not available
- Use `--check` flag to verify service availability
