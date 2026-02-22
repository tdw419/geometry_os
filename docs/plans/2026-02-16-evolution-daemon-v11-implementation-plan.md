# Evolution Daemon V11 - Implementation Plan

**Created:** 2026-02-16
**Design Doc:** `docs/plans/2026-02-16-evolution-daemon-v11-safety-design.md`
**Status:** Ready for Implementation

---

## Overview

This plan implements the Full Safety Pipeline for Evolution Daemon V11, upgrading from V10 to add:
- Two-stage pre-commit validation (Sandbox + Guardian)
- Three-tier post-commit monitoring
- Git-based atomic commits and rollback
- Automated recovery from regressions

---

## Prerequisites

- [ ] V10 daemon running successfully (`systems/evolution_daemon/evolution_daemon.py`)
- [ ] Z.ai bridge operational (`zai_agent_integration.py`)
- [ ] WebMCP client available for visual monitoring
- [ ] Git repository initialized

---

## Task Breakdown

### Phase 1: Data Structures & Core Types (30 min)

**Task 1.1: Create Data Structures Module**
- **File:** `systems/evolution_daemon/safety/data_structures.py`
- **Lines:** ~80
- **Create:**
  - `EvolutionProposal` dataclass
  - `SandboxResult` dataclass
  - `GuardianVerdict` dataclass
  - `MonitoringResult` dataclass
  - `RecoveryAction` enum
  - `EvolutionResult` enum
- **Verification:** Import all classes, instantiate each with sample data

---

### Phase 2: Sandbox Validation (1 hour)

**Task 2.1: Create SandboxManager**
- **File:** `systems/evolution_daemon/safety/sandbox_manager.py`
- **Lines:** ~120
- **Create:**
  ```python
  class SandboxManager:
      SANDBOX_DIR = "/tmp/evolution_sandbox"

      async def create_sandbox(self, proposal: EvolutionProposal) -> str
      async def apply_diff(self, sandbox_path: str, diff: str) -> bool
      async def validate_syntax(self, sandbox_path: str) -> Tuple[bool, List[str]]
      async def validate_imports(self, sandbox_path: str) -> Tuple[bool, List[str]]
      async def run_heartbeat_tests(self, sandbox_path: str) -> Tuple[int, int]
      async def cleanup(self, sandbox_path: str)
      async def validate(self, proposal: EvolutionProposal) -> SandboxResult
  ```
- **Verification:** Unit test creates sandbox, validates a good file, rejects broken file

**Task 2.2: Create Heartbeat Tests**
- **Directory:** `systems/evolution_daemon/heartbeat_tests/`
- **Files:**
  - `test_imports.py` - Can main modules be imported?
  - `test_zai_bridge.py` - Can Z.ai bridge connect?
  - `test_websocket.py` - Can WebSocket server start?
  - `test_vfs.py` - Do VFS operations work?
- **Verification:** `pytest systems/evolution_daemon/heartbeat_tests/ -v`

---

### Phase 3: Guardian Gate (45 min)

**Task 3.1: Create GuardianGate**
- **File:** `systems/evolution_daemon/safety/guardian_gate.py`
- **Lines:** ~80
- **Create:**
  ```python
  class GuardianGate:
      def __init__(self, zai_bridge: ZAIIntegration)
      async def review(self, proposal: EvolutionProposal,
                       sandbox_result: SandboxResult) -> GuardianVerdict
      async def request_architect_review(self, proposal: EvolutionProposal) -> bool
      ```
- **Review Criteria:**
  - Security vulnerabilities (injection, XSS, etc.)
  - Logic errors or unhandled edge cases
  - Breaking changes to interfaces
  - Alignment with Geometry OS principles
- **Verification:** Unit test with mock ZAI bridge, verify verdict structure

---

### Phase 4: Tier Routing (30 min)

**Task 4.1: Create TierRouter**
- **File:** `systems/evolution_daemon/safety/tier_router.py`
- **Lines:** ~60
- **Create:**
  ```python
  class TierRouter:
      CRITICAL_FILES = {
          "evolution_daemon.py": 30,
          "zai_bridge.py": 20,
          "area_agent.py": 15,
          "vfs_*.py": 10
      }

      def calculate_score(self, proposal: EvolutionProposal,
                          verdict: GuardianVerdict) -> int
      def classify(self, proposal: EvolutionProposal,
                   verdict: GuardianVerdict) -> int  # 1, 2, or 3
  ```
- **Scoring Rules:**
  - Lines changed: +1 per 10 lines
  - Files affected: +5 per file
  - Critical file touched: +10 to +30 per file
  - Guardian risk: low=+0, medium=+5, high=+10
- **Tier Thresholds:**
  - Tier 1: ≤10 points (minor, auto-commit)
  - Tier 2: ≤25 points (medium, + visual monitoring)
  - Tier 3: >25 points (major, requires PR)
- **Verification:** Unit tests for each tier classification

---

### Phase 5: Git Integration (1 hour)

