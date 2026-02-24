# Tasks: gos-term CLI

## Phase 1: Make It Work (POC)

Focus: Validate CLI works end-to-end with WebSocket bridge. Skip full test coverage.

- [x] 1.1 CLI entry point with argparse
  - **Do**:
    1. Create `systems/visual_shell/api/gos_term_cli.py`
    2. Implement `parse_args()` with: command (nargs=*), -i/--interactive, -p/--port, --neb, --timeout
    3. Implement `main()` stub that prints args for verification
  - **Files**: `systems/visual_shell/api/gos_term_cli.py`
  - **Done when**: `python3 gos_term_cli.py --help` shows usage; `python3 gos_term_cli.py echo hello` prints args
  - **Verify**: `python3 systems/visual_shell/api/gos_term_cli.py --help | grep -q "Geometry OS"`
  - **Commit**: `feat(cli): add gos-term CLI entry point`
  - _Requirements: FR-1_
  - _Design: GosTermCLI_

- [x] 1.2 WebSocket command execution
  - **Do**:
    1. Add `run_command_async()` with websockets connection
    2. Send resize + command input messages
    3. Collect output until timeout
    4. Add `run_command()` sync wrapper
    5. Wire into `main()` for non-interactive mode
  - **Files**: `systems/visual_shell/api/gos_term_cli.py`
  - **Done when**: `python3 gos_term_cli.py echo TEST_OUTPUT_123` prints "TEST_OUTPUT_123"
  - **Verify**: `python3 systems/visual_shell/api/gos_term_cli.py echo CLI_VERIFY_TEST 2>&1 | grep -q "CLI_VERIFY_TEST"`
  - **Commit**: `feat(cli): add WebSocket command execution`
  - _Requirements: FR-2_
  - _Design: CommandExecutor_

- [x] 1.3 Interactive mode
  - **Do**:
    1. Add `interactive_session()` with raw terminal mode
    2. Create stdin->ws and ws->stdout async tasks
    3. Handle termios save/restore
    4. Wire into `main()` for `-i` flag
  - **Files**: `systems/visual_shell/api/gos_term_cli.py`
  - **Done when**: `python3 gos_term_cli.py -i` opens terminal; Ctrl+D exits cleanly
  - **Verify**: `echo "exit" | timeout 3 python3 systems/visual_shell/api/gos_term_cli.py -i 2>&1 | head -1 | grep -q .`
  - **Commit**: `feat(cli): add interactive mode`
  - _Requirements: FR-3_
  - _Design: InteractiveSession_

- [x] 1.4 NEB integration
  - **Do**:
    1. Add `_publish_to_neb()` helper
    2. Import NEBBus with try/except (optional dependency)
    3. Publish to `gos.term.command` topic
    4. Wire into `run_command_async()` when `neb=True`
  - **Files**: `systems/visual_shell/api/gos_term_cli.py`
  - **Done when**: `python3 gos_term_cli.py --neb echo test` runs without error (NEB may not be listening)
  - **Verify**: `python3 systems/visual_shell/api/gos_term_cli.py --neb echo NEB_TEST 2>&1 | grep -q "NEB_TEST"`
  - **Commit**: `feat(cli): add NEB event publishing`
  - _Requirements: FR-4_
  - _Design: NEBPublisher_

- [x] 1.5 [VERIFY] Quality checkpoint
  - **Do**: Run Python syntax check
  - **Verify**: `python3 -m py_compile systems/visual_shell/api/gos_term_cli.py && echo "OK"`
  - **Done when**: No syntax errors
  - **Commit**: `chore(cli): pass quality checkpoint` (only if fixes needed)

- [x] 1.6 POC Checkpoint
  - **Do**: Start terminal bridge, test full workflow
  - **Verify**:
    ```bash
    python3 systems/visual_shell/api/terminal_websocket_bridge.py &
    sleep 2
    python3 systems/visual_shell/api/gos_term_cli.py echo POC_VERIFY
    pkill -f terminal_websocket_bridge
    ```
  - **Done when**: Output contains "POC_VERIFY"
  - **Commit**: `feat(cli): complete POC`

## Phase 2: Refactoring

- [x] 2.1 Error handling and messages
  - **Do**:
    1. Add clear error message for connection refused
    2. Add clear error message for timeout
    3. Add ImportError message for missing websockets
  - **Files**: `systems/visual_shell/api/gos_term_cli.py`
  - **Done when**: Error messages are user-friendly
  - **Verify**: `python3 systems/visual_shell/api/gos_term_cli.py -p 9999 echo test 2>&1 | grep -q "terminal bridge"`
  - **Commit**: `refactor(cli): add error handling`
  - _Requirements: NFR-2_
  - _Design: Error Handling_

