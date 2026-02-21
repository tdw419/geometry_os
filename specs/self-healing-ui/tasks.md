---
spec: self-healing-ui
phase: tasks
total_tasks: 5
created: 2026-02-20T16:00:00Z
generated: auto
---

# Tasks: self-healing-ui

## Phase 1: Make It Work (POC)

Focus: Validate HealerAgent works end-to-end. Skip WordPress integration, accept mocked publishing.

- [ ] 1.1 Create HealerAgent test file
  - **Do**: Create `tests/system/test_healer_agent.py` with init tests
  - **Files**: `tests/system/test_healer_agent.py`
  - **Done when**: Tests fail with "No module named 'systems.visual_shell.swarm.healer_agent'"
  - **Verify**: `python3 -m pytest tests/system/test_healer_agent.py -v`
  - **Commit**: `test(healer): add failing tests for HealerAgent initialization`
  - _Requirements: FR-1, FR-9_
  - _Design: HealerAgent component_

- [ ] 1.2 Implement HealerAgent core
  - **Do**: Create `systems/visual_shell/swarm/healer_agent.py` with HealingAction enum, HealingResult dataclass, HealerAgent class with `_handle_diagnostic_pulse()` method
  - **Files**: `systems/visual_shell/swarm/healer_agent.py`
  - **Done when**: All init tests pass, event handling tests pass
  - **Verify**: `python3 -m pytest tests/system/test_healer_agent.py -v`
  - **Commit**: `feat(healer): add HealerAgent with V16 reaction loop`
  - _Requirements: FR-2, FR-3, FR-6, FR-7, FR-8, FR-9_
  - _Design: Components section_

- [ ] 1.3 Add decision logic tests
  - **Do**: Add tests to `test_healer_agent.py` for pattern-based decision making (panic→quarantine, segfault→analyze, frozen→quarantine/reboot)
  - **Files**: `tests/system/test_healer_agent.py`
  - **Done when**: Tests verify decision logic for all patterns
  - **Verify**: `python3 -m pytest tests/system/test_healer_agent.py::TestHealerAgentEventHandling -v`
  - **Commit**: `test(healer): add decision logic tests`
  - _Requirements: FR-6, FR-7, FR-8_
  - _Design: Decision Logic section_

- [ ] 1.4 Implement decision logic
  - **Do**: Add `_handle_critical()`, `_handle_warning()`, `_execute_action()` methods to HealerAgent with pattern matching
  - **Files**: `systems/visual_shell/swarm/healer_agent.py`
  - **Done when**: All decision logic tests pass
  - **Verify**: `python3 -m pytest tests/system/test_healer_agent.py -v`
  - **Commit**: `feat(healer): implement pattern-based decision logic`
  - _Requirements: FR-6, FR-7, FR-8_
  - _Design: Decision Logic section_

- [ ] 1.X POC Checkpoint
  - **Do**: Verify HealerAgent handles CRITICAL pulses with correct actions
  - **Done when**: `python3 -c "from systems.visual_shell.swarm.healer_agent import HealerAgent; a = HealerAgent(); print('OK')"` prints OK
  - **Verify**: Manual test with mock pulse data
  - **Commit**: `feat(healer): complete POC`

## Phase 2: Refactoring

After POC validated, clean up code and add safety features.

- [ ] 2.1 Add WebSocket subscription
  - **Do**: Add `start()` and `stop()` methods with WebSocket client loop, subscription message, message processing
  - **Files**: `systems/visual_shell/swarm/healer_agent.py`, `tests/system/test_healer_agent.py`
  - **Done when**: Tests for WebSocket methods pass
  - **Verify**: `python3 -m pytest tests/system/test_healer_agent.py::TestHealerAgentWebSocket -v`
  - **Commit**: `feat(healer): add WebSocket subscription for DIAGNOSTIC_PULSE events`
  - _Requirements: FR-1, FR-12_
  - _Design: HealerAgent component_

