---
spec: behavioral-defense
phase: tasks
total_tasks: 19
created: 2026-02-22T21:55:00Z
---

# Tasks: Behavioral Defense Phase 3

## Execution Context

### Interview Responses
- **Testing depth**: Comprehensive - include E2E
- **Deployment approach**: Standard CI/CD pipeline
- **Execution priority**: Ship fast - POC first, polish later
- **Additional context**: Proceed with minimal scope

### Success Criteria
- 26+ tests passing (6 new data_structures + 8 behavioral_monitor + 8 tier_router behavioral + 4 sentinel)
- No regressions in existing test suite
- Package imports work: `from systems.evolution_daemon.safety import AgentBehavioralProfile, BehavioralMonitor`
- Tier demotion works automatically when anomaly detected

---

## Phase 1: Make It Work (POC)

Focus: Validate behavioral monitoring works end-to-end. Skip tests, accept hardcoded values.

- [x] 1.1 Add AgentBehavioralProfile and BehavioralEvent dataclasses
  - **Do**:
    1. Open `systems/evolution_daemon/safety/data_structures.py`
    2. Add `AgentBehavioralProfile` dataclass with fields: agent_id, file_ops_count, network_ops_count, entropy_score, last_activity, sliding_window_start
    3. Add `BehavioralEvent` dataclass with fields: event_id, agent_id, event_type, entropy, timestamp, metadata
    4. Add `calculate_entropy()` method to BehavioralEvent using Counter from collections (simpler than numpy for testability)
    5. Add `is_anomalous()` method to AgentBehavioralProfile that returns True if entropy_score > 0.7
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/data_structures.py`
  - **Done when**: Dataclasses exist with all fields, entropy calculation works
  - **Verify**: `python3 -c "from systems.evolution_daemon.safety.data_structures import AgentBehavioralProfile, BehavioralEvent; print('OK')"`
  - **Commit**: `feat(safety): add AgentBehavioralProfile and BehavioralEvent dataclasses`
  - _Requirements: FR-1, FR-2_

- [x] 1.2 Create BehavioralMonitor service
  - **Do**:
    1. Create `systems/evolution_daemon/safety/behavioral_monitor.py`
    2. Implement `BehavioralMonitor` class with constructor accepting optional thresholds
    3. Add class constants: ANOMALY_THRESHOLD = 0.7, SLIDING_WINDOW_SECONDS = 300
    4. Implement `record_event(agent_id, event_type, metadata)` that creates BehavioralEvent and updates profile
    5. Implement `get_profile(agent_id)` returning AgentBehavioralProfile
    6. Implement `calculate_anomaly_score(profile)` using 40/30/30 weights (file_ops, network_ops, entropy)
    7. Implement `is_anomalous(agent_id)` returning bool
    8. Use in-memory dict for profiles (no persistence for MVP)
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/behavioral_monitor.py`
  - **Done when**: Service can record events and detect anomalies
  - **Verify**: `python3 -c "from systems.evolution_daemon.safety.behavioral_monitor import BehavioralMonitor; m = BehavioralMonitor(); m.record_event('test', 'file_read', {}); print('OK')"`
  - **Commit**: `feat(safety): create BehavioralMonitor service`
  - _Requirements: FR-3_
  - _Design: BehavioralMonitor Architecture_

- [x] 1.3 Add classify_with_behavior to TierRouter
  - **Do**:
    1. Open `systems/evolution_daemon/safety/tier_router.py`
    2. Add `behavioral_monitor` optional parameter to `__init__`
    3. Add `classify_with_behavior(proposal, verdict, agent_id)` method
    4. Method calculates code_tier using existing `classify()` logic
    5. If behavioral_monitor provided, get behavior_tier from `_get_behavior_tier(agent_id)`
    6. Add `_get_behavior_tier(agent_id)` helper: returns 3 if anomalous, 2 if score > 0.5, else 1
    7. Return `max(code_tier, behavior_tier)` (more restrictive wins)
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/tier_router.py`
  - **Done when**: TierRouter integrates behavioral monitoring
  - **Verify**: `python3 -c "from systems.evolution_daemon.safety import TierRouter, BehavioralMonitor; t = TierRouter(behavioral_monitor=BehavioralMonitor()); print('OK')"`
  - **Commit**: `feat(safety): add behavioral integration to TierRouter`
  - _Requirements: FR-4_
  - _Design: TierRouter Behavioral Integration_

- [ ] 1.4 Create WordPressSentinel telemetry scanner
  - **Do**:
    1. Create `systems/evolution_daemon/safety/wordpress_sentinel.py`
    2. Implement `WordPressSentinel` class with `telemetry_path` constructor param (default: `wordpress_zone/telemetry`)
    3. Implement `scan_telemetry()` that walks telemetry directory, reads .json and .jsonl files
    4. Implement `extract_events(filepath)` parsing JSON/JSONL into BehavioralEvent objects
    5. Implement `get_file_position(filepath)` and `set_file_position(filepath, pos)` for incremental scanning
    6. Store file positions in `_file_positions` dict (memory-only for MVP)
    7. Handle FileNotFoundError gracefully, log warnings
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/wordpress_sentinel.py`
  - **Done when**: Sentinel can scan telemetry and extract events
  - **Verify**: `python3 -c "from systems.evolution_daemon.safety.wordpress_sentinel import WordPressSentinel; s = WordPressSentinel(); events = s.scan_telemetry(); print(f'Found {len(events)} events')"`
  - **Commit**: `feat(safety): create WordPressSentinel telemetry scanner`
  - _Requirements: FR-5_
  - _Design: WordPressSentinel Architecture_

