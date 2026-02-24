# Foundational Synthesis Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create the three foundational documents (NORTH_STAR.md, ARCHITECTURE.md, OPERATIONS.md) that define Geometry OS's direction, architecture, and working protocol.

**Architecture:** Synthesize existing fragments (Manifestos, specs, MEMORY.md, codebase structure) into three coherent documents at the repository root. Each document serves a distinct purpose: vision (why), structure (how), and protocol (workflow).

**Tech Stack:** Markdown documentation, existing specs in `specs/`, existing manifestos in `docs/`, MEMORY.md context

---

## Prerequisites

- [x] Codebase exploration complete
- [x] Understanding of core systems (NEB, Swarm, Visual Shell, Evolution Daemon)
- [x] Knowledge of existing documentation (ASCII Exposed Computing Manifesto, AGENTS.md)

---

## Task 1: Create NORTH_STAR.md - Vision & Direction

**Files:**
- Create: `NORTH_STAR.md`

**Step 1: Write the document header and Prime Directive**

Create `NORTH_STAR.md` with:

```markdown
# Geometry OS - North Star

> The definitive vision document for Geometry OS. All decisions should trace back to this.

---

## The Prime Directive

**"The Screen is the Hard Drive."**

Geometry OS treats visual space as persistent storage. Windows are files. Positions are addresses. The desktop is the filesystem.

---

## What Is Geometry OS?

Geometry OS is an **AI-powered operating system** where:

1. **Visual space is primary storage** - Not a metaphor. Actual storage.
2. **AI agents are first-class citizens** - They see what you see, edit what you edit.
3. **Self-evolution is continuous** - The system improves itself through recursive mutation.

---

## Core Philosophy: ASCII Exposed Computing

From the [ASCII Exposed Computing Manifesto](docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md):

| Principle | Meaning |
|-----------|---------|
| State as Text | All system state is human-readable ASCII |
| Transition as Edit | State changes are text edits |
| Dual-Audience | Comprehensible to humans AND parseable by AI |
| Grep-ability | Queryable with standard text tools |

This enables **zero-cost perception** for AI agents - they don't need special APIs to understand the system.

---

## Success Criteria (Definition of Done)

Geometry OS is "stable" when:

- [ ] Visual Shell renders infinite desktop with <16ms frame time
- [ ] Neural Event Bus handles 10,000+ events/second with <10ms latency
- [ ] Swarm agents can claim, execute, and complete tasks autonomously
- [ ] Evolution daemon runs continuously without human intervention
- [ ] All state is readable as ASCII text
- [ ] A new developer can understand the system in <1 hour

---

## Non-Goals

We are explicitly NOT building:

- A general-purpose OS kernel (we use Linux)
- A cloud platform (local-first design)
- A mobile app (desktop/workstation focus)
- A closed ecosystem (everything is text, everything is queryable)

---

## The Core Loop

```
User Action → Visual Shell → Neural Event Bus → Swarm Agents → Task Board
                    ↓                                    ↓
              Evolution Daemon ←←←←←←←←←←←←←←←←←←←←←←←←←
                    ↓
              Recursive Improvement
```

1. User interacts with Visual Shell (infinite desktop)
2. Events flow through Neural Event Bus (NEB)
3. Swarm Agents react to events, claim tasks
4. Evolution Daemon observes, proposes improvements
5. Consensus reached, system mutates, loop continues

---

## Current Phase

**Phase 20+: Transitioning from Symbolic to Geometric**

We are building the spatial substrate where abstract goals map to coordinates on an infinite plane.

---

## Key Metrics

| Metric | Target | Current |
|--------|--------|---------|
| Swarm Tests | 180+ | 180 passing |
| Frame Time | <16ms | TBD |
| Event Latency | <10ms | TBD |
| Evolution Cycles | Continuous | 40 cycles/4 hours |

---

*Last updated: 2026-02-24*
```

**Step 2: Verify document is valid markdown**

Run: `cat NORTH_STAR.md | head -20`
Expected: Clean markdown output with header visible

