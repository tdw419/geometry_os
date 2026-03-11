# Proposal: Map Competition Protocol

**Area:** Core Architecture / Evolution System  
**Status:** PROPOSAL  
**Priority:** HIGH  
**Created:** 2026-02-06  

---

## Vision Statement

> "The infinite map isn't something we build — it's something that evolves through competition."

The Map Competition Protocol establishes a Darwinian selection mechanism where multiple map renderers compete for territory on a shared visual substrate. The program that controls the largest area of the infinite map **becomes** the infinite map.

---

## Problem Statement

Currently, Geometry OS has a fixed infinite map implementation (Rust/Smithay/WGPU). While powerful, this approach has limitations:

1. **Single point of failure** — If our renderer has limitations, the entire OS is limited
2. **No natural evolution** — Better algorithms can't emerge organically
3. **Centralized design** — Conflicts with the decentralized, living-system philosophy
4. **Bootstrap paradox** — How do you build an infinite map without already having one?

---

## Proposed Solution: Competitive Map Evolution

### Core Concept

```
┌─────────────────────────────────────────────────────────────────────────┐
│                     THE INFINITE MAP GAME                               │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   RULE 1: Any program can claim territory by rendering pixels          │
│   RULE 2: Territory = pixels_rendered × quality × frame_rate           │
│   RULE 3: The largest territory holder BECOMES the substrate           │
│   RULE 4: Dethroned substrates become applications on the new map      │
│                                                                         │
│   EMERGENT PROPERTY: Natural selection for infinite-capable renderers  │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### The Five-Phase Competition Cycle

```
┌──────────────────────────────────────────────────────────────────────┐
│                    COMPETITION CYCLE                                 │
├──────────────────────────────────────────────────────────────────────┤
│                                                                      │
│  ╔═══════════════╗                                                   │
│  ║  1. CLAIM     ║ Programs register their render capabilities      │
│  ╚═══════╤═══════╝                                                   │
│          │                                                           │
│          ▼                                                           │
│  ╔═══════════════╗                                                   │
│  ║  2. RENDER    ║ Programs render to their claimed regions         │
│  ╚═══════╤═══════╝                                                   │
│          │                                                           │
│          ▼                                                           │
│  ╔═══════════════╗                                                   │
│  ║  3. MEASURE   ║ Arbiter calculates territory scores              │
│  ╚═══════╤═══════╝                                                   │
│          │                                                           │
│          ▼                                                           │
│  ╔═══════════════╗                                                   │
│  ║  4. CROWN     ║ Winner becomes the substrate renderer            │
│  ╚═══════╤═══════╝                                                   │
│          │                                                           │
│          ▼                                                           │
│  ╔═══════════════╗                                                   │
│  ║  5. EVOLVE    ║ Neural Evolution generates new challengers       │
│  ╚═══════════════╝                                                   │
│                                                                      │
└──────────────────────────────────────────────────────────────────────┘
```

---

## Benefits

| Benefit | Description |
|---------|-------------|
| **Self-Improving System** | The map naturally evolves toward infinity |
| **No Bootstrap Problem** | Start with ANY finite map, let evolution handle the rest |
| **Decentralized Design** | No single renderer is privileged |
| **Failure Tolerance** | If a renderer crashes, others can take over |
| **Innovation Pressure** | Constant selection pressure for better algorithms |
| **Emergent Capabilities** | Infinite behavior emerges from finite competition |

---

## Risks & Mitigations

| Risk | Severity | Mitigation |
|------|----------|------------|
| **Competition instability** | High | Minimum tenure period for substrate (60 seconds) |
| **Resource exhaustion** | Medium | Per-renderer GPU memory budgets |
| **Malicious takeover** | Medium | Sandboxed render regions, capability-based permissions |
| **Regression** | Low | Historical high-water mark protection |
| **Render wars** | Low | Smooth transition animations, no harsh flickering |

---

## Timeline Estimate

| Phase | Duration | Deliverable |
|-------|----------|-------------|
| **Phase 1: Protocol Design** | 1 week | API specification, message formats |
| **Phase 2: Arbiter Implementation** | 1 week | Territory measurement daemon |
| **Phase 3: Sample Contenders** | 2 weeks | 3+ competing renderers integrated |
| **Phase 4: Evolution Integration** | 1 week | Neural Evolution generates challengers |
| **Phase 5: Coronation Ceremony** | 1 week | Smooth substrate handoff system |

**Total: 6 weeks**

---

## Conclusion

The Map Competition Protocol transforms Geometry OS from a static system into a living, evolving organism. By making the infinite map an emergent property of competition rather than a fixed implementation, we solve the bootstrap paradox and create natural selection pressure for truly infinite-capable renderers.

**The era of designed systems is over. The era of evolved systems has begun.**
