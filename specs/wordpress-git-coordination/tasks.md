---
spec: wordpress-git-coordination
phase: tasks
total_tasks: 20
created: 2026-02-21T19:00:00Z
---

# Tasks: WordPress-Git Coordination System

## Phase 1: Make It Work (POC)

Focus: Validate core claim/release cycle works end-to-end. Skip tests, accept hardcoded values.

- [x] 1.1 Create geometry-tracks.php plugin with track_claim CPT
  - **Do**:
    1. Create `wordpress_zone/wordpress/wp-content/plugins/geometry-tracks.php`
    2. Register `track_claim` custom post type on `init` hook
    3. Add admin columns: Agent ID, Files Count, Heartbeat
    4. Add "EXPIRED" badge for heartbeat > 10 min
  - **Files**: `wordpress_zone/wordpress/wp-content/plugins/geometry-tracks.php`
  - **Done when**: Plugin activates without error, CPT visible in WordPress admin menu
  - **Verify**: `curl -s http://localhost:8080/wp-admin/edit.php?post_type=track_claim | grep -q "track_claim"` or manual check in WordPress admin
  - **Commit**: `feat(tracks): add track_claim CPT WordPress plugin`
  - _Requirements: FR-2, AC-4.1, AC-4.2_
  - _Design: Component 2 (track_claim CPT)_

- [x] 1.2 Add track handlers to ai-publisher.php
  - **Do**:
    1. Add `claimTrack` switch case: check overlaps via `strpos()`, insert CPT, return claim_id
    2. Add `releaseTrack` switch case: verify agent_id owner, set post_status to `trash`
    3. Add `listTracks` switch case: query active claims with heartbeat filter
    4. Add `heartbeatTrack` switch case: update meta_heartbeat timestamp
    5. Include Visual Bridge WebSocket notification on claim/release
  - **Files**: `wordpress_zone/wordpress/ai-publisher.php`
  - **Done when**: All 4 handlers respond to curl requests with valid JSON
  - **Verify**:
    ```bash
    curl -s -X POST http://localhost:8080/ai-publisher.php -H 'Content-Type: application/json' -d '{"action":"claimTrack","track_id":"test-track","agent_id":"test-agent","files":["test/path/"]}' | jq '.success'
    ```
  - **Commit**: `feat(tracks): add claimTrack, releaseTrack, listTracks, heartbeatTrack handlers`
  - _Requirements: FR-1, AC-1.1, AC-1.2, AC-1.3, AC-1.4, AC-2.1, AC-2.2, AC-2.3, AC-2.5_
  - _Design: Component 1 (ai-publisher.php Track Handlers)_

- [x] 1.3 Create TrackManager Python client
  - **Do**:
    1. Create `wordpress_zone/track_manager.py`
    2. Implement `TrackManager.__init__(wp_url, timeout=5.0)`
    3. Implement `claim(track_id, files, agent_id)` - POST claimTrack
    4. Implement `release(track_id, agent_id)` - POST releaseTrack
    5. Implement `check_conflicts(files)` - POST listTracks + local overlap check
    6. Implement `heartbeat(track_id, agent_id)` - POST heartbeatTrack
    7. Implement `list_active()` - GET listTracks
    8. Handle connection errors gracefully (raise exception for agent, return exit code for CLI)
  - **Files**: `wordpress_zone/track_manager.py`
  - **Done when**: Python class can claim/release via WordPress API
  - **Verify**: `python3 -c "from wordpress_zone.track_manager import TrackManager; m=TrackManager(); r=m.claim('test','files','agent'); print(r['success'])"`
  - **Commit**: `feat(tracks): add TrackManager Python client`
  - _Requirements: FR-5, AC-1.1, AC-2.1_
  - _Design: Component 3 (track_manager.py)_

- [x] 1.4 Add CLI interface to track_manager.py
  - **Do**:
    1. Add `if __name__ == "__main__":` block with argparse
    2. Add `check` subcommand: `python3 track_manager.py check --files "file1 file2"`
    3. Exit codes: 0=no conflict, 1=conflict, 2=WordPress unavailable
    4. Output conflict details to stderr when exit code 1
  - **Files**: `wordpress_zone/track_manager.py`
  - **Done when**: CLI returns correct exit codes for conflict/no-conflict scenarios
  - **Verify**:
    ```bash
    python3 wordpress_zone/track_manager.py check --files "systems/visual_shell/shotcut/" && echo "NO CONFLICT"
    ```
  - **Commit**: `feat(tracks): add CLI interface to TrackManager`
  - _Requirements: FR-6, AC-3.4, AC-3.5_
  - _Design: Component 3 (track_manager.py CLI)_