- [x] 2.2 [VERIFY] Quality checkpoint
  - **Do**: Run Python syntax check
  - **Verify**: `python3 -m py_compile systems/visual_shell/api/gos_term_cli.py && echo "OK"`
  - **Done when**: No syntax errors
  - **Commit**: `chore(cli): pass quality checkpoint` (only if fixes needed)

## Phase 3: Testing

- [x] 3.1 Unit tests for argparse
  - **Do**:
    1. Create `systems/visual_shell/api/tests/test_gos_term_cli.py`
    2. Test `parse_args()` with various inputs
    3. Test default values
  - **Files**: `systems/visual_shell/api/tests/test_gos_term_cli.py`
  - **Done when**: Tests pass
  - **Verify**: `python -m pytest systems/visual_shell/api/tests/test_gos_term_cli.py::TestParseArgs -v`
  - **Commit**: `test(cli): add argparse unit tests`
  - _Requirements: FR-1_

- [x] 3.2 Integration tests for command execution
  - **Do**:
    1. Add `TestRunCommand` class
    2. Add skip decorator for missing bridge
    3. Test actual command execution
    4. Test timeout handling
  - **Files**: `systems/visual_shell/api/tests/test_gos_term_cli.py`
  - **Done when**: Tests pass with bridge running
  - **Verify**: `python -m pytest systems/visual_shell/api/tests/test_gos_term_cli.py::TestRunCommand -v`
  - **Commit**: `test(cli): add command execution tests`
  - _Requirements: FR-2_

- [ ] 3.3 [VERIFY] Quality checkpoint
  - **Do**: Run all tests
  - **Verify**: `python -m pytest systems/visual_shell/api/tests/test_gos_term_cli.py -v`
  - **Done when**: All tests pass
  - **Commit**: `chore(cli): pass quality checkpoint` (only if fixes needed)

## Phase 4: Quality Gates

- [ ] 4.1 Shell wrapper script
  - **Do**:
    1. Create `systems/visual_shell/api/gos-term` bash script
    2. Make executable with `chmod +x`
    3. Script calls Python with all args
  - **Files**: `systems/visual_shell/api/gos-term`
  - **Done when**: `./gos-term echo test` works
  - **Verify**: `chmod +x systems/visual_shell/api/gos-term && systems/visual_shell/api/gos-term --help | grep -q "Geometry OS"`
  - **Commit**: `feat(cli): add shell wrapper script`
  - _Requirements: FR-5_

- [ ] 4.2 Documentation
  - **Do**:
    1. Create `systems/visual_shell/api/README_GOS_TERM.md`
    2. Add usage examples
    3. Add installation instructions
  - **Files**: `systems/visual_shell/api/README_GOS_TERM.md`
  - **Done when**: README exists with usage
  - **Verify**: `grep -q "gos-term" systems/visual_shell/api/README_GOS_TERM.md`
  - **Commit**: `docs(cli): add gos-term documentation`

- [ ] 4.3 Local quality check
  - **Do**: Run all quality checks
  - **Verify**:
    ```bash
    python3 -m py_compile systems/visual_shell/api/gos_term_cli.py && \
    python -m pytest systems/visual_shell/api/tests/test_gos_term_cli.py -v --tb=short
    ```
  - **Done when**: All checks pass
  - **Commit**: `chore(cli): pass local CI` (only if fixes needed)

- [ ] 4.4 Create PR and verify CI
  - **Do**:
    1. Verify feature branch: `git branch --show-current`
    2. Push and create PR: `gh pr create --title "feat(cli): add gos-term CLI tool" --body "..."`
  - **Verify**: `gh pr checks --watch` (all green)
  - **Done when**: CI passes
  - **Commit**: None

## Phase 5: PR Lifecycle

- [ ] 5.1 Address review comments (if any)
  - **Do**: Respond to PR feedback, make necessary changes
  - **Verify**: All comments resolved
  - **Done when**: PR approved
  - **Commit**: `fix(cli): address review feedback`

- [ ] 5.2 Final verification
  - **Do**: Re-run all tests locally
  - **Verify**: `python -m pytest systems/visual_shell/api/tests/test_gos_term_cli.py -v && systems/visual_shell/api/gos-term echo FINAL_TEST | grep -q FINAL_TEST`
  - **Done when**: All green
  - **Commit**: None

## Notes

- **POC shortcuts**: No full test coverage in Phase 1, minimal error handling
- **Production TODOs**: Add more test coverage, add CI integration test
- **Dependencies**: Requires terminal_websocket_bridge.py running for integration tests
