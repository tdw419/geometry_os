# Paperclip Automation Pipeline: Roadmap → OpenSpec → Issues

## The Three Layers

```
ROADMAP.md ──→ openspec/changes/ ──→ Paperclip Issues (GEO-*)
   (what)         (how)                (do it now)
```

Each layer answers a different question. The roadmap says *what* we're building and why. OpenSpec says *how* we'll build it, in detail, with specs and task checklists. Paperclip issues say *do this specific thing right now*, assigned to an agent who will execute it.

---

## Layer 1: ROADMAP.md

**Purpose:** Strategic picture. What phases exist, what's done, what's next, what the endgame looks like.

**Location:** `ROADMAP.md` in the project root (also mirrored at `docs/ROADMAP.md`).

**Structure:**
- Phases are numbered (Phase 0 through Phase 13)
- Each phase has a one-line goal and a list of issue identifiers
- Phases have status: COMPLETE, IN PROGRESS, PLANNED
- Sub-phases (like P12A through P12G) break large phases into coherent chunks

**Current state (as of April 6, 2026):**
- COMPLETE: Phases 0-12 (all phases through VM Assembler Verification)
- IN PROGRESS: Phase 13 (Full Self-Hosting) -- 13A done (GEO-212), 13B (GEO-213) and 13C (GEO-214) actively being worked
- 726 tests passing, 0 failures, 3 ignored
- NOTE: The ROADMAP.md itself may lag behind actual issue state. The CEO sync updates it every 4 hours.

**Who reads it:** The CEO agent's "Roadmap sync" routine reads `docs/ROADMAP.md` every 4 hours to sync issue state and create missing issues. Humans read it to understand the big picture. Engineers read it to understand where their task fits.

**When it changes:** The CEO's "Roadmap sync" routine (d45cd557) updates ROADMAP.md when phases complete. Humans can edit it to redirect strategy.

---

## Layer 2: OpenSpec Change Documents

**Purpose:** Detailed specification. Requirements, scenarios, task checklists, technical design. The "contract" for what a phase delivers.

**Location:** `openspec/changes/{change-name}/`

**Structure per change:**
```
openspec/changes/p12a-agent-identity/
  proposal.md      -- Why we're doing this, what changes, key decisions
  specs/
    requirements.md -- Formal requirements with scenarios
  tasks.md         -- Checked task list with verification steps
  design.md        -- Technical approach (optional, for complex changes)
```

**File roles:**

| File | Answers | Audience |
|------|---------|----------|
| proposal.md | Why? What's the motivation? What's changing? | Humans, CEO |
| specs/requirements.md | What must be true? What are the edge cases? | QA, Engineers |
| tasks.md | What are the concrete steps? How do we verify? | Engineers |
| design.md | How does it work technically? Directory layout? | Engineers |

**Who reads it:** The CEO reads proposals to decide priority and scope. Engineers read tasks to get their step-by-step instructions. QA reads specs to know what to verify.

**When it changes:** Written when a phase is planned. Updated as implementation reveals new requirements. Archived when the phase is complete.

**Current OpenSpec changes:** Seven sub-phases from Phase 12 (p12a through p12g) plus an `archive/` directory for completed changes.

---

## Layer 3: Paperclip Issues

**Purpose:** Executable work items. One issue = one agent heartbeat's worth of work.

**Location:** Paperclip API (localhost:3100). Identified as GEO-1, GEO-72, GEO-186, etc.

**Scale:** 135 issues total. 124 done, 8 cancelled, 2 in_progress, 1 todo. Issue counter at 220 (includes routine dispatch artifacts that get auto-cleaned).

**Structure per issue:**
```json
{
  "title": "P12A-1: Create agent identity directory structure",
  "description": "Workdir: ~/zion/projects/geometry_os/geometry_os\n\nSteps:\n1. ...\n2. ...\n\nSuccess: ...",
  "priority": "high",
  "status": "todo",
  "assigneeAgentId": "059452a1-..."
}
```

**Issue lifecycle:**
```
backlog → todo → in_progress → in_review → done
   ↑                                     │
   └──── (QA rejects) ←──────────────────┘
```

**Who reads it:** Agents. The issue description IS the agent's task prompt. It includes the working directory, step-by-step instructions, and success criteria.