- [ ] 1.5 Export new components in __init__.py
  - **Do**:
    1. Open `systems/evolution_daemon/safety/__init__.py`
    2. Add imports for `AgentBehavioralProfile`, `BehavioralEvent` from data_structures
    3. Add imports for `BehavioralMonitor` from behavioral_monitor
    4. Add imports for `WordPressSentinel` from wordpress_sentinel
    5. Add all to `__all__` list
    6. Update `__version__` to "13.1.0"
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/__init__.py`
  - **Done when**: All new components importable from safety package
  - **Verify**: `python3 -c "from systems.evolution_daemon.safety import AgentBehavioralProfile, BehavioralEvent, BehavioralMonitor, WordPressSentinel; print('OK')"`
  - **Commit**: `feat(safety): export behavioral defense components`
  - _Requirements: FR-6_

- [ ] 1.6 [VERIFY] Quality checkpoint: import check
  - **Do**: Verify all imports work and no syntax errors
  - **Verify**: `python3 -c "from systems.evolution_daemon.safety import AgentBehavioralProfile, BehavioralEvent, BehavioralMonitor, WordPressSentinel, TierRouter; t = TierRouter(); print('OK')" && python3 -m py_compile systems/evolution_daemon/safety/behavioral_monitor.py systems/evolution_daemon/safety/wordpress_sentinel.py`
  - **Done when**: No import errors, no syntax errors
  - **Commit**: `chore(safety): pass quality checkpoint` (only if fixes needed)

- [ ] 1.7 POC Checkpoint
  - **Do**: Verify end-to-end behavioral monitoring flow works
  - **Done when**: Complete flow: record event -> detect anomaly -> tier demotion
  - **Verify**: `python3 -c "
from systems.evolution_daemon.safety import BehavioralMonitor, TierRouter, EvolutionProposal, GuardianVerdict
m = BehavioralMonitor()
t = TierRouter(behavioral_monitor=m)
# Record suspicious activity
for i in range(20):
    m.record_event('suspicious-agent', 'file_read', {'path': f'/etc/passwd-{i}'})
# Check anomaly detected
p = m.get_profile('suspicious-agent')
print(f'Entropy: {p.entropy_score:.2f}, Anomalous: {m.is_anomalous(\"suspicious-agent\")}')
# Create test proposal
prop = EvolutionProposal(proposal_id='test', goal='test', target_files=['test.py'], diff_content='+ test')
verd = GuardianVerdict(approved=True, proposal_id='test', risk_level='low')
# Compare tiers
code_tier = t.classify(prop, verd)
behavior_tier = t.classify_with_behavior(prop, verd, 'suspicious-agent')
print(f'Code tier: {code_tier}, With behavior: {behavior_tier}')
assert behavior_tier >= code_tier, 'Behavior should not lower tier'
print('POC PASSED')
"`
  - **Commit**: `feat(safety): complete behavioral defense POC`

---

## Phase 2: Refactoring

After POC validated, clean up code.

- [ ] 2.1 Add type hints and docstrings
  - **Do**:
    1. Add complete type hints to all new methods
    2. Add docstrings with Args/Returns sections
    3. Add module-level docstrings explaining purpose
  - **Files**:
    - `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/behavioral_monitor.py`
    - `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/wordpress_sentinel.py`
    - `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/data_structures.py`
    - `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/tier_router.py`
  - **Done when**: All public methods have type hints and docstrings
  - **Verify**: `python3 -m py_compile systems/evolution_daemon/safety/behavioral_monitor.py systems/evolution_daemon/safety/wordpress_sentinel.py`
  - **Commit**: `refactor(safety): add type hints and docstrings`
  - _Design: Code Quality Standards_