**Step 3: Commit**

```bash
git add NORTH_STAR.md
git commit -m "docs: add NORTH_STAR.md - definitive vision document"
```

---

## Task 2: Create ARCHITECTURE.md - System Structure

**Files:**
- Create: `ARCHITECTURE.md`

**Step 1: Write the architecture overview**

Create `ARCHITECTURE.md` with:

```markdown
# Geometry OS - Architecture

> How the pieces connect. Read this to understand the system structure.

---

## System Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                         GEOMETRY OS                                  │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                    VISUAL SHELL (PixiJS)                      │   │
│  │   Infinite Desktop │ Window Particles │ ASCII GUI │ Terminal  │   │
│  └────────────────────────────┬─────────────────────────────────┘   │
│                               │                                      │
│                               ▼                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │              NEURAL EVENT BUS (NEB)                           │   │
│  │   Pub/Sub │ Subscriptions │ History │ Semantic Matching       │   │
│  └────────────────────────────┬─────────────────────────────────┘   │
│                               │                                      │
│          ┌────────────────────┼────────────────────┐                │
│          ▼                    ▼                    ▼                │
│  ┌──────────────┐   ┌──────────────┐   ┌──────────────────────┐    │
│  │ SWARM AGENTS │   │ INTELLIGENCE │   │ EVOLUTION DAEMON     │    │
│  │              │   │              │   │                      │    │
│  │ • Engineer   │   │ • Contextual │   │ • Recursive Growth   │    │
│  │ • Reviewer   │   │   Memory     │   │ • Mutation Emitter   │    │
│  │ • Architect  │   │ • Goal       │   │ • Tectonic Engine    │    │
│  │              │   │   Inference  │   │ • Consensus Voting   │    │
│  │ + Senses     │   │ • Proactive  │   │                      │    │
│  │ + Memory     │   │   Assistant  │   │                      │    │
│  └──────┬───────┘   └──────────────┘   └──────────────────────┘    │
│         │                                                           │
│         ▼                                                           │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                    TASK BOARD                                 │   │
│  │   Atomic claiming │ File locking │ Status tracking            │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                 PERSISTENCE LAYER                             │   │
│  │   .geometry/ │ episodic_memory.json │ ASCII state files       │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Core Components

### 1. Visual Shell (`systems/visual_shell/`)

**Purpose:** Primary interface - the infinite desktop where users and AI interact.

**Key Subsystems:**
| Component | Location | Purpose |
|-----------|----------|---------|
| PixiJS Desktop | `web/` | Infinite canvas with window particles |
| ASCII GUI | `ascii_gui/` | Text-based UI components |
| Visual Bridge | `api/visual_bridge.py` | Python ↔ JavaScript bridge |
| Terminal Bridge | `api/terminal_websocket_bridge.py` | WebSocket terminal |
| NEB Bridge | `api/neb_bridge.py` | Events to visual elements |

**Data Flow:**
```
User Input → PixiJS → WebSocket → visual_bridge.py → NEB → Agents
```

---

### 2. Neural Event Bus (`systems/swarm/neb_*.py`)

**Purpose:** Real-time pub/sub coordination layer. The nervous system.

**Key Classes:**
| Class | File | Purpose |
|-------|------|---------|
| NEBSignal | `neb_signal.py` | Topic-based event with embeddings |
| NEBBus | `neb_bus.py` | Pub/sub API with history |
| SubscriptionManager | `subscription_manager.py` | Wildcard & semantic matching |
| SwarmNEBBridge | `swarm_neb_bridge.py` | Consensus event notifications |

**Topic Namespaces:**
```
task.*          - Task lifecycle events
swarm.proposal.* - Consensus proposals
swarm.vote.*    - Consensus votes
swarm.consensus.* - Final decisions
memory.*        - Episodic memory events
growth.*        - Pattern analysis events
```

**Usage:**
```python
from systems.swarm import NEBBus, NEBSignal