- [ ] 1.5 POC Checkpoint: End-to-end claim cycle
  - **Do**:
    1. Claim track via Python: `TrackManager().claim('test-track', ['test/path/'], 'test-agent')`
    2. Verify claim appears in WordPress admin at `edit.php?post_type=track_claim`
    3. Release track via Python: `TrackManager().release('test-track', 'test-agent')`
    4. Verify claim removed from WordPress admin
  - **Done when**: Claim appears and disappears in WordPress admin via Python API
  - **Verify**: `python3 -c "from wordpress_zone.track_manager import TrackManager; m=TrackManager(); print('OK' if m.claim('e2e-test',['e2e/'],'test')['success'] else 'FAIL')"`
  - **Commit**: `feat(tracks): POC checkpoint - claim/release cycle works`
  - _Requirements: US-1, US-2_
  - _Design: Data Flow Sequence Diagram_

## Phase 2: Refactoring

After POC validated, clean up code structure.

- [ ] 2.1 Add error handling to ai-publisher.php handlers
  - **Do**:
    1. Add input validation (missing track_id, agent_id, files)
    2. Return proper HTTP status codes (400, 404, 409, 410)
    3. Add consistent error response format `{"success": false, "error": "..."}`
    4. Handle edge cases: release non-existent claim, heartbeat on expired claim
  - **Files**: `wordpress_zone/wordpress/ai-publisher.php`
  - **Done when**: All error paths return appropriate HTTP codes
  - **Verify**: `curl -s -X POST http://localhost:8080/ai-publisher.php -d '{"action":"claimTrack"}' | jq '.success'` returns `false`
  - **Commit**: `refactor(tracks): add error handling to track handlers`
  - _Design: Error Handling section_

- [ ] 2.2 Add error handling to TrackManager
  - **Do**:
    1. Add try/except around HTTP requests
    2. Raise `TrackManagerError` on WordPress unavailable
    3. Return structured error info in response dicts
    4. Add docstrings to all public methods
  - **Files**: `wordpress_zone/track_manager.py`
  - **Done when**: All methods handle exceptions gracefully
  - **Verify**: `python3 -c "from wordpress_zone.track_manager import TrackManager; m=TrackManager('http://invalid:9999'); m.claim('x',[],'y')"` raises exception
  - **Commit**: `refactor(tracks): add error handling to TrackManager`
  - _Design: Error Handling section_

- [ ] 2.3 [VERIFY] Quality checkpoint: Python lint + syntax
  - **Do**: Run quality commands on new Python code
  - **Verify**:
    ```bash
    python3 -m py_compile wordpress_zone/track_manager.py && echo "Syntax OK"
    python3 -m flake8 wordpress_zone/track_manager.py --max-line-length=120 || echo "Lint warnings (OK for POC)"
    ```
  - **Done when**: Python compiles without syntax errors
  - **Commit**: `chore(tracks): pass quality checkpoint` (only if fixes needed)

- [ ] 2.4 Add Visual Bridge handlers for track events
  - **Do**:
    1. Add `track_claim` handler in `handle_client()` switch
    2. Add `track_release` handler in `handle_client()` switch
    3. Broadcast `TRACK_CLAIMED` event with track_id, agent_id, coordinates
    4. Broadcast `TRACK_RELEASED` event with track_id
  - **Files**: `systems/visual_shell/api/visual_bridge.py`
  - **Done when**: WebSocket receives track events on claim/release
  - **Verify**: Check Visual Bridge logs for `TRACK_CLAIMED` broadcast when claim made
  - **Commit**: `feat(tracks): add Visual Bridge track handlers`
  - _Requirements: FR-7, AC-5.1, AC-5.2, AC-5.3_
  - _Design: Component 5 (Visual Bridge Track Handlers)_

## Phase 3: Testing

- [ ] 3.1 Unit tests for TrackManager
  - **Do**:
    1. Create `tests/test_track_manager.py`
    2. Test `claim()` returns success dict on 200 response
    3. Test `claim()` returns conflict dict on 409 response
    4. Test `check_conflicts()` detects overlapping paths
    5. Test `check_conflicts()` returns empty for non-overlapping
    6. Test `release()` returns success on 200
    7. Test graceful degradation when WordPress unavailable
    8. Mock HTTP responses using `unittest.mock`
  - **Files**: `tests/test_track_manager.py`
  - **Done when**: `pytest tests/test_track_manager.py -v` passes all tests
  - **Verify**: `cd /home/jericho/zion/projects/geometry_os/geometry_os && python3 -m pytest tests/test_track_manager.py -v`
  - **Commit**: `test(tracks): add TrackManager unit tests`
  - _Requirements: FR-5_
  - _Design: Test Strategy - Unit Tests_

- [ ] 3.2 Integration tests for claim/release cycle
  - **Do**:
    1. Add integration tests to `tests/test_track_manager.py`
    2. Test full claim -> check -> commit -> release cycle
    3. Test conflict detection between two agents
    4. Test heartbeat expiry (mock time or use short expiry)
    5. Test idempotent release of non-existent track
    6. Skip if WordPress not available (mark with `pytest.mark.skipif`)
  - **Files**: `tests/test_track_manager.py`
  - **Done when**: `pytest tests/test_track_manager.py -v -m integration` passes
  - **Verify**: `python3 -m pytest tests/test_track_manager.py -v -k "integration"`
  - **Commit**: `test(tracks): add integration tests for claim/release cycle`
  - _Requirements: US-1, US-2, US-3_
  - _Design: Test Strategy - Integration Tests_

