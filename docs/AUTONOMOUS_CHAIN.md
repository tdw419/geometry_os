# Autonomous Development Chain

This document explains how Geometry OS is built autonomously by AI agents
running in a continuous loop. If you are an AI agent reading this, this is
how your development environment works.

## The Loop

```
cron tick (every 5m)
  -> pre-flight check (lock, slots, gate)
  -> prompt compilation (strategy, context, code skeletons)
  -> agent reads ROADMAP.md
  -> agent implements next task
  -> agent commits
  -> agent cleans up
  -> next tick
```

Each tick is a **fresh session**. The agent has no memory of previous ticks.
It re-derives what to do from the filesystem every cycle. This is the key
design decision: no accumulated hallucinations, no context rot.

## Components

### 1. Cron Job (the ticker)

A Hermes cron job fires every 5 minutes. It calls the pre-flight script
before spawning the agent. The cron job is managed via `hermes cron` and
its configuration lives in `~/.hermes/cron/jobs.json`.

### 2. Pre-flight Script

Location: `~/.hermes/scripts/chain_preflight.py`

Runs before every agent session. Outputs one of three statuses:

- **CONTINUE** -- agent should work. Outputs task, carry-forward context,
  compiled prompt, and project directory.
- **LOCKED** -- another session is already running, or no API slots available.
  Agent exits immediately.
- **HALT** -- carry-forward engine determined the chain should stop (dead
  sessions, git stalled, persistent blocker). Agent exits immediately.

The pre-flight also:
- Detects stale locks (PID dead or lock older than 5 minutes)
- Checks chain mode (1-4 concurrent slots, set via `~/.hermes/chain-mode`)
- Calls the carry-forward decision engine to check chain health
- Reads the next unchecked task from ROADMAP.md
- Compiles a rich prompt using the prompt compiler

### 3. Carry Forward Decision Engine

Location: `~/zion/projects/carry_forward/carry_forward/carry_forward.py`

A 5-stage pipeline that decides whether the chain should continue:

1. **Dead session thrash detection** -- if 3 of last 5 sessions had 0 msgs
   and 0 tool calls, halt
2. **Git progress validation** -- if HEAD hasn't moved across 3+ sessions,
   the agent is busy but unproductive, halt
3. **Pattern analysis** -- checks historical success rates by session source
4. **Blocker management** -- if a blocker is older than 4 hours, halt
5. **Session activity** -- if current session has 0 tool calls and <=2 msgs,
   it's dead

All decisions are logged to `carry_forward.db` with reasons and thresholds.

### 4. Prompt Compiler

Location: `~/zion/projects/prompt_generator/prompt_generator/prompt_compiler/`

Called by the pre-flight for each task. Takes the task description and
produces a rich prompt containing:

- **Strategy directive** -- tells the agent HOW to work:
  - SCOUT: research and understand before acting
  - SURGEON: make targeted, minimal edits
  - BUILDER: scaffold new modules with tests (TDD)
  - REFACTOR: safe transformations with immediate verification
  - FIXER: reproduce bugs, write failing test, then fix

- **RAG context** -- relevant research and past session outcomes from the
  knowledge base

- **Code skeletons** -- function signatures from the files the agent will
  be modifying

- **Git context** -- recent commits, current branch, TODOs in the codebase

The compiler uses recipes (YAML configs) that define which sources to pull
and how to assemble the prompt. Recipes live in `prompt_compiler/recipes/`.

Available recipes:
- `implement-feature` -- scaffold new features with context
- `debug-fix` -- debug and fix bugs with error context
- `code-review` -- review changes with conventions
- `explore-understand` -- explore and understand a codebase

### 5. The Agent

The cron agent follows these steps each tick:

1. **Read pre-flight output** -- if not CONTINUE, exit immediately
2. **Setup** -- cd to project dir, clean WIP with `git checkout -- .`
3. **Read compiled prompt** -- strategy, RAG context, code skeletons
4. **Read project docs** -- AI_GUIDE.md, NORTH_STAR.md
5. **Implement** -- pick next unchecked ROADMAP item, write code
6. **Verify** -- run `cargo test`, all must pass
7. **Cleanup** -- record outcome, delete lock file, record git heads