bus = NEBBus(node_id="coordinator")
bus.subscribe("task.**", handler)
bus.publish("task.available", {"task_id": "t-001"})
```

---

### 3. Swarm Agents (`systems/swarm/guilds/`)

**Purpose:** Autonomous agents that execute tasks, review code, design systems.

**Guild Structure:**
| Agent | Capabilities |
|-------|--------------|
| EngineerAgent | Code generation, testing, error handling |
| ReviewerAgent | Static analysis, security, style checks |
| ArchitectAgent | Component design, architecture planning |

**Senses** (`systems/swarm/senses/`):
- `FilesystemSense` - Sandboxed file access
- `WebSense` - HTTP with rate limiting

**Memory** (`systems/swarm/memory/`):
- `EpisodicMemory` - Experience storage/retrieval
- `ExperienceStore` - JSON persistence

---

### 4. Task Board (`systems/swarm/task_board.py`)

**Purpose:** Atomic task claiming with file locking. Prevents race conditions.

**Features:**
- `fcntl.flock` for cross-process safety
- Stale claim recovery (>30 min)
- JSON-based task storage
- Status tracking (pending → claimed → completed)

---

### 5. Evolution Daemon (`systems/evolution_daemon/`)

**Purpose:** Continuous recursive self-improvement.

**Loop:**
```
INTROSPECT → PROPOSE → VALIDATE → CONSENSUS → APPLY
```

**Components:**
| Component | Purpose |
|-----------|---------|
| RecursiveOrchestrator | Main evolution loop |
| MutationEmitter | Generates improvement proposals |
| TectonicEngine | Applies accepted mutations |
| EvolutionTracker | History and metrics |

**Control:** `./evolution_ctl.sh start|stop|status|tail|report`

---

### 6. Intelligence System (`systems/intelligence/`)

**Purpose:** Proactive AI assistance and learning.

**Components:**
| Component | Purpose |
|-----------|---------|
| ContextualMemory | Context-aware memory retrieval |
| GoalInferenceEngine | Infer user intent from actions |
| SocraticDaemon | Question-driven assistance |
| ProactiveAssistant | Anticipatory help |

---

## Data Persistence

**Location:** `.geometry/`

| File/Dir | Purpose |
|----------|---------|
| `episodic_memory.json` | Agent experience storage |
| `gui/` | GUI fragments and commands |
| `heat/` | Thermal/usage data |
| `tectonic/` | Evolution proposals |

---

## Key Abstractions

### NEBSignal
```python
@dataclass
class NEBSignal:
    topic: str           # e.g., "task.available"
    payload: dict        # Event data
    embedding: list      # Semantic vector
    timestamp: float     # When emitted
    source: str          # Origin node
```

### Task
```python
@dataclass
class Task:
    id: str
    type: TaskType
    description: str
    status: TaskStatus  # pending, claimed, completed
    claimed_by: Optional[str]
    result: Optional[dict]
```

### Experience
```python
@dataclass
class Experience:
    action: str
    context: dict
    outcome: dict
    embedding: list      # For semantic retrieval
```

---

## Testing

**Test Locations:**
```
systems/swarm/test_*.py              - 180 tests (NEB, Guilds, Senses, Memory)
systems/visual_shell/api/tests/      - API integration tests
systems/intelligence/tests/          - Intelligence tests
systems/evolution_daemon/tests/      - Evolution tests
```

**Run All Tests:**
```bash
pytest systems/swarm/ -v
```

---

## External Dependencies

| Dependency | Purpose |
|------------|---------|
| PixiJS | WebGL rendering for Visual Shell |
| FastAPI | REST API server |
| WebSocket | Real-time communication |
| Rust (vectorland) | High-performance vector ops |
| Rust (infinite_map_rs) | Wayland compositor |

---

*Last updated: 2026-02-24*
```

**Step 2: Verify document renders correctly**

Run: `head -50 ARCHITECTURE.md`
Expected: Clean ASCII diagram visible

**Step 3: Commit**

```bash
git add ARCHITECTURE.md
git commit -m "docs: add ARCHITECTURE.md - system structure and connections"
```

