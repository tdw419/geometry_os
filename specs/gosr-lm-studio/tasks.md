# Tasks: GOSR LM Studio Integration

## Phase 1: Make It Work (POC)

Focus: Validate LLM integration works end-to-end. Skip tests, accept hardcoded values.

- [x] 1.1 Create LLMNarrativeClient module
  - **Do**:
    1. Create `systems/evolution_daemon/narrative_broadcaster/llm_client.py` with LLMConfig dataclass and LLMNarrativeClient class
    2. Implement `is_available()` with 60s TTL cache
    3. Implement `generate_narrative()` with 30s timeout
    4. Add station-specific system prompts (87.6, 92.3, 95.1, 99.9)
    5. Add telemetry context builder for segment types
  - **Files**: `systems/evolution_daemon/narrative_broadcaster/llm_client.py` (create)
  - **Done when**: `python3 -c "from systems.evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient, LLMConfig; print('OK')"` succeeds
  - **Verify**: `python3 -c "from systems.evolution_daemon.narrative_broadcaster.llm_client import LLMNarrativeClient; c = LLMNarrativeClient(); print(c.is_available() or 'unavailable')"`
  - **Commit**: `feat(radio): add LLMNarrativeClient for LM Studio integration`
  - _Requirements: FR-1, FR-2, FR-3, FR-4, FR-8_
  - _Design: LLMNarrativeClient component_

- [ ] 1.2 Update __init__.py exports
  - **Do**:
    1. Add `from .llm_client import LLMNarrativeClient, LLMConfig` to `__init__.py`
    2. Add to `__all__` list
  - **Files**: `systems/evolution_daemon/narrative_broadcaster/__init__.py` (modify)
  - **Done when**: `python3 -c "from systems.evolution_daemon.narrative_broadcaster import LLMNarrativeClient, LLMConfig; print('OK')"` succeeds
  - **Verify**: `python3 -c "from systems.evolution_daemon.narrative_broadcaster import LLMNarrativeClient; c = LLMNarrativeClient(); print(type(c).__name__)"`
  - **Commit**: `feat(radio): export LLMNarrativeClient from narrative_broadcaster`
  - _Requirements: FR-1_

- [x] 1.3 Integrate LLM client into SegmentPool
  - **Do**:
    1. Modify `SegmentPool.__init__()` to accept optional `llm_client` parameter
    2. Modify `generate_content()` to try LLM first, fallback to existing template logic
    3. Add validation: non-empty, <500 chars for LLM response
    4. Add station_id parameter to `generate_content()` signature
  - **Files**: `systems/evolution_daemon/narrative_broadcaster/segment_pool.py` (modify at lines 114-121 and 201-242)
  - **Done when**: `SegmentPool(llm_client=some_client).generate_content()` uses LLM when available, template when not
  - **Verify**: `python3 -c "from systems.evolution_daemon.narrative_broadcaster import SegmentPool, LLMNarrativeClient; p = SegmentPool(llm_client=LLMNarrativeClient()); print(p.generate_content('weather', {'entropy': 0.5}, 'Test')[:50])"`
  - **Commit**: `feat(radio): integrate LLM client into SegmentPool with template fallback`
  - _Requirements: FR-5_
  - _Design: SegmentPool Modification section_

- [x] 1.4 Wire LLM into NarrativeBroadcaster
  - **Do**:
    1. Modify `NarrativeBroadcaster.__init__()` to accept `use_llm` and `llm_config` parameters
    2. Create `LLMNarrativeClient` when `use_llm=True`
    3. Pass client to `SegmentPool` constructor
    4. Log LLM availability status on initialization
  - **Files**: `systems/evolution_daemon/narrative_broadcaster/broadcaster.py` (modify at lines 81-112)
  - **Done when**: `NarrativeBroadcaster(use_llm=True)` creates LLM client, `(use_llm=False)` does not
  - **Verify**: `python3 -c "from systems.evolution_daemon.narrative_broadcaster import NarrativeBroadcaster; b = NarrativeBroadcaster(use_llm=True); print(hasattr(b._segment_pool, '_llm_client'))"`
  - **Commit**: `feat(radio): wire LLM client into NarrativeBroadcaster`
  - _Requirements: FR-5_
  - _Design: NarrativeBroadcaster Wiring section_

