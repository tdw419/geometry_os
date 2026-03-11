# Evolution Daemon V11 - Full Safety Pipeline Design

**Date:** 2026-02-16
**Status:** Approved
**Author:** Architecture Session (User + AI)

---

## Overview

This document defines the design for Evolution Daemon V11, which introduces a comprehensive safety pipeline for autonomous code evolution in Geometry OS.

### Problem Statement

Evolution Daemon V10 can autonomously modify the codebase, but lacks:
- Pre-commit validation to prevent broken code
- Intelligent review before changes are applied
- Automated rollback when regressions occur
- Human oversight for high-risk changes

### Solution

A Full Safety Pipeline with two-stage validation and three-tier post-commit monitoring:
1. **Sandbox validation** - Technical correctness check
2. **Guardian review** - Security and logic review
3. **Tiered monitoring** - Scope-appropriate post-commit oversight

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────────┐
│                     EVOLUTION DAEMON V11 - SAFE EVOLUTION               │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌─────────────┐     ┌─────────────────┐     ┌─────────────────────┐   │
│  │   Z.ai      │     │  SAFETY CORE    │     │      WEBMCP         │   │
│  │  GLM-4-Plus │     │                 │     │   Visual Interface  │   │
│  │  (Brain)    │     │  ┌───────────┐  │     │                     │   │
│  └──────┬──────┘     │  │ Sandbox   │  │     │  ┌───────────────┐  │   │
│         │            │  │ Manager   │  │     │  │ Visual        │  │   │
│         │            │  └─────┬─────┘  │     │  │ Heartbeat     │  │   │
│         │            │        │        │     │  └───────────────┘  │   │
│         │            │  ┌─────▼─────┐  │     │                     │   │
│         │            │  │ Guardian  │  │     │                     │   │
│         │            │  │ Gate      │  │     │                     │   │
│         │            │  └─────┬─────┘  │     │                     │   │
│         │            │        │        │     │                     │   │
│         │            │  ┌─────▼─────┐  │     │                     │   │
│         │            │  │ Tier      │  │     │                     │   │
│         │            │  │ Router    │  │     │                     │   │
│         │            │  └─────┬─────┘  │     │                     │   │
│         │            └────────┼────────┘     │                     │   │
│         │                     │              │                     │   │
│         ▼                     ▼              ▼                     │   │
│  ┌──────────────────────────────────────────────────────────────────┐  │
│  │                      GIT INTEGRATION                             │  │
│  │  commit → test → monitor → [auto-revert | flag | PR-required]   │  │
│  └──────────────────────────────────────────────────────────────────┘  │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### Core Components

| Component | Responsibility |
|-----------|---------------|
| **SandboxManager** | Isolated execution environment for proposed changes |
| **GuardianGate** | Multi-agent review before commit |
| **TierRouter** | Classifies evolution scope and routes to appropriate tier |
| **GitIntegration** | Atomic commits, branches, and rollback operations |
| **PostCommitMonitor** | Post-commit visual integrity monitoring |
| **EvolutionRecovery** | Automated rollback and alerting |

---

## Evolution Lifecycle

