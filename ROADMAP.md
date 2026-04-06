# Geometry OS -- Roadmap

## Overview
GPU-native operating system written in Rust. Programs are pixels. The GPU is the CPU.

**Status:** 396 tests passed, 0 failed, 1 ignored. Phases 0-12 ALL COMPLETE.

---

## Phase 0-6: COMPLETE (GEO-1 through GEO-57)
Foundation: GPU texture I/O, software VM, assembler, message passing, visualization, evolution, GPU cross-validation.

## Phase 7: COMPLETE (GEO-58 through GEO-61, GEO-67 through GEO-71)
Agent-driven VM: device proxy, agent_loop transpile, SPIR-V RV64 kernel, AMDGPU DRM submission, DMA-BUF sharing, self-hosting assembler Phases 1-5.

## Phase 8: RV64 Bare-Metal Execution (COMPLETE)
Boot a real RV64 Linux kernel on the GPU compute shader.
- GEO-62: Boot minimal RV64 Linux kernel on native GPU executor (done)
- GEO-59: SPIR-V RV64 compute shader kernel (done)
- GEO-60: AMDGPU direct command submission via DRM ioctl (done)
- GEO-61: DMA-BUF framebuffer sharing for zero-copy visualization (done)

**Note:** All regressions resolved. 396/396 tests passing.

## Phase 9: Probabilistic & Self-Modifying Code (COMPLETE)
- GEO-64: Probabilistic execution opcodes (BRANCH_PROB, CONFIDENCE_MARK, ALTERNATIVE_SELECT) (done)
- GEO-65: Self-modification opcodes (GLYPH_MUTATE, SPATIAL_SPAWN, SEMANTIC_MERGE) (done)
- Sv39 virtual memory: page table walk, VA translation (done)

## Phase 10: Pixel-Native Filesystem (COMPLETE)
- GEO-66: Design and implement pixel-native spatial filesystem (done)

## Phase 11: Self-Hosting Assembler (COMPLETE)
The assembler assembles itself. All 7 phases implemented.
- GEO-92: SEND/RECV opcodes in mini-assembler (done)
- GEO-93: SPAWN/YIELD/WAIT_EVENT opcodes in mini-assembler (done)
- GEO-72: Phase 6 -- Resident assembler service (YIELD loop, interrupt-driven) (done)
- GEO-73: Phase 7 -- Directives (.include, .define, .org) (done -- merged in commit 9c824903)

---

## Phase 12: Paperclip Automation Infrastructure (COMPLETE)
**Goal:** Full autonomous agent orchestration via Paperclip. The Geometry OS company runs itself -- CEO assigns work, Engineers execute, QA verifies, all through the Paperclip ticket system with heartbeat-driven execution.

### P12A: Agent Identity & Persona System
Create SOUL.md, AGENTS.md, MEMORY.md, TOOLS.md for each agent role. Externalized identity ensures consistency across sessions.

**Tasks:**
- Create CEO agent identity files (SOUL.md, AGENTS.md) with strategic planning persona
- Create Rust Engineer identity files with GPU systems specialization
- Create QA/Verifier agent identity files with skeptical, thorough persona  
- Create MEMORY.md persistence layer for each agent
- Create TOOLS.md capability manifests for each agent role

### P12B: Heartbeat Configuration & Cost Control
Configure heartbeat intervals per role. Implement budget tracking. Thin context for high-frequency agents, fat context for strategic agents.

**Tasks:**
- Set heartbeat intervals: Engineer 60s, CEO 300s, QA 120s
- Configure heartbeatAdapterConfig for cost-efficient pulse checks
- Implement monthly budget tracking (budgetMonthlyCents)
- Add budget enforcement: 80% warning, 100% hard-stop
- Create burn rate dashboard visualization

### P12C: Routine-Based Dispatch Loop
Replace external cron with native Paperclip Routines. CEO routine creates issues, Engineer routine picks up backlog.

**Tasks:**
- CEO routine: read ROADMAP.md, create missing issues, sync roadmap state
- Engineer routine: pick next backlog item, checkout, execute, mark done
- QA routine: verify completed issues, run tests, approve or reject
- Chief of Staff routine: route unassigned tasks to appropriate agents
- Configure skip_if_active concurrency for all routines

### P12D: Worktree Isolation & Merge Workflow
Each agent works in its own git worktree. Merge conflicts resolved by the merge workflow.

**Tasks:**
- Auto-create worktree on issue checkout
- Set agent adapterConfig.cwd to worktree path
- Implement post-completion merge: agent PRs back to main
- Add worktree cleanup on issue completion
- Handle merge conflicts with automated rebase

### P12E: Verification & Quality Gates
Automated testing on every heartbeat completion. PR-style review with thinking path.

**Tasks:**
- CI plugin: run `cargo test --lib` on every issue completion
- PR review with thinking path traceability
- Regression detection: fail on any test count decrease
- Agent rework rate tracking and alerting
- Quality gate: issue cannot close until CI passes

### P12F: Multi-Agent Coordination
Multiple engineers working concurrently on independent features.

**Tasks:**
- Support 2+ concurrent Engineer agents with separate worktrees
- Atomic task checkout with 409 Conflict on race conditions
- Inter-agent communication via ticket system
- Dependency-aware task routing (GEO-64 before GEO-65)
- Agent hiring/firing: CEO can request new agents

### P12G: External Integrations
Webhook-driven routines for GitHub, monitoring, and notifications.

**Tasks:**
- GitHub webhook: PR review triggers QA routine
- Slack/Discord notifications on critical events (budget, failures)
- Daily progress report routine (digest of completed work)
- External API for programmatic task injection
- Clipmart-style company template export

---

## Phase 13: Full Self-Hosting (IN PROGRESS)
The Geometry OS VM runs its own orchestration layer. Agents are VM processes. The OS manages its own developers.

### P13A: Issue Queue as Pixel Region (GEO-212, in_progress)
Task queue that lives entirely in VM texture memory. Stdlib routines for CREATE, PICK, UPDATE, LIST.

### P13B: Agent VM Program (GEO-213, todo)
A .gasm program that autonomously picks issues, executes work, and reports results. Uses SPAWN/SEND/RECV/YIELD.

### P13C: Self-Orchestrating Loop (GEO-214, backlog)
CEO VM creates work, Agent VMs execute it. Full autonomous loop with metrics. 2+ concurrent agents, no deadlocks.

---

## Current Agent Roster

| Agent | Role | Model | Heartbeat | Budget | Status |
|-------|------|-------|-----------|--------|--------|
| CEO | Strategic planning, roadmap | glm-5.1 | 300s | $20/mo | running |
| Rust Engineer | GPU systems, Rust code | glm-5.1 | 60s | $50/mo | running |
| Engineer | General implementation | glm-5.1 | 120s | $50/mo | running |
| QA/Verifier | Verification, quality gates | glm-5.1 | 180s | $20/mo | idle |

## Agent Identity System (P12A COMPLETE)

All agents have externalized identity in `.paperclip/agents/{role}/`:
- SOUL.md (personality, values, communication format)
- AGENTS.md (SOPs, decision logic, workflow rules)
- MEMORY.md (persistent learnings across sessions)
- TOOLS.md (capability boundary -- what they can/can't do)

Agents "read themselves into being" at every heartbeat via promptTemplate identity block.

## Routines

| Routine | Schedule | Purpose |
|---------|----------|---------|
| Process next backlog item | */15 min | Engineer picks up next task |
| Roadmap sync | Hourly | CEO keeps roadmap/issues in sync |
