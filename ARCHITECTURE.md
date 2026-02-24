# Geometry OS - Architecture (Game Engine Edition)

> How the pieces connect to power "World of Rectification."

---

## System Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                    WORLD OF RECTIFICATION ENGINE                     │
├─────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                    VISUAL SHELL (Game UI)                     │   │
│  │   Infinite Map │ Window Particles │ ASCII GUI │ Game World     │   │
│  └────────────────────────────┬─────────────────────────────────┘   │
│                               │                                      │
│                               ▼                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │              NEURAL EVENT BUS (Game Events)                   │   │
│  │   Pub/Sub │ Game Signal History │ Semantic Matching           │   │
│  └────────────────────────────┬─────────────────────────────────┘   │
│                               │                                      │
│          ┌────────────────────┼────────────────────┐                │
│          ▼                    ▼                    ▼                │
│  ┌──────────────┐   ┌──────────────┐   ┌──────────────────────┐    │
│  │ SWARM AGENTS │   │ INTELLIGENCE │   │ EVOLUTION DAEMON     │    │
│  │ (Ghost Mentors)│ │ (TMS/CTRM)   │   │ (Mechanic Evolver)   │    │
│  │ • Scribes     │   │ • Contextual │   │ • Recursive Growth   │    │
│  │ • Sprouts     │   │   Memory     │   │ • Mutation Emitter   │    │
│  │ • AI Mentors  │   │ • Goal       │   │ • Tectonic Engine    │    │
│  │               │   │   Inference  │   │ • Consensus Voting   │    │
│  └──────┬───────┘   └──────────────┘   └──────────────────────┘    │
│         │                                                           │
│         ▼                                                           │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                    TASK BOARD (Quest System)                  │   │
│  │   Atomic Quest Claiming │ File Locking │ Status Tracking      │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                 PERSISTENCE LAYER (Game Save)                 │   │
│  │   .geometry/ │ wor_state.json │ ASCII world fragments         │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                                                      │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Game Engine Components

### 1. Visual Shell (`systems/visual_shell/`) - The Game UI
**Purpose:** Renders the infinite game world and handle user interactions.

| Component | Game Role |
|-----------|-----------|
| PixiJS Desktop | The Game Map (Infinite 2D Plane) |
| ASCII GUI | Quests, Inventory, Telemetry Overlays |
| Visual Bridge | Game State Sync (Browser <-> Python) |
| NEB Bridge | Real-time world updates |

---

### 2. Neural Event Bus (`systems/swarm/neb_*.py`) - The Event System
**Purpose:** Coordinates game signals (Rectifications, Movements, Quest completions).

**Topic Namespaces:**
```
task.*             - Quest lifecycle (pending -> completed)
swarm.proposal.*   - AI Mentor consensus on world state
memory.*           - Global game history
growth.*           - Evolutionary mechanics updates
```

---

### 3. Swarm Agents (`systems/swarm/guilds/`) - The AI Inhabitants
**Purpose:** Provides Ghost Mentors, Scribes, and autonomous game entities.

| Guild | Game Role |
|-------|-----------|
| ScribeAgent | Expert Mentors (Human or AI) |
| SproutAgent | New Players (Training Data Generators) |
| ReviewerAgent | Verification of "Rectification" acts |

---

### 4. Task Board (`systems/swarm/task_board.py`) - The Quest System
**Purpose:** Manages player and agent quests atomically.

- **Claiming**: AI Mentors "claim" a player to guide.
- **Locking**: Prevents multiple mentors from interfering with the same rectification.

---

### 5. Evolution Daemon (`systems/evolution_daemon/`) - Mechanic Evolver
**Purpose:** Recursively improves game balance and features.

- **Introspection**: Analyzes which world regions are "husk-heavy."
- **Mutation**: Proposes new game mechanics to facilitate rectification.

---

### 6. Intelligence System (`systems/intelligence/`) - TMS/CTRM
**Purpose:** Truth Management and Cognitive Reasoning.

| Component | Game Role |
|-----------|-----------|
| CTRM Scorer | Measures the "quality" of player reasoning |
| TMS | Validates the "truth" of the world state |
| GoalInference | Predicts what the player is trying to rectify |

---

## Data Persistence

**Location:** `.geometry/`

| File/Dir | Game Data |
|----------|-----------|
| `episodic_memory.json` | Player/Agent history |
| `tectonic/` | Map layout history |
| `wordpress_zone/` | Integration with "World of Rectification" Plugin |

---

## External Dependencies

| Dependency | Purpose |
|------------|---------|
| WordPress | Web portal for "World of Rectification" |
| PixiJS | Game world rendering |
| Rust | High-performance Tectonic/Vector calculations |

---

*Last updated: 2026-02-24*