---

## Task 3: Create OPERATIONS.md - Working Protocol

**Files:**
- Create: `OPERATIONS.md`

**Step 1: Write the operations protocol**

Create `OPERATIONS.md` with:

```markdown
# Geometry OS - Operations Protocol

> How we work together. The contract between human and AI.

---

## Autonomy Levels

| Level | Name | When to Use | Example |
|-------|------|-------------|---------|
| 1 | Propose & Wait | Architectural changes, new features | "Should we add a new agent type?" |
| 2 | Execute & Report | Established patterns, bug fixes | "Fixed the NEB subscription bug" |
| 3 | Autonomous | Routine operations, tests | "Running the test suite" |

**Default:** Level 2 (Execute & Report)

Escalate to Level 1 when:
- Adding new system components
- Changing core abstractions
- Modifying the evolution daemon
- Anything affecting data persistence

---

## Commit Protocol

### Commit Style

**Format:**
```
<type>(<scope>): <description>

[optional body]

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Types:**
| Type | When |
|------|------|
| feat | New feature |
| fix | Bug fix |
| docs | Documentation |
| test | Adding/updating tests |
| refactor | Code restructuring |
| chore | Maintenance |

**Examples:**
```bash
feat(swarm): add WebSense with rate limiting
fix(neb): resolve wildcard subscription edge case
docs: add NORTH_STAR.md and ARCHITECTURE.md
test(guilds): add 12 tests for EngineerAgent
```

### Commit Frequency

- **Atomic commits** - One logical change per commit
- **Every test pass** - Commit after tests go green
- **Before context switch** - Commit before switching tasks

---

## Testing Requirements

### Before Committing

1. Run relevant tests: `pytest systems/<module>/ -v`
2. Ensure no regressions: `pytest systems/swarm/ -v` (baseline: 180 tests)
3. Check type hints: `mypy systems/<module>/` (if configured)

### Test Coverage

| Component | Tests | Command |
|-----------|-------|---------|
| NEB + Subscriptions | 13 | `pytest systems/swarm/test_neb*.py -v` |
| Guilds | 60 | `pytest systems/swarm/test_guild*.py -v` |
| Senses | 28 | `pytest systems/swarm/test_sense*.py -v` |
| Memory/Growth | 44 | `pytest systems/swarm/test_memory*.py systems/swarm/test_growth*.py -v` |
| Evolution | 35 | `pytest systems/evolution_daemon/tests/ -v` |

---

## Definition of Done

A task is complete when:

- [ ] Code written and working
- [ ] Tests written and passing
- [ ] Documentation updated (if public API)
- [ ] Committed with proper message
- [ ] No regressions in other tests

---

## Code Style

### Python

- **Formatting:** Follow existing patterns in the file
- **Type hints:** Optional but encouraged for public APIs
- **Docstrings:** Only when logic isn't self-evident
- **Imports:** Standard library → third-party → local

### JavaScript (Visual Shell)

- **Style:** Follow existing `web/*.js` patterns
- **PixiJS:** Use established particle patterns
- **WebSocket:** Use `webmcp_bridge.js` conventions

---

## File Organization

### New Features

```
systems/<feature>/
├── __init__.py          # Public exports
├── core.py              # Main implementation
├── test_<feature>.py    # Tests (same directory)
└── README.md            # If complex
```

### Specs

```
specs/<feature-name>/
├── research.md          # What we learned
├── requirements.md      # What we need
├── design.md            # How we'll build it
└── tasks.md             # Implementation steps
```

---

## Review Process

### Self-Review Checklist

Before asking for review:

- [ ] Does this align with NORTH_STAR.md?
- [ ] Does this follow the architecture in ARCHITECTURE.md?
- [ ] Are all tests passing?
- [ ] Is the commit message clear?

### AI Review (Claude)

After completing a feature:
1. Run full test suite
2. Summarize changes made
3. Ask: "Ready for review?" (Level 1 escalation)

---

