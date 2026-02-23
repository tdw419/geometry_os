---
spec: swarm-neb-bridge-completion
phase: tasks
total_tasks: 12
created: 2026-02-22T12:00:00Z
generated: auto
---

# Tasks: SwarmNEBBridge Completion

## Phase 1: Make It Work (POC)

- [ ] 1.1 Create test file with failing subscription tests
  - **Do**: Create `tests/swarm/test_swarm_neb_bridge.py` with 4 test methods: test_subscribe_to_proposals, test_subscribe_to_votes, test_subscribe_to_consensus, test_unsubscribe_from_proposals
  - **Files**: `tests/swarm/test_swarm_neb_bridge.py`
  - **Done when**: Test file exists with all 4 test methods
  - **Verify**: `pytest tests/swarm/test_swarm_neb_bridge.py --collect-only` shows 4 tests
  - **Commit**: (no commit yet - TDD red phase)
  - _Requirements: FR-1, FR-2, FR-3, FR-4_

- [ ] 1.2 Verify tests fail (red phase)
  - **Do**: Run pytest to confirm AttributeError for missing methods
  - **Files**: `tests/swarm/test_swarm_neb_bridge.py`
  - **Done when**: Tests fail with "AttributeError: 'SwarmNEBBridge' object has no attribute 'subscribe_to_proposals'"
  - **Verify**: `pytest tests/swarm/test_swarm_neb_bridge.py -v` exits with failure
  - **Commit**: (no commit - TDD red phase)

- [ ] 1.3 Implement subscription methods
  - **Do**: Add 4 methods to SwarmNEBBridge class: subscribe_to_proposals, subscribe_to_votes, subscribe_to_consensus, unsubscribe. Each subscription method checks event_bus and delegates to NEBBus.subscribe with wildcard pattern.
  - **Files**: `systems/swarm/swarm_neb_bridge.py`
  - **Done when**: All 4 methods implemented with RuntimeError for missing event_bus
  - **Verify**: Type check passes with `python -c "from systems.swarm.swarm_neb_bridge import SwarmNEBBridge; print('OK')"`
  - **Commit**: `feat(swarm): add subscription methods to SwarmNEBBridge`
  - _Requirements: FR-1, FR-2, FR-3, FR-4, FR-5_
  - _Design: Method Implementations_

- [ ] 1.4 Verify tests pass (green phase)
  - **Do**: Run pytest to confirm all subscription tests pass
  - **Files**: `tests/swarm/test_swarm_neb_bridge.py`, `systems/swarm/swarm_neb_bridge.py`
  - **Done when**: 4 tests pass
  - **Verify**: `pytest tests/swarm/test_swarm_neb_bridge.py -v` shows 4 passed
  - **Commit**: `feat(swarm): add subscription methods to SwarmNEBBridge`

- [ ] 1.5 POC Checkpoint
  - **Do**: Verify subscription flow works end-to-end
  - **Done when**: Can demonstrate bridge subscribing to proposal events and receiving notifications
  - **Verify**: `pytest tests/swarm/test_swarm_neb_bridge.py -v` all green
  - **Commit**: (included in 1.4)

## Phase 2: Refactoring

- [ ] 2.1 Add integration tests
  - **Do**: Add TestSwarmNEBBridgeIntegration class with 3 tests: test_full_consensus_flow_with_notifications, test_bridge_works_without_event_bus, test_multi_agent_coordination_via_neb
  - **Files**: `tests/swarm/test_swarm_neb_bridge.py`
  - **Done when**: 3 integration tests added
  - **Verify**: `pytest tests/swarm/test_swarm_neb_bridge.py -v` shows 7 passed
  - **Commit**: `test(swarm): add SwarmNEBBridge integration tests`
  - _Requirements: FR-5, FR-6_

- [ ] 2.2 Verify graceful degradation
  - **Do**: Ensure test_bridge_works_without_event_bus passes (core ops work, subscribe raises RuntimeError)
  - **Files**: `tests/swarm/test_swarm_neb_bridge.py`
  - **Done when**: Test confirms RuntimeError on subscribe without event_bus
  - **Verify**: `pytest tests/swarm/test_swarm_neb_bridge.py::TestSwarmNEBBridgeIntegration::test_bridge_works_without_event_bus -v`
  - **Commit**: (included in 2.1)
  - _Requirements: FR-5, FR-6_

## Phase 3: Testing

- [ ] 3.1 Run full swarm test suite
  - **Do**: Execute all tests in tests/swarm/ directory
  - **Files**: `tests/swarm/`
  - **Done when**: All tests pass (72 existing + 7 new = 79 total)
  - **Verify**: `pytest tests/swarm/ -v` exits with 0
  - **Commit**: `fix(swarm): address test issues` (only if fixes needed)

- [ ] 3.2 Verify no regressions
  - **Do**: Confirm all existing swarm tests still pass
  - **Files**: `tests/swarm/`
  - **Done when**: No test failures or errors
  - **Verify**: `pytest tests/swarm/ --tb=short` shows all passed
  - **Commit**: (only if fixes needed)
  - _Requirements: NFR-2_

## Phase 4: Quality Gates

- [ ] 4.1 Add module export
  - **Do**: Add `from systems.swarm.swarm_neb_bridge import SwarmNEBBridge` to `systems/swarm/__init__.py` and add to `__all__` list
  - **Files**: `systems/swarm/__init__.py`
  - **Done when**: SwarmNEBBridge importable from systems.swarm
  - **Verify**: `python -c "from systems.swarm import SwarmNEBBridge; print('OK')"` outputs OK
  - **Commit**: `feat(swarm): export SwarmNEBBridge from module`
  - _Requirements: FR-7_

- [ ] 4.2 Final verification
  - **Do**: Run full test suite and verify import works
  - **Files**: `systems/swarm/__init__.py`, `tests/swarm/`
  - **Done when**: All tests pass, import works
  - **Verify**: `pytest tests/swarm/ -v && python -c "from systems.swarm import SwarmNEBBridge"`
  - **Commit**: (included in 4.1)

- [ ] 4.3 Create PR
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR created and CI passing
  - **Commit**: (all commits already made)

## Notes

- **POC shortcuts**: None - straightforward implementation
- **Production TODOs**: None - complete feature
- **Test count**: 4 subscription + 3 integration = 7 new tests