- [ ] 2.2 Add WordPress integration
  - **Do**: Add `_publish_to_wordpress()` method with try/except, graceful failure handling
  - **Files**: `systems/visual_shell/swarm/healer_agent.py`
  - **Done when**: WordPress publish called after each action, failures logged
  - **Verify**: `python3 -m pytest tests/system/test_healer_agent.py -v -k wordpress`
  - **Commit**: `feat(healer): add WordPress audit trail integration`
  - _Requirements: FR-4, NFR-2_
  - _Design: Components section_

## Phase 3: Testing

- [ ] 3.1 Add integration tests
  - **Do**: Create `tests/system/test_healer_integration.py` with full flow tests (CRITICAL→action→WordPress mock)
  - **Files**: `tests/system/test_healer_integration.py`
  - **Done when**: All integration tests pass, covering full healing flow
  - **Verify**: `python3 -m pytest tests/system/test_healer_integration.py -v`
  - **Commit**: `test(healer): add integration tests for V16 reaction loop`
  - _Requirements: All FRs_
  - _Design: Testing Strategy section_

- [ ] 3.2 Add reaction time tests
  - **Do**: Add tests that verify reaction time is under 1 second threshold
  - **Files**: `tests/system/test_healer_agent.py`
  - **Done when**: Tests verify elapsed time < reaction_threshold
  - **Verify**: `python3 -m pytest tests/system/test_healer_agent.py -v -k reaction_time`
  - **Commit**: `test(healer): add reaction time verification`
  - _Requirements: FR-3, NFR-1_
  - _Design: Performance Considerations section_

## Phase 4: Quality Gates

- [ ] 4.1 Local quality check
  - **Do**: Run all quality checks locally (type check, lint, tests)
  - **Verify**: `python3 -m pytest tests/system/test_healer_agent.py tests/system/test_healer_integration.py -v`
  - **Done when**: All tests pass
  - **Commit**: `fix(healer): address lint/type issues` (if needed)

- [ ] 4.2 Create PR and verify CI
  - **Do**: Push branch, create PR with gh CLI
  - **Verify**: `gh pr checks --watch` all green
  - **Done when**: PR ready for review

- [ ] 4.3 Add documentation
  - **Do**: Create `docs/healer_agent.md` with usage, actions, decision logic, safety notes
  - **Files**: `docs/healer_agent.md`
  - **Done when**: Documentation covers all public APIs
  - **Verify**: Read through manually for completeness
  - **Commit**: `docs(healer): add HealerAgent V16 reaction loop documentation`
  - _Requirements: NFR-5_

## Notes

- **POC shortcuts taken**: WordPress publishing mocked, no actual substrate reboot
- **Production TODOs**: Integrate with substrate launcher for real reboot, add district state capture

## Task Summary

| Phase | Tasks | Est. Time |
|-------|-------|-----------|
| POC | 5 | 2.5h |
| Refactoring | 2 | 1h |
| Testing | 2 | 1h |
| Quality Gates | 3 | 0.5h |
| **Total** | **12 subtasks / 5 main tasks** | **5h** |

## Verification Commands

```bash
# Run all healer tests
python3 -m pytest tests/system/test_healer_agent.py tests/system/test_healer_integration.py -v

# Quick sanity check
python3 -c "from systems.visual_shell.swarm.healer_agent import HealerAgent; a = HealerAgent(); print(f'Ready: threshold={a.reaction_threshold}s')"

# Verify reaction time
python3 -c "
import asyncio
from systems.visual_shell.swarm.healer_agent import HealerAgent

async def test():
    agent = HealerAgent()
    pulse = {'type': 'DIAGNOSTIC_PULSE', 'status': 'CRITICAL', 'district_id': 'test', 'matched_pattern': 'panic', 'detected_text': 'Kernel panic'}
    result = await agent._handle_diagnostic_pulse(pulse)
    print(f'Action: {result[\"action\"]}, Time: {result[\"details\"][\"elapsed_seconds\"]:.3f}s')

asyncio.run(test())
"
```
