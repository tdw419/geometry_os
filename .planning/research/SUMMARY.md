# Research Summary: Visual Shell Integration

**Milestone:** v1.1
**Researched:** 2026-02-27
**Confidence:** HIGH

---

## Executive Summary

Visual Shell Integration connects the existing PixelRTS Catalog (v1.0) to the existing PixiJS Infinite Desktop. **No new core frameworks needed** - only wiring between validated systems.

---

## Key Findings

### Stack (from STACK.md)

| Finding | Detail |
|---------|--------|
| **No new dependencies** | PixiJS v7, FastAPI, WebSockets already in place |
| **Integration, not addition** | Wire existing components together |
| **Patterns exist** | WindowParticle, TerminalManager, VisualBootLoader, SpatialCatalog |

### Features (from FEATURES.md)

**Table Stakes (must have):**
- Visual container display (exists in SpatialCatalog)
- Drag-and-drop arrangement (partially implemented)
- One-click boot (API exists, needs UI wiring)
- Boot progress indicator (LoadingIndicator exists)
- Status visualization (needs WebSocket)

**Differentiators:**
- Proximity-based boot
- Live texture swap from QEMU
- Thermographic boot visualization
- Entropy heatmap overlay

**Anti-features (don't build):**
- Real-time ISO→PNG conversion
- Live modification during boot
- Auto-arrange/snap-to-grid

### Pitfalls (from PITFALLS.md)

| Pitfall | Prevention | Phase |
|---------|------------|-------|
| WebSocket state desync | Heartbeat + state machine + reconnection | Phase 1 |
| QEMU process orphaning | Track PIDs per session, timeout kill | Phase 2 |
| Canvas performance with 50+ particles | Visibility culling, throttled updates | Phase 1 |
| Layout persistence not wired | Connect serialize() to debounced save | Phase 1 |
| Boot progress mismatch | Stage-based markers with explicit definitions | Phase 2 |

---

## Components to Build

| Component | Pattern | Phase |
|-----------|---------|-------|
| RTSDesktopObject | Extends WindowParticle | 1 |
| CatalogBridge | Vanilla JS to API | 1 |
| BootProgressOverlay | PIXI.Graphics + WebSocket | 2 |
| BootOrchestrator | FastAPI endpoint | 2 |

---

## Phase Structure Recommendation

**Phase 5: Desktop Object Integration**
- RTSDesktopObject component
- CatalogBridge API client
- Drag-drop wiring
- Layout persistence wiring

**Phase 6: Boot Progress Integration**
- WebSocket boot status
- BootProgressOverlay
- QEMU lifecycle management
- Stage-based progress

---

## Open Questions

1. Target particle count for performance budget? (50? 100?)
2. Layout persistence: localStorage, backend, or both?
3. Boot stages definition for progress correlation?

---

*Research complete. Ready for requirements definition.*