## Memory Management

### What to Remember (MEMORY.md)

- Stable patterns confirmed across multiple sessions
- Key architectural decisions
- Important file paths
- Solutions to recurring problems

### What NOT to Remember

- Session-specific context
- Temporary state
- Unverified conclusions

### Organization

```
memory/
├── MEMORY.md       # Index (keep <200 lines)
├── neb.md          # NEB details
├── swarm.md        # Swarm patterns
├── visual-shell.md # Visual Shell notes
└── debugging.md    # Debugging insights
```

---

## Emergency Protocols

### If Tests Fail

1. Don't commit
2. Read the error message
3. Isolate the failure (run single test)
4. Fix or revert
5. Re-run tests

### If Evolution Daemon Misbehaves

```bash
./evolution_ctl.sh stop
./evolution_ctl.sh report  # Check last state
# Investigate, then:
./evolution_ctl.sh start
```

### If Lost Context

1. Read `NORTH_STAR.md` for vision
2. Read `ARCHITECTURE.md` for structure
3. Check `MEMORY.md` for patterns
4. Ask for clarification

---

## Quick Reference

```bash
# Run all swarm tests
pytest systems/swarm/ -v

# Start evolution daemon
./evolution_ctl.sh start

# Check daemon status
./evolution_ctl.sh status

# View daemon logs
./evolution_ctl.sh tail

# Run visual shell
cd systems/visual_shell/web && python -m http.server 8080
```

---

*Last updated: 2026-02-24*
```

**Step 2: Verify document is complete**

Run: `wc -l OPERATIONS.md`
Expected: 200+ lines

**Step 3: Commit**

```bash
git add OPERATIONS.md
git commit -m "docs: add OPERATIONS.md - working protocol and conventions"
```

---

## Task 4: Reorganize MEMORY.md into Topic Files

**Files:**
- Modify: `memory/MEMORY.md` (trim to index)
- Create: `memory/neb.md`
- Create: `memory/swarm-guilds.md`
- Create: `memory/senses.md`
- Create: `memory/memory-growth.md`
- Create: `memory/evolution.md`
- Create: `memory/visual-shell.md`

**Step 1: Read current MEMORY.md**

Run: `cat ~/.claude/projects/-home-jericho-zion-projects-geometry-os-geometry-os/memory/MEMORY.md`
Expected: Current content (543 lines, truncated at 200)

**Step 2: Create memory/neb.md**

```markdown
# Neural Event Bus (NEB)

**Status:** ✅ COMPLETE - 13 tests passing
**Location:** `systems/swarm/neb_*.py`

## Components

| Component | Tests | Description |
|-----------|-------|-------------|
| NEBSignal | 3 | Topic-based event with embedding |
| NEBBus | 4 | Pub/sub with history tracking |
| SubscriptionManager | 6 | Wildcard (`*`, `**`) + semantic matching |

## Usage

```python
from systems.swarm import NEBBus, NEBSignal

bus = NEBBus(node_id="coordinator")
bus.subscribe("task.**", lambda s: print(f"Event: {s.topic}"))
bus.publish("task.available", {"task_id": "t-001"})
```

## Topic Namespaces

- `task.*` - Task lifecycle
- `swarm.proposal.*` - Consensus proposals
- `swarm.vote.*` - Voting events
- `swarm.consensus.*` - Final decisions
- `memory.*` - Memory events
- `growth.*` - Pattern analysis
```

**Step 3: Create memory/swarm-guilds.md**

```markdown
# Swarm Guilds

**Status:** ✅ COMPLETE - 60 tests passing
**Location:** `systems/swarm/guilds/`

## Agents

| Agent | Tests | Capabilities |
|-------|-------|--------------|
| GuildAgent (base) | 10 | Abstract base, NEB integration |
| EngineerAgent | 12 | Code gen, testing, error handling |
| ReviewerAgent | 13 | Static analysis, security, style |
| ArchitectAgent | 14 | Component design, architecture |
| Integration | 11 | End-to-end coordination |