- [x] 1.5 Add CLI flags for LLM control
  - **Do**:
    1. Add `--lm-studio` flag to enable LLM (default: off for backward compat)
    2. Add `--no-lm` flag to explicitly disable
    3. Add `--lm-url` flag to configure URL (default: http://localhost:1234/v1)
    4. Wire flags to `enable_radio()` call
  - **Files**: `systems/evolution_daemon/evolution_daemon.py` (modify argparse section)
  - **Done when**: `python3 systems/evolution_daemon/evolution_daemon.py --help | grep -E "(lm|narrative)"` shows new flags
  - **Verify**: `python3 systems/evolution_daemon/evolution_daemon.py --help | grep "lm-url"`
  - **Commit**: `feat(daemon): add CLI flags for LM Studio narrative control`
  - _Requirements: FR-6, AC-4.1 to AC-4.5_
  - _Design: CLI Flags section_

- [ ] 1.6 [VERIFY] POC Checkpoint
  - **Do**: Run manual verification of end-to-end flow
    1. Start daemon with `--radio --lm-studio` (without LM Studio running)
    2. Verify broadcasts use templates (no crash)
    3. Start LM Studio with a model loaded
    4. Verify broadcasts transition to LLM content
  - **Verify**: `timeout 10 python3 -c "from systems.evolution_daemon.narrative_broadcaster import NarrativeBroadcaster; b = NarrativeBroadcaster(use_llm=True); s = b.broadcast({'entropy': 0.5}); print(s.content[:50] if s else 'None')"`
  - **Done when**: Broadcasts work with and without LM Studio running
  - **Commit**: `feat(radio): complete POC for LM Studio integration`

## Phase 2: Refactoring

- [x] 2.1 Add comprehensive error handling
  - **Do**:
    1. Add try/except around all HTTP calls in `LLMNarrativeClient`
    2. Catch `requests.Timeout`, `requests.ConnectionError`, `KeyError`, `IndexError`
    3. Ensure all error paths return `None` (trigger template fallback)
    4. Log errors at DEBUG level to avoid spam (AC-2.6)
  - **Files**: `systems/evolution_daemon/narrative_broadcaster/llm_client.py` (modify)
  - **Done when**: All failure modes gracefully fall back to templates
  - **Verify**: `python3 -c "from systems.evolution_daemon.narrative_broadcaster import LLMNarrativeClient; c = LLMNarrativeClient(); c.config.lm_studio_url = 'http://invalid:9999'; print(c.generate_narrative('weather', {}, '87.6'))"`
  - **Commit**: `refactor(radio): add comprehensive error handling to LLMNarrativeClient`
  - _Requirements: AC-2.1 to AC-2.6_
  - _Design: Error Handling section_

- [ ] 2.2 [VERIFY] Quality checkpoint: ruff + import test
  - **Do**: Run lint and import verification
  - **Verify**: `ruff check systems/evolution_daemon/narrative_broadcaster/ && python3 -c "from systems.evolution_daemon.narrative_broadcaster import LLMNarrativeClient, LLMConfig, SegmentPool, NarrativeBroadcaster; print('All imports OK')"`
  - **Done when**: No lint errors, all imports work
  - **Commit**: `chore(radio): pass quality checkpoint` (only if fixes needed)

## Phase 3: Testing

- [x] 3.1 Add unit tests for LLMNarrativeClient
  - **Do**:
    1. Create `TestLLMNarrativeClient` class in existing test file
    2. Add tests: initialization, is_available (mocked), generate_narrative (mocked)
    3. Test availability caching (two calls within 60s, second should be cached)
    4. Test station prompt selection (87.6, 92.3, 95.1, 99.9)
    5. Test telemetry context builder for different segment types
  - **Files**: `systems/evolution_daemon/tests/test_narrative_broadcaster.py` (modify)
  - **Done when**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestLLMNarrativeClient -v` passes with 8+ tests
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestLLMNarrativeClient -v --tb=short`
  - **Commit**: `test(radio): add unit tests for LLMNarrativeClient`
  - _Requirements: AC-1.1 to AC-1.6, AC-3.1 to AC-3.4, AC-5.1 to AC-5.6_
  - _Design: Test Strategy section_

- [x] 3.2 Add integration tests for SegmentPool LLM integration
  - **Do**:
    1. Create `TestSegmentPoolLLMIntegration` class
    2. Test: pool without LLM uses templates
    3. Test: pool with mock LLM available uses LLM content
    4. Test: pool with mock LLM returning None falls back to template
    5. Test: pool with LLM returning empty string falls back
    6. Test: pool with LLM returning >500 chars falls back
  - **Files**: `systems/evolution_daemon/tests/test_narrative_broadcaster.py` (modify)
  - **Done when**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestSegmentPoolLLMIntegration -v` passes
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestSegmentPoolLLMIntegration -v --tb=short`
  - **Commit**: `test(radio): add SegmentPool LLM integration tests`
  - _Requirements: AC-2.2, AC-2.5_
  - _Design: Test Strategy - Integration Tests section_

- [x] 3.3 Add integration tests for NarrativeBroadcaster LLM integration
  - **Do**:
    1. Create `TestNarrativeBroadcasterLLMIntegration` class
    2. Test: broadcaster creates LLM client by default when use_llm=True
    3. Test: broadcaster with use_llm=False has no LLM client
    4. Test: broadcast uses LLM content when available
    5. Test: broadcast falls back to template when LLM unavailable
  - **Files**: `systems/evolution_daemon/tests/test_narrative_broadcaster.py` (modify)
  - **Done when**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestNarrativeBroadcasterLLMIntegration -v` passes
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py::TestNarrativeBroadcasterLLMIntegration -v --tb=short`
  - **Commit**: `test(radio): add NarrativeBroadcaster LLM integration tests`
  - _Requirements: FR-5_

- [ ] 3.4 [VERIFY] Full test suite passes
  - **Do**: Run all narrative broadcaster tests
  - **Verify**: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v`
  - **Done when**: All tests pass, no regressions
  - **Commit**: `chore(radio): pass full test suite` (only if fixes needed)

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run all quality checks locally
  - **Verify**:
    - Lint: `ruff check systems/evolution_daemon/narrative_broadcaster/`
    - Tests: `pytest systems/evolution_daemon/tests/test_narrative_broadcaster.py -v`
  - **Done when**: All commands pass with no errors
  - **Commit**: `fix(radio): address lint/type issues` (if fixes needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch is feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin <branch-name>`
    3. Create PR: `gh pr create --title "feat(radio): add LM Studio integration for GOSR Radio" --body "..."`
  - **Verify**: `gh pr checks --watch` (wait for CI completion)
  - **Done when**: All CI checks green, PR ready for review
  - **If CI fails**: Fix issues locally, push fixes, re-verify

## Phase 5: PR Lifecycle

- [ ] 5.1 Monitor CI and address failures
  - **Do**: Watch for CI failures, fix promptly
  - **Verify**: `gh pr checks`
  - **Done when**: All checks show passing status

- [ ] 5.2 Address code review comments
  - **Do**: Respond to review feedback, make changes
  - **Verify**: All comments resolved
  - **Done when**: Review approved

- [ ] 5.3 Final validation
  - **Do**: Verify zero test regressions, modularity, real-world verification
  - **Verify**: Manual test with/without LM Studio running
  - **Done when**: Feature complete and merged

---

## Unresolved Questions

None - all questions resolved during research phase.

## Notes

**POC shortcuts taken**:
- Default LLM disabled (backward compatible)
- Simple sync HTTP client (async not needed for broadcast intervals)
- Single temperature (0.8) for all stations

**Production TODOs**:
- Consider async LLM generation if broadcast intervals become sub-second
- Consider per-station temperature tuning if needed
- Consider response caching for identical telemetry states (currently: no cache)

**Key Design Decisions**:
1. **Hybrid Approach**: LLM preferred, templates as fallback
2. **Graceful Degradation**: System continues broadcasting even if LM Studio unavailable
3. **Station Prompts**: Each station has unique system prompt for consistent personality
4. **Availability Caching**: 60s cache avoids repeated failed requests
5. **CLI Control**: Easy enable/disable via `--lm-studio` and `--no-lm` flags
6. **Backward Compatible**: LLM disabled by default, existing behavior preserved