**Task 5.1: Create GitIntegration**
- **File:** `systems/evolution_daemon/safety/git_integration.py`
- **Lines:** ~150
- **Create:**
  ```python
  class GitIntegration:
      EVOLUTION_TAG = "[EVOLUTION]"

      async def commit_evolution(self, proposal, verdict, tier) -> str
      async def create_pr_branch(self, proposal, commit_sha) -> str
      async def rollback(self, commit_sha) -> bool
      async def get_evolution_history(self, limit) -> List[Dict]
      async def get_current_sha(self) -> str
  ```
- **Commit Message Format:**
  ```
  [EVOLUTION] {description}

  Tier: {tier}
  Guardian: {approved/rejected}
  Risk: {risk_level}
  Files: {file_list}

  Changes:
  - {change_1}

  Co-Authored-By: Evolution Daemon <daemon@geometry-os>
  ```
- **Verification:**
  - Unit test creates commit, reads it back
  - Unit test creates branch
  - Unit test performs rollback

---

### Phase 6: Post-Commit Monitoring (1.5 hours)

**Task 6.1: Create PostCommitMonitor**
- **File:** `systems/evolution_daemon/safety/post_commit_monitor.py`
- **Lines:** ~180
- **Create:**
  ```python
  class PostCommitMonitor:
      async def capture_baseline(self) -> Dict
      async def run_regression_tests(self) -> Tuple[bool, List[str]]
      async def capture_visual_heartbeat(self) -> Dict
      async def compare_visual_state(self, current, baseline) -> Tuple[bool, List[str]]
      async def check_performance_metrics(self) -> Dict
      async def monitor_tier_1(self, commit_sha) -> MonitoringResult
      async def monitor_tier_2(self, commit_sha) -> MonitoringResult
  ```
- **Visual Heartbeat Detection:**
  - Missing UI elements
  - Unexpected color changes
  - Agent position anomalies
  - Error messages visible on map
- **Verification:**
  - Unit test with mock WebMCP client
  - Verify tier 1 and tier 2 monitoring logic

**Task 6.2: Create EvolutionRecovery**
- **File:** `systems/evolution_daemon/safety/post_commit_monitor.py` (same file)
- **Lines:** ~70
- **Create:**
  ```python
  class EvolutionRecovery:
      async def handle_regression(self, commit_sha, result) -> RecoveryAction
      async def alert_guardian(self, result)
      async def pause_evolution_loop(self, reason)
  ```
- **Recovery Actions:**
  - `AUTO_REVERT`: Immediately rollback
  - `ALERT_PAUSE`: Alert Guardian, pause evolutions
  - `ESCALATE`: Human notification required
- **Verification:** Unit test recovery decision logic

---

### Phase 7: V11 Daemon Integration (1 hour)

**Task 7.1: Upgrade EvolutionDaemon to V11**
- **File:** `systems/evolution_daemon/evolution_daemon.py`
- **Changes:**
  1. Update version comment to V11
  2. Import safety components
  3. Add safety component initialization in `__init__`
  4. Add `safe_evolve()` method replacing `evolve()`
  5. Keep `evolve()` for backwards compatibility as `legacy_evolve()`

**New Method:**
```python
async def safe_evolve(self, task: EvolutionTask) -> EvolutionResult:
    """New safe evolution flow with full safety pipeline"""

    # 1. Originate - create proposal from task
    proposal = await self._create_proposal(task)

    # 2. Sandbox validation
    sandbox_result = await self.sandbox.validate(proposal)
    if not sandbox_result.passed:
        return EvolutionResult.REJECTED_SANDBOX

    # 3. Guardian review
    verdict = await self.guardian_gate.review(proposal, sandbox_result)
    if not verdict.approved:
        return EvolutionResult.REJECTED_GUARDIAN

    # 4. Tier classification
    tier = self.tier_router.classify(proposal, verdict)

    # 5. Commit (or create PR for Tier 3)
    if tier == 3:
        await self.git.create_pr_branch(proposal, ...)
        return EvolutionResult.AWAITING_HUMAN_REVIEW

    commit_sha = await self.git.commit_evolution(proposal, verdict, tier)

    # 6. Post-commit monitoring
    result = await self.monitor.monitor(commit_sha, tier)

    # 7. Recovery if needed
    if not result.healthy:
        await self.recovery.handle_regression(commit_sha, result)
        return EvolutionResult.REVERTED

    return EvolutionResult.SUCCESS
```
- **Verification:** Integration test runs full safe_evolve flow

---

### Phase 8: Testing Suite (1.5 hours)

**Task 8.1: Create Unit Tests**
- **Files:**
  - `systems/evolution_daemon/tests/test_sandbox_manager.py`
  - `systems/evolution_daemon/tests/test_guardian_gate.py`
  - `systems/evolution_daemon/tests/test_tier_router.py`
  - `systems/evolution_daemon/tests/test_git_integration.py`
  - `systems/evolution_daemon/tests/test_post_commit_monitor.py`