- [ ] 2.2 Make thresholds configurable
  - **Do**:
    1. Change ANOMALY_THRESHOLD, SLIDING_WINDOW_SECONDS to constructor params with class constant defaults
    2. Add validation in constructor for threshold ranges
    3. Update BehavioralMonitor to use instance thresholds
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/behavioral_monitor.py`
  - **Done when**: Thresholds configurable via constructor
  - **Verify**: `python3 -c "from systems.evolution_daemon.safety import BehavioralMonitor; m = BehavioralMonitor(anomaly_threshold=0.5, sliding_window_seconds=60); print('OK')"`
  - **Commit**: `refactor(safety): make thresholds configurable`

- [ ] 2.3 Add error handling for edge cases
  - **Do**:
    1. Handle empty telemetry directory gracefully
    2. Handle malformed JSON in telemetry files
    3. Handle missing agent_id in get_profile (return default profile)
    4. Add logging for all error conditions
  - **Files**:
    - `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/behavioral_monitor.py`
    - `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/safety/wordpress_sentinel.py`
  - **Done when**: No unhandled exceptions in edge cases
  - **Verify**: `python3 -c "from systems.evolution_daemon.safety import BehavioralMonitor, WordPressSentinel; m = BehavioralMonitor(); p = m.get_profile('nonexistent'); print('OK')"`
  - **Commit**: `refactor(safety): add error handling for edge cases`

- [ ] 2.4 [VERIFY] Quality checkpoint: syntax + existing tests
  - **Do**: Verify no regressions in existing tests
  - **Verify**: `python3 -m pytest systems/evolution_daemon/tests/test_tier_router.py systems/evolution_daemon/tests/test_metabolism_monitor.py -v --tb=short 2>&1 | tail -20`
  - **Done when**: All existing tests pass
  - **Commit**: `chore(safety): pass quality checkpoint` (only if fixes needed)

---

## Phase 3: Testing

- [ ] 3.1 Unit tests for AgentBehavioralProfile and BehavioralEvent
  - **Do**:
    1. Create `systems/evolution_daemon/tests/test_behavioral_data_structures.py`
    2. Test AgentBehavioralProfile creation and field defaults
    3. Test BehavioralEvent creation and auto-generated fields
    4. Test calculate_entropy() with known strings (empty, uniform, random)
    5. Test is_anomalous() with various entropy scores
    6. Test to_dict/from_dict if implemented (P1, optional)
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/tests/test_behavioral_data_structures.py`
  - **Done when**: 6+ tests passing for data structures
  - **Verify**: `python3 -m pytest systems/evolution_daemon/tests/test_behavioral_data_structures.py -v`
  - **Commit**: `test(safety): add unit tests for behavioral data structures`
  - _Requirements: AC-1.1, AC-1.2_

- [ ] 3.2 Unit tests for BehavioralMonitor
  - **Do**:
    1. Create `systems/evolution_daemon/tests/test_behavioral_monitor.py`
    2. Test initialization with default and custom thresholds
    3. Test record_event creates profile and updates counters
    4. Test get_profile returns None/default for unknown agent
    5. Test calculate_anomaly_score formula
    6. Test is_anomalous with normal and suspicious behavior
    7. Test sliding window behavior (events outside window ignored)
    8. Test reset_window clears old events
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/tests/test_behavioral_monitor.py`
  - **Done when**: 8+ tests passing for BehavioralMonitor
  - **Verify**: `python3 -m pytest systems/evolution_daemon/tests/test_behavioral_monitor.py -v`
  - **Commit**: `test(safety): add unit tests for BehavioralMonitor`
  - _Requirements: AC-2.1, AC-2.2_

- [ ] 3.3 Unit tests for TierRouter behavioral integration
  - **Do**:
    1. Create test fixtures for BehavioralMonitor in test_tier_router.py or new file
    2. Test classify_with_behavior without monitor returns same as classify
    3. Test classify_with_behavior with normal agent (no tier change)
    4. Test classify_with_behavior with suspicious agent (tier elevation)
    5. Test _get_behavior_tier for all score ranges
    6. Test max(code_tier, behavior_tier) logic
    7. Test integration with existing classify method
    8. Test behavior tier 3 overrides even tier 1 code classification
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/tests/test_tier_router.py` (extend existing)
  - **Done when**: 8+ new tests passing for behavioral integration
  - **Verify**: `python3 -m pytest systems/evolution_daemon/tests/test_tier_router.py -v -k behavior`
  - **Commit**: `test(safety): add tests for TierRouter behavioral integration`
  - _Requirements: AC-3.1, AC-3.2_