## Usage

```python
from systems.swarm.guilds import GuildFactory

engineer = GuildFactory.create("engineer", task_board=board)
reviewer = GuildFactory.create("reviewer", task_board=board)
architect = GuildFactory.create("architect", task_board=board)

engineer.write_code(spec={"name": "AuthService"})
reviewer.analyze(code="def login(): pass")
architect.design_component("PaymentService", requirements={})
```

## Architecture

GuildAgent extends SwarmAgent with specialized capabilities. GuildFactory provides clean instantiation.
```

**Step 4: Create memory/senses.md**

```markdown
# Swarm Senses

**Status:** ✅ COMPLETE - 28 tests passing
**Location:** `systems/swarm/senses/`

## Components

| Sense | Tests | Purpose |
|-------|-------|---------|
| FilesystemSense | 14 | Sandboxed file access |
| WebSense | 14 | HTTP with rate limiting |

## Usage

```python
from systems.swarm.senses import FilesystemSense, WebSense

fs = FilesystemSense(allowed_paths=["/tmp"], timeout=30.0)
result = fs.read_file("/tmp/config.json")

ws = WebSense(timeout=30.0, max_requests_per_minute=60)
result = await ws.fetch("https://api.example.com/data")
```

## Security

- Path traversal protection via `pathlib.Path.resolve()`
- Sliding window rate limiting
- Async with configurable timeout
```

**Step 5: Create memory/memory-growth.md**

```markdown
# Memory & Growth

**Status:** ✅ COMPLETE - 44 tests passing
**Location:** `systems/swarm/memory/`, `systems/swarm/growth/`

## Components

| Component | Tests | Purpose |
|-----------|-------|---------|
| Experience | 6 | Dataclass with embedding, metadata |
| ExperienceStore | 8 | JSON persistence |
| ExperienceRetriever | 6 | Cosine similarity search |
| EpisodicMemory | 10 | Facade for store/retrieve/learn |
| RecursiveGrowth | 9 | Pattern analysis via NEB |
| PatternAnalyzer | 5 | Performance metrics |

## Usage

```python
from systems.swarm.memory import EpisodicMemory, Experience
from systems.swarm.growth import RecursiveGrowth

memory = EpisodicMemory(agent_id="engineer-001")
exp = Experience(action="write_code", context={}, outcome={})
memory.remember(exp)
similar = memory.recall("authentication error")

growth = RecursiveGrowth(event_bus=bus)
growth.analyze_and_suggest(metrics)
```

## Storage

- `.geometry/episodic_memory.json`
- Hash-based embeddings (POC simplicity)
```

**Step 6: Create memory/evolution.md**

```markdown
# Evolution Daemon

**Status:** ✅ COMPLETE - 196 tests passing
**Location:** `systems/evolution_daemon/`

## Components

| Component | Tests | Purpose |
|-----------|-------|---------|
| ValueEvaluator | 21 | AI value scoring |
| GravityPlacer | 25 | Foveated positioning |
| AxionCore | 24 | Focal point handling |
| RecursiveOrchestrator | 47 | Evolution loop |
| EvolutionTracker | 26 | History, metrics |
| EvolutionDaemon | 19 | Continuous operation |

## Loop

```
INTROSPECT → PROPOSE → VALIDATE → CONSENSUS → APPLY
```

## Control

```bash
./evolution_ctl.sh start|stop|status|tail|report
```

## Metrics (as of 2026-02-20)

- Uptime: ~4 hours
- Cycles: 40
- Improvements: 40
- Rejections: 0
```

**Step 7: Create memory/visual-shell.md**

```markdown
# Visual Shell

**Status:** Active Development
**Location:** `systems/visual_shell/`

## Structure

```
visual_shell/
├── web/              # PixiJS infinite desktop
├── api/              # Python bridges
├── ascii_gui/        # ASCII components
└── ascii_scene/      # Scene management
```

## Key Files