**Task 8.2: Create Integration Test**
- **File:** `systems/evolution_daemon/tests/test_v11_integration.py`
- **Test Scenarios:**
  1. Successful minor evolution (Tier 1)
  2. Successful medium evolution (Tier 2) with visual monitoring
  3. Tier 3 evolution creates PR instead of commit
  4. Sandbox rejection blocks commit
  5. Guardian rejection blocks commit
  6. Post-commit failure triggers rollback

**Verification:**
```bash
pytest systems/evolution_daemon/tests/ -v
```

---

### Phase 9: Safety Package Init (15 min)

**Task 9.1: Create Package Init Files**
- **File:** `systems/evolution_daemon/safety/__init__.py`
- **Exports:**
  ```python
  from .data_structures import (
      EvolutionProposal, SandboxResult, GuardianVerdict,
      MonitoringResult, RecoveryAction, EvolutionResult
  )
  from .sandbox_manager import SandboxManager
  from .guardian_gate import GuardianGate
  from .tier_router import TierRouter
  from .git_integration import GitIntegration
  from .post_commit_monitor import PostCommitMonitor, EvolutionRecovery
  ```

---

## Execution Order

```
Phase 1 (Data Structures)
    │
    ├──→ Phase 2 (SandboxManager) ──→ Phase 8.1 (Sandbox Tests)
    │
    ├──→ Phase 3 (GuardianGate) ────→ Phase 8.1 (Guardian Tests)
    │
    ├──→ Phase 4 (TierRouter) ──────→ Phase 8.1 (Tier Tests)
    │
    └──→ Phase 5 (GitIntegration) ──→ Phase 8.1 (Git Tests)
              │
              └──→ Phase 6 (PostCommitMonitor + Recovery)
                        │
                        └──→ Phase 8.1 (Monitor Tests)
                                  │
                                  └──→ Phase 7 (Daemon Integration)
                                            │
                                            └──→ Phase 8.2 (Integration Tests)
                                                      │
                                                      └──→ Phase 9 (Package Init)
```

---

## File Structure After Completion

```
systems/evolution_daemon/
├── __init__.py
├── evolution_daemon.py              # Updated to V11
├── safety/
│   ├── __init__.py                  # Package exports
│   ├── data_structures.py           # NEW: Data classes
│   ├── sandbox_manager.py           # NEW: Sandbox validation
│   ├── guardian_gate.py             # NEW: AI review
│   ├── tier_router.py               # NEW: Tier classification
│   ├── git_integration.py           # NEW: Git operations
│   └── post_commit_monitor.py       # NEW: Monitoring + Recovery
├── tests/
│   ├── __init__.py
│   ├── test_sandbox_manager.py      # NEW
│   ├── test_guardian_gate.py        # NEW
│   ├── test_tier_router.py          # NEW
│   ├── test_git_integration.py      # NEW
│   ├── test_post_commit_monitor.py  # NEW
│   └── test_v11_integration.py      # NEW: Full pipeline test
└── heartbeat_tests/
    ├── __init__.py
    ├── test_imports.py              # NEW
    ├── test_zai_bridge.py           # NEW
    ├── test_websocket.py            # NEW
    └── test_vfs.py                  # NEW
```

---

## Success Criteria

After implementation, verify:

1. **Sandbox Gate Works:**
   ```bash
   pytest systems/evolution_daemon/tests/test_sandbox_manager.py -v
   ```

2. **Guardian Gate Works:**
   ```bash
   pytest systems/evolution_daemon/tests/test_guardian_gate.py -v
   ```

3. **Tier Routing Correct:**
   ```bash
   pytest systems/evolution_daemon/tests/test_tier_router.py -v
   ```

4. **Git Integration Works:**
   ```bash
   pytest systems/evolution_daemon/tests/test_git_integration.py -v
   ```

5. **Full Pipeline Works:**
   ```bash
   pytest systems/evolution_daemon/tests/test_v11_integration.py -v
   ```

6. **Heartbeat Tests Pass:**
   ```bash
   pytest systems/evolution_daemon/heartbeat_tests/ -v
   ```

7. **All Tests Pass:**
   ```bash
   pytest systems/evolution_daemon/ -v
   ```

---

## Estimated Time

| Phase | Duration |
|-------|----------|
| Phase 1: Data Structures | 30 min |
| Phase 2: Sandbox | 1 hour |
| Phase 3: Guardian | 45 min |
| Phase 4: Tier Router | 30 min |
| Phase 5: Git Integration | 1 hour |
| Phase 6: Monitoring | 1.5 hours |
| Phase 7: Daemon Integration | 1 hour |
| Phase 8: Testing | 1.5 hours |
| Phase 9: Package Init | 15 min |
| **Total** | **~8 hours** |

---

## Risk Mitigation

1. **Git operations in tests:** Use temporary directories
2. **WebMCP not available:** Mock client for tests
3. **Z.ai not available:** Use mock mode (already supported)
4. **Backward compatibility:** Keep `evolve()` as `legacy_evolve()`

---

## Next Steps

After this plan is approved:

1. Begin with Phase 1 (Data Structures)
2. Work through phases sequentially
3. Run tests after each phase
4. Complete integration test last
5. Update documentation

---

**Ready to implement.** Each task is self-contained with clear verification criteria.