- [ ] 3.4 Unit tests for WordPressSentinel
  - **Do**:
    1. Create `systems/evolution_daemon/tests/test_wordpress_sentinel.py`
    2. Test initialization with default and custom paths
    3. Test scan_telemetry on empty directory
    4. Test extract_events from JSON file
    5. Test extract_events from JSONL file
    6. Test file position tracking for incremental scans
    7. Test handling of malformed JSON
    8. Test handling of missing files
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/tests/test_wordpress_sentinel.py`
  - **Done when**: 8+ tests passing for WordPressSentinel
  - **Verify**: `python3 -m pytest systems/evolution_daemon/tests/test_wordpress_sentinel.py -v`
  - **Commit**: `test(safety): add unit tests for WordPressSentinel`
  - _Requirements: AC-4.1_

- [ ] 3.5 Integration test: full behavioral defense flow
  - **Do**:
    1. Create `systems/evolution_daemon/tests/test_behavioral_integration.py`
    2. Test: Sentinel scans telemetry -> creates events -> monitor detects anomaly -> tier demotion
    3. Use real telemetry files from `wordpress_zone/telemetry/`
    4. Verify end-to-end flow with actual data
    5. Test PrognosticsEngine optional dependency (graceful fallback)
  - **Files**: `/home/jericho/zion/projects/geometry_os/geometry_os/systems/evolution_daemon/tests/test_behavioral_integration.py`
  - **Done when**: Integration test passes with real telemetry
  - **Verify**: `python3 -m pytest systems/evolution_daemon/tests/test_behavioral_integration.py -v`
  - **Commit**: `test(safety): add behavioral defense integration test`
  - _Requirements: All ACs_

- [ ] 3.6 [VERIFY] Quality checkpoint: all new tests pass
  - **Do**: Run all new behavioral tests
  - **Verify**: `python3 -m pytest systems/evolution_daemon/tests/test_behavioral_data_structures.py systems/evolution_daemon/tests/test_behavioral_monitor.py systems/evolution_daemon/tests/test_wordpress_sentinel.py systems/evolution_daemon/tests/test_behavioral_integration.py -v --tb=short 2>&1 | tail -30`
  - **Done when**: 26+ new tests passing
  - **Commit**: `chore(safety): pass quality checkpoint`

---

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check - full test suite
  - **Do**: Run ALL tests to verify no regressions
  - **Verify**: `python3 -m pytest systems/evolution_daemon/tests/ -v --tb=short 2>&1 | tail -40`
  - **Done when**: All tests pass, no regressions
  - **Commit**: `fix(safety): address test failures` (if needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**:
    1. Verify current branch is feature branch: `git branch --show-current`
    2. Push branch: `git push -u origin feat/behavioral-defense` (or current branch name)
    3. Create PR: `gh pr create --title "feat(safety): Behavioral Defense Phase 3 - Agent Anomaly Detection" --body "$(cat <<'EOF'
## Summary
- Add AgentBehavioralProfile and BehavioralEvent dataclasses for tracking agent behavior
- Create BehavioralMonitor service for real-time anomaly detection
- Integrate behavioral monitoring into TierRouter for automatic tier demotion
- Add WordPressSentinel for telemetry scanning

## Test Plan
- [ ] Unit tests for data structures (6 tests)
- [ ] Unit tests for BehavioralMonitor (8 tests)
- [ ] Unit tests for TierRouter integration (8 tests)
- [ ] Unit tests for WordPressSentinel (8 tests)
- [ ] Integration test for full flow

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"`
    4. Verify CI passes: `gh pr checks --watch`
  - **Verify**: `gh pr checks` shows all green
  - **Done when**: PR created, CI checks passing
  - **Commit**: None (PR commit)

---

## Phase 5: PR Lifecycle

- [ ] 5.1 Address review feedback
  - **Do**: Monitor PR for review comments, address any feedback
  - **Verify**: All review comments resolved
  - **Done when**: PR approved by reviewer
  - **Commit**: `fix(safety): address review feedback` (as needed)

- [ ] 5.2 Final validation: 26+ tests passing, no regressions
  - **Do**: Run final test count verification
  - **Verify**: `python3 -m pytest systems/evolution_daemon/tests/ --collect-only 2>&1 | grep -E "test session|collected|ERROR" && python3 -m pytest systems/evolution_daemon/tests/ -v --tb=line 2>&1 | tail -20`
  - **Done when**: 26+ behavioral tests passing, all existing tests still pass
  - **Commit**: None

- [ ] 5.3 Merge readiness check
  - **Do**: Verify PR is merge-ready
  - **Verify**: `gh pr view --json mergeable,reviewDecision,statusCheckRollup`
  - **Done when**: PR mergeable, approved, CI green
  - **Commit**: None

---

## Notes

### POC Shortcuts
- In-memory storage only (no SQLite persistence)
- Manual sliding window reset
- Hardcoded telemetry path (no config file)
- Counter-based entropy (not numpy for simplicity)

### Production TODOs
- Add SQLite persistence for profiles (P1)
- Auto-reset sliding window by time
- Config file for telemetry paths
- Integrate with PrognosticsEngine for predictive anomalies
- Add metrics export for dashboards