```
    ┌──────────┐
    │  START   │
    └────┬─────┘
         │
         ▼
    ┌──────────────────┐
    │ 1. ORIGINATE     │  Coder proposes evolution via Z.ai
    │    (Z.ai Coder)  │  Returns: proposed_code, target_file, description
    └────────┬─────────┘
             │
             ▼
    ┌──────────────────┐
    │ 2. SANDBOX       │  Copy affected files to /tmp/evolution_sandbox/
    │    DRY-RUN       │  Apply proposed changes in sandbox
    │                  │  Run: syntax check, import test, heartbeat tests
    └────────┬─────────┘
             │
        ┌────┴────┐
        │ PASSED? │
        └────┬────┘
             │
      ┌──────┴──────┐
      │             │
      ▼ NO          ▼ YES
┌───────────┐  ┌──────────────────┐
│ REJECT    │  │ 3. GUARDIAN      │  Submit diff + test results to Guardian
│ & LOG     │  │    REVIEW        │  Guardian analyzes: security, logic, risk
└───────────┘  └────────┬─────────┘
                        │
                   ┌────┴────┐
                   │APPROVED?│
                   └────┬────┘
                        │
                 ┌──────┴──────┐
                 │             │
                 ▼ NO          ▼ YES
         ┌───────────┐  ┌──────────────────┐
         │ REJECT    │  │ 4. TIER CLASSIFY │  Calculate scope score
         │ & LOG     │  │                  │  Route to appropriate tier
         └───────────┘  └────────┬─────────┘
                                 │
                    ┌────────────┼────────────┐
                    │            │            │
                    ▼            ▼            ▼
              ┌─────────┐ ┌─────────┐  ┌─────────────┐
              │ TIER 1  │ │ TIER 2  │  │   TIER 3    │
              │ Minor   │ │ Medium  │  │   Major     │
              └────┬────┘ └────┬────┘  └──────┬──────┘
                   │           │              │
                   ▼           ▼              ▼
              ┌─────────────────────┐  ┌─────────────┐
              │ COMMIT TO MAIN      │  │ CREATE PR   │
              │ + AUTO-MONITOR      │  │ AWAIT HUMAN │
              └──────────┬──────────┘  └─────────────┘
                         │
                         ▼
              ┌─────────────────────┐
              │ 5. POST-COMMIT      │
              │    MONITORING       │
              └──────────┬──────────┘
                         │
                    ┌────┴────┐
                    │ HEALTHY?│
                    └────┬────┘
                         │
                  ┌──────┴──────┐
                  │             │
                  ▼ NO          ▼ YES
          ┌────────────┐  ┌──────────┐
          │ AUTO-REVERT│  │  SUCCESS │
          │ + ALERT    │  │  LOG     │
          └────────────┘  └──────────┘
```

---

## Component Specifications

### SandboxManager

```python
class SandboxManager:
    """
    Isolated execution environment for testing proposed evolutions.
    """

    SANDBOX_DIR = "/tmp/evolution_sandbox"

    async def create_sandbox(self, proposal: EvolutionProposal) -> str
    async def apply_diff(self, sandbox_path: str, diff: str) -> bool
    async def validate_syntax(self, sandbox_path: str) -> Tuple[bool, List[str]]
    async def validate_imports(self, sandbox_path: str) -> Tuple[bool, List[str]]
    async def run_heartbeat_tests(self, sandbox_path: str) -> Tuple[int, int]
    async def cleanup(self, sandbox_path: str)
```

**Heartbeat Tests** - Minimal critical tests:
- Can main modules be imported?
- Can Z.ai bridge connect?
- Can WebSocket server start?
- Do core VFS operations work?

### GuardianGate

```python
class GuardianGate:
    """
    Multi-agent review system for evolution approval.
    """

    async def review(self, proposal: EvolutionProposal,
                     sandbox_result: SandboxResult) -> GuardianVerdict
    async def request_architect_review(self, proposal: EvolutionProposal) -> bool
```

**Guardian Review Criteria:**
1. Security vulnerabilities (injection, XSS, etc.)
2. Logic errors or unhandled edge cases
3. Breaking changes to interfaces
4. Alignment with Geometry OS principles

### TierRouter

**Tier Decision Matrix:**

| Factor | Points |
|--------|--------|
| Lines changed | +1 per 10 lines |
| Files affected | +5 per file |
| Critical file touched | +10 to +30 per file |
| Guardian risk: low | +0 |
| Guardian risk: medium | +5 |
| Guardian risk: high | +10 |

**Tier Thresholds:**
- Tier 1 (≤10 points): Minor - auto-commit + auto-monitor
- Tier 2 (≤25 points): Medium - + visual heartbeat monitoring
- Tier 3 (>25 points): Major - requires PR + human approval

**Critical Files:**
- `evolution_daemon.py`: +30 points
- `zai_bridge.py`: +20 points
- `area_agent.py`: +15 points
- `vfs_*.py`: +10 points

### GitIntegration

```python
class GitIntegration:
    EVOLUTION_TAG = "[EVOLUTION]"

    async def commit_evolution(proposal, verdict, tier) -> str
    async def create_pr_branch(proposal, commit_sha) -> str
    async def rollback(commit_sha) -> bool
    async def get_evolution_history(limit) -> List[Dict]
```

**Commit Message Format:**
```
[EVOLUTION] {description}

Tier: {tier}
Guardian: {approved/rejected}
Risk: {risk_level}
Files: {file_list}

Changes:
- {change_1}
- {change_2}

Co-Authored-By: Evolution Daemon <daemon@geometry-os>
```

