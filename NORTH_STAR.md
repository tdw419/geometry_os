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
User Action -> Visual Shell -> Neural Event Bus -> Swarm Agents -> Task Board
                    |                                    |
                    v                                    v
              Evolution Daemon <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                    |
                    v
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
