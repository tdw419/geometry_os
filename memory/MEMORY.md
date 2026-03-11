# Geometry OS - Memory Index

> **Index only.** See linked files for details.

## Active Systems

| System | Status | Tests | Details |
|--------|--------|-------|---------|
| [Neural Event Bus](neb.md) | ✅ Complete | 13 | Pub/sub coordination with semantic matching |
| [Swarm Guilds](swarm-guilds.md) | ✅ Complete | 60 | Engineer, Reviewer, Architect agents |
| [Senses](senses.md) | ✅ Complete | 28 | FilesystemSense, WebSense |
| [Memory & Growth](memory-growth.md) | ✅ Complete | 44 | EpisodicMemory, RecursiveGrowth |
| [Evolution Daemon](evolution.md) | ✅ Complete | 196 | Self-improvement with gravity |
| [Visual Shell](visual-shell.md) | Active | 40+ | PixiJS / Native infinite desktop |
| [Sisyphus Brain Agent](sisyphus-brain.md) | ✅ Complete | 25+ | Self-evolving PixelBrain via cognitive curiosity |
| [Ouroboros](ouroboros.md) | ✅ Complete | 69+ | Fracture detection, reflex responses |
| [LM Studio Agent](sisyphus-brain.md#lm-studio-tech-lead) | ✅ Complete | - | Tech Lead pattern for deep reasoning |
| [Feedback System](../systems/feedback/) | ✅ Complete | 15+ | Analyzer, Collector, Metrics |

## Quick Stats

- **Total Tests**: 11,000+
- **Total Systems**: 34
- **Python Files**: 3,843
- **Rust Files**: 807
- **Evolution Cycles**: 40+ (continuous)

## Key Paths

```
systems/
├── evolution_daemon/   # Self-improvement, brain mutations
├── visual_shell/       # PixiJS desktop, PixelBrain inference
├── pixel_compiler/     # Binary to RTS conversion
├── pixel_llm/          # LM Studio integration
├── pixel_brain/        # Live LLM inference
├── sisyphus/           # Sisyphus daemon, goal synthesis
├── swarm/              # NEB, Guilds, Senses, Memory
├── tectonic/           # Spatial negotiation
├── foundry/            # Self-modification
├── memory_drift/       # Gravitational KV-cache
├── infinite_map/       # Quadtree, gravity engine
├── network_boot/       # Distributed boot, migration
├── kernel/             # Multi-kernel orchestration
├── intelligence/       # Goal inference
├── vision/             # Vision model integration
├── feedback/           # System feedback loops
├── cognitive/          # Cognitive routing
├── memory/             # Vector memory daemon
├── infinite_map_rs/    # Rust compositor (WIP)
└── ...

.geometry/              # Runtime state
specs/                  # Feature specs
openspec/               # OpenSpec specifications
tests/                  # Test suite
apps/                   # Applications (agency-agents, webmcp, etc.)
```

## Architecture Layers

```
┌─────────────────────────────────────────────────────────────┐
│                    APPLICATIONS                              │
│   agency-agents | autoresearch | webmcp | openspec          │
├─────────────────────────────────────────────────────────────┤
│                    COGNITIVE SYSTEMS                         │
│   Mesh Events | Intent Prediction | Self-Reflection         │
├─────────────────────────────────────────────────────────────┤
│                    VISUAL SHELL                              │
│   GNB | Evolution Engine | Predictive Glow | Governance     │
├─────────────────────────────────────────────────────────────┤
│                    CORE SYSTEMS                              │
│   Evolution Daemon | Sisyphus | Swarm | Tectonic            │
├─────────────────────────────────────────────────────────────┤
│                    INFRASTRUCTURE                            │
│   Pixel Compiler | Pixel LLM | Memory Drift | Network Boot  │
└─────────────────────────────────────────────────────────────┘
```

## Philosophy

See: `docs/ASCII_EXPOSED_COMPUTING_MANIFESTO.md`

- **State as Text** - All system state is human-readable ASCII
- **Transition as Edit** - State changes are text edits
- **Dual-Audience** - Comprehensible to humans AND parseable by AI
- **Grep-ability** - Queryable with standard text tools

## North Star

> Geometry OS is an **autonomous entity that lives on screen**.
> The screen IS the hard drive. It's not a tool to use. It's a system to nurture.

## Historical Topics

See older memory files for historical context:
- `swarm_recursive_evolution.md` - Evolution v2.1 details
- `evolution_daemon_v13.md` - Predictive RTS healing
- `evolution_daemon_v12.md` - Property-based safety proofs
- `evolution_daemon_v11.md` - Safety pipeline
- `infinite_map.md` - Spatial storage VAT system
- `wasm_gpu_bridge.md` - GPU execution bridge
- `pixelrts_v2.md` - Pixel RTS format
- `pattern_detection.md` - Edge detection benchmarks

## Documentation Index

| Document | Path | Description |
|----------|------|-------------|
| README | `/README.md` | Project overview and quick start |
| Agents Guide | `/AGENTS.md` | Agent guidance for code work |
| Contributing | `/CONTRIBUTING.md` | Coding standards |
| Skills | `/SKILLS.md` | AI skills index |
| Cognitive Systems | `/docs/COGNITIVE_SYSTEMS.md` | Cognitive architecture |
| Sisyphus v4 | `/docs/SISYPHUS_V4_DAEMON.md` | Daemon documentation |
| PixelBrain | `/docs/PIXEL_BRAIN_ARCHITECTURE.md` | Brain architecture |
| Unified Architecture | `/docs/UNIFIED_NEURAL_GEOMETRIC_ARCHITECTURE.md` | Full architecture |

---

*Last updated: 2026-03-11*
*Live status: ACTUAL_STATUS.md*
