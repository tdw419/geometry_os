# Clipboard History - Tasks

## Task 1: Create Clipboard History Data Module [x]
- Create `systems/clipboard/__init__.py`
- Create `systems/clipboard/history.py` with ClipboardEntry and ClipboardHistory classes
- Create `tests/test_clipboard_history.py`
- TDD: Write tests first, then implement

## Task 2: Create Enhanced HTTP Clipboard Server [x]
- Create `systems/clipboard/server.py` with enhanced endpoints
- Create `tests/test_clipboard_server.py`
- Endpoints: /clipboard, /clipboard/history, /clipboard/history/N, /clipboard/since/<id>

## Task 3: Add CLI Tool for Testing
- Create `systems/clipboard/cli.py`
- Commands: get, post, history, poll

## Task 4: Integration Tests
- Create `tests/test_clipboard_integration.py`
- Test round-trip and polling

## Task 5: Update Remote System
- Create documentation for remote setup
- Deploy to remote system

## Verification
- All tests pass
- Can POST from Local, GET from Remote
- History persists across restarts