## Chain Mode

The file `~/.hermes/chain-mode` controls how many concurrent sessions
the chain can use (1-4):

| Mode | Meaning                              |
|------|--------------------------------------|
| 1    | Shared -- chain uses 1 slot          |
| 2    | Shared -- chain uses 2 slots         |
| 3    | Shared -- chain uses 3 slots         |
| 4    | Full autonomous -- chain uses all 4  |

Set with: `echo N > ~/.hermes/chain-mode`

## Lock File

`/tmp/geo-chain.lock` prevents concurrent sessions from colliding. The
lock contains the PID of the owning process. Stale locks (PID dead or
older than 5 minutes) are auto-cleaned by the pre-flight.

## ROADMAP.md

The ROADMAP is the contract between humans and the autonomous chain.
It's the one piece of persistent state the agent trusts.

Format:
```markdown
- [x] Completed task
- [ ] Next task to implement
- [ ] Future task
```

The agent picks the first unchecked `- [ ]` item. If that task is blocked,
it moves to the next one.

**Important:** The ROADMAP must stay ahead of the codebase. If it gets
stale or stops reflecting reality, the agent will do work that doesn't
matter. Keeping the ROADMAP honest is the primary human responsibility.

## Git as Source of Truth

Every tick, the agent starts from the current git state. It does not
trust its own context from previous sessions. Progress is measured in
commits -- either they exist or they don't.

The carry-forward engine snapshots git HEAD before and after sessions.
If HEAD doesn't move across multiple sessions, the chain halts.

## Model Fallback

If the primary API (z.ai / glm-5.1) fails (rate limit, timeout, error),
the agent automatically falls back to the local Ollama instance
(qwen3.5-27b). This is configured in `~/.hermes/config.yaml` under
`fallback_providers`.

## Key Files

| File                                   | Purpose                              |
|----------------------------------------|--------------------------------------|
| `ROADMAP.md`                           | Task queue -- what to build next     |
| `docs/NORTH_STAR.md`                   | Project vision and design philosophy |
| `AI_GUIDE.md`                          | Architecture, conventions, opcodes   |
| `~/.hermes/scripts/chain_preflight.py` | Pre-flight gate check                |
| `~/.hermes/chain-mode`                 | Concurrency control (1-4)            |
| `/tmp/geo-chain.lock`                  | Session lock file                    |
| `~/.hermes/config.yaml`                | Hermes config (model, fallbacks)     |

### 6. Roadmap Auditor (every 30m)

A separate cron job that periodically audits ROADMAP.md against the actual
codebase state. It uses the prompt compiler's `roadmap-audit` recipe to pull:

- Current ROADMAP.md content
- All lib/*.gasm and programs/*.gasm (what actually exists)
- Rust code skeletons (what's implemented)
- Recent git history
- RAG context

The auditor then:
- Fixes stale counts (test count, opcode count, library list)
- Checks off items that exist in the codebase but are still marked `[ ]`
- Removes duplicate entries across batches
- Adds features found in the codebase that aren't in the ROADMAP
- Does NOT add aspirational items -- only reflects what EXISTS

Recipe: `prompt_compiler/recipes/roadmap-audit.yaml`

## What Can Go Wrong

| Symptom                      | Cause                          | Fix                                  |
|------------------------------|--------------------------------|--------------------------------------|
| 0 msgs, agent hangs          | Model streaming long response  | Wait 5+ min, it's not broken         |
| Repeated 0-msg sessions      | API key exhausted (429)        | Fallback should kick in; check pool  |
| Chain stalls, no commits     | ROADMAP items too vague        | Make tasks specific and actionable   |
| Hallucinated opcodes         | Model inventing mnemonics      | Already caught by pre-commit grep    |
| Stale lock, no new sessions  | Previous agent died uncleanly  | Auto-cleaned after 5 min, or `rm` it |
| Wrong branch                 | Agent working on wrong branch  | Check `git branch`, switch if needed |

## Repository

GitHub: https://github.com/tdw419/geometry_os

The chain works on a local branch and pushes when asked. The ROADMAP
and NORTH_STAR live in the repo and are the source of truth for both
humans and agents.
