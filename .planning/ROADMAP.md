# Roadmap: PixelRTS

## Milestones

- **v1.0 PixelRTS Boot** — Phases 1-4 (shipped 2026-03-08)
- **v1.1 Visual Diff** — Phase 5 (shipped 2026-03-08)
- **v1.2 Network Boot** — Phases 6-8.1 (shipped 2026-03-09)
- **v1.3 Multi-Boot** — Phases 9-11 (shipped 2026-03-09)

- **v1.4** — Planning next milestone

## v1.3 Multi-Boot (Complete)

<details>
<summary>v1.3 Multi-Boot (Phases 9-11) - SHIPPED 2026-03-09</summary>

**Milestone Goal:** Boot multiple PixelRTS containers simultaneously with network connectivity

**Key accomplishments:**
- Simultaneous multi-container boot with automatic resource allocation
- Primary/helper container ordering for ordered boot and shutdown
- Virtual networking via QEMU socket multicast (no root required)
- Graceful network fallback to isolated mode

**Phases:** 3 (12 plans, 14 tasks)
**Stats:**
- Files: 8 modified
- Tests: 62+ passing
- Timeline: 1 day

</details>

---

## ▶ Next Up

**Start Next Milestone** — questioning → research → requirements → roadmap

`/gsd:new-milestone`

---

*Last updated: 2026-03-09*
