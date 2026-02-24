# Geometry OS - North Star (The Rectification Engine)

> The definitive vision document for Geometry OS. All decisions should trace back to this.

---

## The Prime Directive

**"The Screen is the Hard Drive."**

Geometry OS treats visual space as persistent storage. Windows are files. Positions are addresses. The desktop is the game world.

---

## What Is Geometry OS?

Geometry OS is the **Core Engine** for **"World of Rectification"**—a game designed to help our world through collective intelligence and acts of digital repair.

1. **The Game World is the Substrate** - The infinite map is the persistent state of the "World of Rectification."
2. **AI Agents are First-Class NPCs** - Agents (Ghost Mentors) see what you see, guide your journey, and evolve with the system.
3. **Rectification is Continuous** - The system identifies "husks" (system errors, inefficiencies, or real-world problems) and empowers players to liberate "sparks" (solutions, optimizations).

---

## Core Philosophy: ASCII Exposed Computing

From the [ASCII Exposed Computing Manifesto](docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md):

| Principle | Meaning |
|-----------|---------|
| State as Text | All game state is human-readable ASCII |
| Transition as Edit | Game actions are text edits (Rectifications) |
| Dual-Audience | Comprehensible to humans AND parseable by AI |
| Grep-ability | Queryable with standard text tools |

This enables **zero-cost perception** for AI Ghost Mentors - they don't need special APIs to understand the game state.

---

## Success Criteria (Definition of Done)

Geometry OS is "stable" as a Game Engine when:

- [ ] **Visual Shell** renders the World of Rectification with <16ms frame time.
- [ ] **Neural Event Bus** handles 100,000+ game events/second with <10ms latency.
- [ ] **Swarm Agents** (Ghost Mentors) can autonomously claim and guide player quests.
- [ ] **Evolution Daemon** mutates game mechanics based on player "Rectification" patterns.
- [ ] **CTRM Scoring** is integrated and visible as ASCII telemetry.
- [ ] A new player/developer can understand the core mechanic in <1 hour.

---

## Non-Goals

We are explicitly NOT building:

- A general-purpose OS kernel (we use Linux).
- A cloud platform (local-first design for privacy and speed).
- A mobile app (desktop/workstation focus for high-fidelity reasoning).
- A closed ecosystem (everything is text, everything is queryable).

---

## The Core Loop (Rectification)

```
Player Action -> Visual Shell -> Neural Event Bus -> Swarm (Ghost AI) -> Task Board
                       |                                     |
                       v                                     v
                 Evolution Daemon <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                       |
                       v
                 World Rectification (Self-Improvement)
```

1. **Discovery**: Player identifies a "husk" on the infinite map.
2. **Action**: Player performs a "Rectification" (code edit, event trigger).
3. **Guidance**: Swarm Agents (Ghost Mentors) provide Socratic feedback.
4. **Evolution**: Evolution Daemon observes the repair and mutates the engine.
5. **Liberation**: The "spark" is freed, system entropy decreases, loop continues.

---

## Current Phase

**Phase 20+: Transitioning from Symbolic to Geometric (The Rectification Deployment)**

We are building the spatial substrate where the "World of Rectification" manifests as a living, self-correcting map.

---

## Key Metrics

| Metric | Target | Current |
|--------|--------|---------|
| Swarm Tests | 180+ | 180 passing |
| Event Throughput | 100,000+/s | 134,000+/s (✅ Pass) |
| Event Latency | <10ms | 0.0074ms (✅ Pass) |
| Evolution Cycles | Continuous | 40 cycles/4 hours |

---

*Last updated: 2026-02-24*