- [ ] 3.3 [VERIFY] Quality checkpoint: tests pass
  - **Do**: Run all track-related tests
  - **Verify**: `python3 -m pytest tests/test_track_manager.py -v`
  - **Done when**: All tests pass
  - **Commit**: `chore(tracks): pass test checkpoint` (only if fixes needed)

## Phase 4: Quality Gates

- [ ] 4.1 Extend pre-commit hook with track check
  - **Do**:
    1. Append track conflict check section to `.git/hooks/pre-commit`
    2. Get staged files: `git diff --cached --name-only --diff-filter=ACM`
    3. Call `python3 wordpress_zone/track_manager.py check --files "$STAGED_FILES"`
    4. Exit 1 on conflict (exit code 1), exit 0 on no conflict (0) or WordPress down (2)
    5. Support `SKIP_TRACK_CHECK=true` bypass
    6. Print warning (not error) when WordPress unavailable
  - **Files**: `.git/hooks/pre-commit`
  - **Done when**: Hook blocks commits with conflicting files, allows when WordPress down
  - **Verify**:
    ```bash
    echo "test" >> wordpress_zone/track_manager.py && git add wordpress_zone/track_manager.py
    SKIP_TRACK_CHECK=true git commit -m "test" && git reset HEAD~1
    ```
  - **Commit**: `feat(tracks): add pre-commit track conflict check`
  - _Requirements: FR-6, AC-3.1, AC-3.2, AC-3.3, AC-3.5, AC-3.6_
  - _Design: Component 4 (Pre-commit Hook Extension)_

- [ ] 4.2 [VERIFY] Full local CI: syntax + tests
  - **Do**: Run all quality commands on track-related code
  - **Verify**:
    ```bash
    python3 -m py_compile wordpress_zone/track_manager.py && \
    python3 -m pytest tests/test_track_manager.py -v && \
    echo "All checks passed"
    ```
  - **Done when**: All commands exit 0
  - **Commit**: `chore(tracks): pass local CI` (if fixes needed)

- [ ] 4.3 Create PR and verify CI
  - **Do**:
    1. Verify current branch is feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin feat/ai-skills-system`
    3. Create PR: `gh pr create --title "feat(tracks): WordPress-Git coordination system" --body "Multi-agent coordination via WordPress Track Board"`
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: CI checks pass on PR
  - **Commit**: None

## Phase 5: PR Lifecycle

- [ ] 5.1 E2E manual verification
  - **Do**:
    1. Start WordPress: verify `localhost:8080` responds
    2. Claim track via Python: `TrackManager().claim('e2e-test', ['e2e/'], 'e2e-agent')`
    3. Verify claim in WordPress admin: `http://localhost:8080/wp-admin/edit.php?post_type=track_claim`
    4. Attempt conflicting commit (should be blocked)
    5. Release track: `TrackManager().release('e2e-test', 'e2e-agent')`
    6. Verify claim removed from admin
    7. Commit should now succeed
  - **Done when**: Full cycle verified manually
  - **Verify**: Document in `.progress.md` with screenshot or log excerpts
  - **Commit**: `docs(tracks): add E2E verification notes`

- [ ] 5.2 Address review feedback
  - **Do**: Monitor PR for review comments, address each item
  - **Verify**: All review comments resolved
  - **Done when**: PR approved by reviewer
  - **Commit**: (varies based on feedback)

- [ ] 5.3 Final verification: CI green, no regressions
  - **Do**:
    1. Run `gh pr checks` to verify all CI green
    2. Verify no test regressions in related tests
    3. Merge PR when all checks pass
  - **Verify**: `gh pr checks --watch` completes with all green
  - **Done when**: PR merged to main
  - **Commit**: None

## Notes

### POC Shortcuts
- No authentication on track API (trusts local agents)
- No file path validation (assumes valid paths)
- 10-min heartbeat hardcoded (not configurable)
- Visual Bridge coordinates derived from track_id hash

### Production TODOs
- Add API key authentication for agents
- Make heartbeat interval configurable
- Add file path validation against git ls-files
- Implement claim archiving (currently marks as trash)
- Add claim transfer between agents
- Add multi-file atomic claims across tracks

### Quality Commands Discovered
- Python syntax: `python3 -m py_compile <file>`
- Python lint: `python3 -m flake8 <file>` (if available)
- Tests: `python3 -m pytest tests/test_track_manager.py -v`
- Rust CI: `make ci` (for Rust components)

### Unresolved Questions
1. Expired claims: mark as `trash` (chosen) vs delete
2. Coordinate derivation: hash of track_id (chosen) vs lookup table