| File | Purpose |
|------|---------|
| `web/index.html` | Main interface |
| `api/visual_bridge.py` | Python ↔ JS bridge (87KB) |
| `api/terminal_websocket_bridge.py` | WebSocket terminal |
| `api/neb_bridge.py` | Events to visuals |

## Running

```bash
cd systems/visual_shell/web
python -m http.server 8080
```
```

**Step 8: Create trimmed MEMORY.md index**

```markdown
# Geometry OS - Memory Index

> **Index only.** See linked files for details.

## Active Systems

| System | Status | Tests | Details |
|--------|--------|-------|---------|
| [Neural Event Bus](neb.md) | ✅ Complete | 13 | Pub/sub coordination |
| [Swarm Guilds](swarm-guilds.md) | ✅ Complete | 60 | Engineer, Reviewer, Architect |
| [Senses](senses.md) | ✅ Complete | 28 | FilesystemSense, WebSense |
| [Memory & Growth](memory-growth.md) | ✅ Complete | 44 | EpisodicMemory, RecursiveGrowth |
| [Evolution Daemon](evolution.md) | ✅ Complete | 196 | Self-improvement |
| [Visual Shell](visual-shell.md) | Active | - | PixiJS infinite desktop |

## Quick Stats

- **Total Swarm Tests:** 180+
- **Total Evolution Tests:** 196
- **Evolution Cycles:** 40+ (continuous)

## Key Paths

```
systems/swarm/          # NEB, Guilds, Senses, Memory
systems/visual_shell/   # PixiJS desktop
systems/evolution_daemon/ # Self-improvement
.geometry/              # Runtime state
specs/                  # Feature specs
```

## Philosophy

See: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`

- State as Text
- Transition as Edit
- Dual-Audience (human + AI)
- Grep-ability

---

*Last updated: 2026-02-24*
```

**Step 9: Commit memory reorganization**

```bash
git add memory/
git commit -m "refactor: reorganize MEMORY.md into topic files"
```

---

## Task 5: Update AGENTS.md to Reference New Docs

**Files:**
- Modify: `AGENTS.md`

**Step 1: Add references to new foundational docs**

Add at the top of AGENTS.md (after any existing header):

```markdown
## Foundational Documents

Before working on Geometry OS, read these in order:

1. **[NORTH_STAR.md](NORTH_STAR.md)** - Vision and direction
2. **[ARCHITECTURE.md](ARCHITECTURE.md)** - System structure
3. **[OPERATIONS.md](OPERATIONS.md)** - Working protocol

---
```

**Step 2: Verify change**

Run: `head -20 AGENTS.md`
Expected: New section visible

**Step 3: Commit**

```bash
git add AGENTS.md
git commit -m "docs: add foundational doc references to AGENTS.md"
```

---

## Task 6: Final Verification

**Step 1: Verify all files exist**

```bash
ls -la NORTH_STAR.md ARCHITECTURE.md OPERATIONS.md
ls -la memory/*.md
```

Expected: All files present

**Step 2: Verify line counts are reasonable**

```bash
wc -l NORTH_STAR.md ARCHITECTURE.md OPERATIONS.md memory/MEMORY.md
```

Expected:
- NORTH_STAR.md: ~100 lines
- ARCHITECTURE.md: ~250 lines
- OPERATIONS.md: ~250 lines
- memory/MEMORY.md: <50 lines (index only)

**Step 3: Run existing tests to ensure nothing broke**

```bash
pytest systems/swarm/ -v --tb=short
```

Expected: 180 tests passing

**Step 4: Final commit (if needed)**

```bash
git status
# If clean, no action needed
```

---

## Summary

| Task | Creates/Modifies | Purpose |
|------|------------------|---------|
| 1 | `NORTH_STAR.md` | Vision and direction |
| 2 | `ARCHITECTURE.md` | System structure |
| 3 | `OPERATIONS.md` | Working protocol |
| 4 | `memory/*.md` | Organized knowledge |
| 5 | `AGENTS.md` | Doc references |
| 6 | Verification | Quality gate |

---

**Plan complete.** Ready for execution.