**When it changes:** Created by routines (CEO's Roadmap sync creates missing issues from the roadmap) or by humans. Promoted through the lifecycle by agent heartbeat execution.

**Currently active issues:** 3 open. Phase 13B (Agent VM program) and Phase 13C (Self-orchestrating loop) are in_progress. One quality alert is in todo. Phase 13 work is underway.

---

## How the Layers Connect

### The Creation Flow

```
1. Write ROADMAP.md
   "Phase 11 is the self-hosting assembler. Phases 1-7 done, 8+ remain."

2. For each sub-phase, create OpenSpec change:
   - Write proposal.md (why, what changes)
   - Write specs/requirements.md (formal requirements)
   - Write tasks.md (checked steps)
   - Write design.md (technical approach)

3. CEO's Roadmap sync routine creates Paperclip issues:
   - Reads ROADMAP.md, finds items without corresponding issues
   - Creates issues with descriptions that serve as agent prompts
   - Issues start in "backlog" or "todo" status
```

### The Execution Flow (Routines)

Two active Paperclip Routines drive the strategic pipeline:

```
1. "Roadmap sync -- Chief of Staff" (d45cd557) -- Every 4 hours [ACTIVE]
   - Assigned to: CEO (4d484dfa)
   - Step 0: Watchdog -- detects stale in_progress issues (>2h inactive), resets to todo
   - Reads docs/ROADMAP.md
   - Updates phase status based on issue completion
   - Creates missing issues for current and next phase
   - Commits ROADMAP.md changes
   - NOTE: Each trigger creates a throwaway dispatch issue (GEO-NNN). These auto-clean but inflate the issue counter.

2. "Daily progress report" (13307a79) -- Daily at 9 AM CT [ACTIVE]
   - Assigned to: CEO (4d484dfa)
   - Generates project status summary
   - NOTE: Also creates a throwaway dispatch issue per trigger
```

Three dispatch routines were **DELETED** (no longer exist in the API):

```
DELETED -- "Process next backlog item" (3007a745)
   Was: Every 15 min, assigned to Rust Engineer

DELETED -- "Process next backlog item (Engineer)" (671cd234)
   Was: Every 15 min (offset +5), assigned to Engineer

DELETED -- "Verify completed work" (f31f7ef6)
   Was: Every 10 min, assigned to QA/Verifier
```

**Why they were deleted:** The routines created a new ephemeral dispatch issue on every trigger. When there was no real work available, these throwaway issues piled up and got cancelled by CEO watchdog cleanup, inflating the issue counter. The dispatch pattern needs rethinking.

**Agent heartbeats work independently of routines.** Each agent has a heartbeat interval (see below). On each heartbeat, the agent queries Paperclip for its assigned open issues and picks up work. The routines just trigger issue creation -- they don't gate execution.

**To reactivate dispatch:** Options: (a) have the routine check for existing in-flight dispatch issues before creating new ones, (b) use the routine prompt directly as the agent's work instruction without creating a throwaway issue, or (c) create real issues from the roadmap and let agent heartbeats pick them up without the dispatch intermediary.

All routines use `skip_if_active` concurrency -- if the previous run hasn't finished, the new trigger is skipped.

### The Feedback Flow

```
1. QA rejection → issue moves back to in_progress
   - QA writes failure notes
   - Engineer picks up on next heartbeat
   - Rework rate tracked via rework_tracker.sh

2. Regression detected → alert
   - ci_test_count.sh checks .paperclip/last_test_count (uses --list for speed)
   - Test count drop triggers warning

3. Roadmap sync → ROADMAP.md updated
   - All phase issues done? Mark phase complete
   - CEO creates issues for next phase if needed

4. Stale issue watchdog → automatic reset
   - CEO's Step 0 checks for in_progress issues with no activity >2h
   - Resets to todo, clears assignee, posts watchdog comment
   - Prevents silent stalls from crashed or idle agents
```

---

## What Each Agent Does

### CEO Agent (4d484dfa)
- **Role:** Strategic coordination. Manages roadmap, creates issues, syncs phase status. Runs stale issue watchdog.
- **Reads:** docs/ROADMAP.md, OpenSpec proposals, agent metrics
- **Creates:** Issues, strategic directives
- **Heartbeat:** 180s (3 minutes)
- **Timeout:** 600s main, 300s heartbeat (increased from 180/120 to fix 66% timeout rate)
- **Model:** glm-5.1 (heartbeat also uses glm-5.1)
- **Routines:** Roadmap sync (every 4 hours, active), Daily progress report (9 AM CT, active)
- **Known issue:** High timeout rate (66% of runs). Root cause was 120s heartbeat timeout for multi-step API workflow. Increased to 300s.
- **Cannot:** Write code, run cargo, edit source files

### Rust Engineer Agent (059452a1)
- **Role:** Primary coder. Executes implementation issues.
- **Reads:** Issue descriptions, source code, MEMORY.md
- **Writes:** Rust source files, tests, git commits
- **Heartbeat:** 120s (2 minutes)
- **Model:** glm-5.1 (heartbeat uses glm-4.1-flash)
- **Routine:** Process next backlog item (every 15 minutes) -- DELETED
- **Cannot:** Create issues, modify agent configs, access other worktrees

### Engineer Agent (447d735e)
- **Role:** Secondary engineer. Config, infra, CI, tooling, cross-cutting concerns.
- **Reads:** Issue descriptions, source code, MEMORY.md
- **Writes:** Rust source files, tests, git commits, configuration files
- **Heartbeat:** 120s (2 minutes)
- **Model:** glm-5.1 (heartbeat uses glm-4.1-flash)
- **Routine:** Process next backlog item (Engineer) (every 15 minutes, offset +5) -- DELETED

### QA/Verifier Agent (5ad57b5c)
- **Role:** Quality gate. Reviews completed work before merge.
- **Reads:** Completed issue diffs, test output, specs
- **Writes:** Review comments, approval/rejection decisions
- **Heartbeat:** 300s (5 minutes)
- **Model:** glm-5.1 (heartbeat uses glm-4.1-flash)
- **Routine:** Verify completed work (every 10 minutes) -- DELETED
- **Cannot:** Write source code, create branches, push commits

---

## Known Issues (April 2026)

1. **ROADMAP.md can lag behind actual issue state.** The CEO sync runs every 4 hours and sometimes misses phase transitions. If all issues for a phase are done but the ROADMAP still shows IN PROGRESS, the sync will eventually catch up, or a human can edit ROADMAP.md directly.

2. **Agent memory drifts from reality.** The `update-memory-tests.sh` script exists but agents don't run it consistently. The `last_test_count` file may be stale. Best practice: run `update-memory-tests.sh` manually after significant test count changes.

3. **Routine triggers create throwaway dispatch issues.** Both active routines create a new GEO-* issue on every trigger. These get cleaned up (cancelled or auto-removed) but inflate the issue counter. 135 real issues with counter at 220+ (83 wasted numbers). Fix would require Paperclip to support a "no-issue" execution mode for routines.

4. **Project association on routines is stale.** All routines are tied to project "Phase 1: The Machine Runs" (completed). The Paperclip API doesn't support clearing projectId on routines. This is cosmetic -- agents query issues by assigneeAgentId, not project.

5. **Cost tracking is broken.** Dashboard shows $0 spent for all agents. The hermes-paperclip adapter's token parsing regex is mangled. No budget enforcement is active.

6. **CEO had 66% heartbeat timeout rate.** Root cause: 120s heartbeat timeout for a multi-step routine (read roadmap, make multiple API calls, commit). Fixed by increasing to 300s. Monitor to confirm improvement.

7. **No engineer dispatch routine.** The three dispatch routines were deleted (they were noisy). Engineers now only pick up issues that are manually or CEO-assigned. This is intentional but means work only flows when the CEO creates and assigns issues.

8. **Worktrees are unused.** The worktree isolation system exists but no routine or agent creates worktrees. Both engineers work in the main checkout.

---

## Naming Conventions

| Thing | Pattern | Example |
|-------|---------|---------|
| Roadmap phase | Phase N | Phase 11: Self-Hosting Assembler |
| Roadmap sub-phase | P{N}{L} | P12A: Agent Identity |
| OpenSpec change | p{nn}{l}-{name}/ | p12a-agent-identity/ |
| Paperclip issue title | P{NN}{L}-{N}: {description} | P12A-3: Write Rust Engineer identity files |
| Paperclip issue ID | GEO-{N} | GEO-72 |
| Git worktree branch | feat/geo-{N} | feat/geo-72 |

The numbering creates a traceable chain: `Phase 11 → GEO-72 → feat/geo-72 → commit`.

---

## Git Worktree Isolation

Each issue is worked in an isolated git worktree to prevent agents from stepping on each other.

**Directory structure:**
```
~/zion/projects/geometry_os/
  geometry_os/          # Main checkout (master branch)
  worktrees/
    geo-72/             # Worktree for GEO-72 on feat/geo-72
    geo-73/             # Worktree for GEO-73 on feat/geo-73
```

**Lifecycle:**
1. `create-worktree.sh N` -- Creates `../worktrees/geo-N` on branch `feat/geo-N`
2. Agent works in the worktree (cargo test, commits, etc.)
3. `post-complete.sh N` -- Merges `feat/geo-N` into master with test verification, cleans up worktree
4. `cleanup-worktree.sh N` -- Manual cleanup if needed
5. `orphan-cleanup.sh` -- Removes worktrees older than 24h with no active issue

---

## Scripts Reference

All scripts live in `.paperclip/scripts/`:

| Script | Purpose |
|--------|---------|
| create-worktree.sh | Create isolated git worktree for an issue |
| merge-worktree.sh | Merge feat/geo-N into master with test gate |
| cleanup-worktree.sh | Remove worktree and branch for an issue |
| post-complete.sh | Post-completion merge + cleanup (combines merge + cleanup) |
| dispatch-with-worktree.sh | Create worktree, patch agent cwd, patch issue, checkout |
| orphan-cleanup.sh | Remove stale worktrees (>24h, no active issue) |
| check-dependencies.sh | Check if an issue is blocked by unfinished dependencies |
| ci_test_count.sh | Regression detection via test count comparison (uses --list) |
| rework_tracker.sh | Track agent rework rate, alert if >50% |
| update-memory-tests.sh | Update agent MEMORY.md files with current test count |

---

## The Paperclip Research Foundation

This pipeline is built on patterns from the Paperclip orchestration framework:

1. **Externalized Identity** (SOUL.md, AGENTS.md, MEMORY.md, TOOLS.md) -- agents "read themselves into being" at each heartbeat
2. **Heartbeat Pattern** -- discrete, scheduled execution instead of continuous processes
3. **Thinking Path** -- every completed issue traces from mission to line-level changes
4. **Hierarchy as Guardrail** -- CEO delegates, Engineers execute, QA verifies

---

## Quick Reference: File Locations

```
~/zion/projects/geometry_os/geometry_os/
  ROADMAP.md                          # Strategic roadmap (root)
  docs/ROADMAP.md                     # Strategic roadmap (CEO reads this one)
  openspec/
    changes/
      archive/                        # Completed OpenSpec changes
      p12a-agent-identity/
        proposal.md, specs/, tasks.md, design.md
      p12b-heartbeat-cost-control/
      p12c-routine-dispatch/
      p12d-worktree-isolation/
      p12e-quality-gates/
      p12f-multi-agent-coord/
      p12g-external-integrations/
  .paperclip/
    agents/
      ceo/           (SOUL.md, AGENTS.md, MEMORY.md, TOOLS.md)
      engineer/      (SOUL.md, AGENTS.md, MEMORY.md, TOOLS.md)
      rust-engineer/ (SOUL.md, AGENTS.md, MEMORY.md, TOOLS.md)
      qa-verifier/   (SOUL.md, AGENTS.md, MEMORY.md, TOOLS.md)
    scripts/
      check-dependencies.sh
      ci_test_count.sh
      cleanup-worktree.sh
      create-worktree.sh
      dispatch-with-worktree.sh
      merge-worktree.sh
      orphan-cleanup.sh
      post-complete.sh
      rework_tracker.sh
      update-memory-tests.sh
    metrics/                         # Rework and quality metrics
    last_test_count                  # CI regression baseline

~/zion/projects/geometry_os/worktrees/   # Git worktrees for issue isolation
```

Paperclip API: http://localhost:3100
  Company: Geometry OS (41e9e9c7-38b4-45a8-b2cc-c34206d7d86d)
  Agents: CEO (4d484dfa), Rust Engineer (059452a1), Engineer (447d735e), QA (5ad57b5c)
  Routines:
    ACTIVE  -- Roadmap sync every 4h (d45cd557), Daily report 9AM CT (13307a79)
    DELETED -- Process backlog Rust Eng (3007a745), Process backlog Eng (671cd234), Verify work (f31f7ef6)
  Note: Routine triggers create throwaway dispatch issues that inflate the counter
  DB: psycopg2 host=127.0.0.1 port=54329 user/pass=paperclip db=paperclip
