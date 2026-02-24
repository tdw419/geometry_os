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
| Visual Bridge | `api/visual_bridge.py` | Python <-> JavaScript bridge |
| Terminal Bridge | `api/terminal_websocket_bridge.py` | WebSocket terminal |
| NEB Bridge | `api/neb_bridge.py` | Events to visual elements |

**Data Flow:**
```
User Input -> PixiJS -> WebSocket -> visual_bridge.py -> NEB -> Agents
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
task.*             - Task lifecycle events
swarm.proposal.*   - Consensus proposals
swarm.vote.*       - Consensus votes
swarm.consensus.*  - Final decisions
memory.*           - Episodic memory events
growth.*           - Pattern analysis events
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
- Status tracking (pending -> claimed -> completed)

---

### 5. Evolution Daemon (`systems/evolution_daemon/`)

**Purpose:** Continuous recursive self-improvement.

**Loop:**
```
INTROSPECT -> PROPOSE -> VALIDATE -> CONSENSUS -> APPLY
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