### PostCommitMonitor

```python
class PostCommitMonitor:
    async def capture_baseline()
    async def run_regression_tests() -> Tuple[bool, List[str]]
    async def capture_visual_heartbeat() -> Dict
    async def compare_visual_state(current, baseline) -> Tuple[bool, List[str]]
    async def check_performance_metrics() -> Dict
    async def monitor_tier_1(commit_sha) -> MonitoringResult
    async def monitor_tier_2(commit_sha) -> MonitoringResult
```

**Visual Heartbeat Detection:**
- Missing UI elements
- Unexpected color changes
- Agent position anomalies
- Error messages visible on map

### EvolutionRecovery

```python
class EvolutionRecovery:
    async def handle_regression(commit_sha, result) -> RecoveryAction
    async def alert_guardian(result)
    async def pause_evolution_loop(reason)
```

**Recovery Actions:**
- `AUTO_REVERT`: Immediately rollback
- `ALERT_PAUSE`: Alert Guardian, pause evolutions
- `ESCALATE`: Human notification required

---

## Data Structures

```python
@dataclass
class EvolutionProposal:
    id: str
    description: str
    proposer: str  # "coder"
    target_files: List[str]
    diff: str
    created_at: datetime
    scope_score: Optional[float] = None
    tier: Optional[int] = None

@dataclass
class SandboxResult:
    passed: bool
    syntax_valid: bool
    imports_ok: bool
    heartbeat_tests_passed: int
    heartbeat_tests_failed: int
    errors: List[str]

@dataclass
class GuardianVerdict:
    approved: bool
    reasoning: str
    risk_level: str  # "low", "medium", "high"
    concerns: List[str]
    reviewed_at: datetime

@dataclass
class MonitoringResult:
    commit_sha: str
    tier: int
    healthy: bool
    test_passed: bool
    test_failures: List[str]
    visual_healthy: Optional[bool]
    visual_anomalies: List[str]
    performance_metrics: Dict
    action_taken: str  # "none", "alerted", "reverted"
    timestamp: datetime
```

---

## File Structure

```
systems/evolution_daemon/
├── __init__.py
├── evolution_daemon.py          # Main daemon (V11)
├── safety/
│   ├── __init__.py
│   ├── sandbox_manager.py       # SandboxManager
│   ├── guardian_gate.py         # GuardianGate
│   ├── tier_router.py           # TierRouter
│   ├── git_integration.py       # GitIntegration
│   └── post_commit_monitor.py   # PostCommitMonitor + EvolutionRecovery
├── tests/
│   ├── test_sandbox_manager.py
│   ├── test_guardian_gate.py
│   ├── test_tier_router.py
│   ├── test_git_integration.py
│   └── test_post_commit_monitor.py
└── heartbeat_tests/
    ├── test_imports.py
    ├── test_zai_bridge.py
    ├── test_websocket.py
    └── test_vfs.py
```

---

## Implementation Summary

| Component | Lines (est.) | Complexity | Dependencies |
|-----------|-------------|------------|--------------|
| SandboxManager | ~120 | Medium | tempfile, subprocess |
| GuardianGate | ~80 | Low | ZAIBridge |
| TierRouter | ~60 | Low | None |
| GitIntegration | ~150 | Medium | git (subprocess) |
| PostCommitMonitor | ~180 | High | GitIntegration, WebMCPClient |
| EvolutionRecovery | ~70 | Low | GitIntegration, GuardianGate |
| Heartbeat Tests | ~100 | Low | pytest |

**Total: ~760 lines of new code**

---

## Safety Guarantees

1. **Broken code never reaches the codebase** (sandbox gate)
2. **Unsafe logic is reviewed before commit** (guardian gate)
3. **Major changes require human approval** (tier 3)
4. **Regressions are automatically reverted** (monitoring)
5. **Every action is logged in git history** (audit trail)

---

## Success Criteria

- [ ] All evolutions create atomic git commits
- [ ] Sandbox validation catches syntax/import errors
- [ ] Guardian review catches security/logic issues
- [ ] Tier routing correctly classifies scope
- [ ] Tier 3 changes create PRs instead of direct commits
- [ ] Post-commit monitoring detects regressions
- [ ] Automatic rollback works for failed evolutions
- [ ] Full audit trail available via git log
