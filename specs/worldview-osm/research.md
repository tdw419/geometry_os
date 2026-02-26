---
spec: worldview-osm
phase: research
created: 2026-02-25T19:35:00Z
generated: auto
---

# Research: worldview-osm

## Executive Summary

High feasibility. Replace synthetic PixiJS globe with real OpenStreetMap tiles via Leaflet.js, apply CSS filters for green phosphor aesthetic, integrate existing WorldViewOrchestrator for Tectonic Node placement. All dependencies available or already in codebase.

## Codebase Analysis

### Existing Patterns

- **WorldViewOrchestrator.js** (`systems/visual_shell/web/WorldViewOrchestrator.js`)
  - Maps kernels to geographic nodes
  - `registerKernel()`, `sync()`, `zoomInto()` methods
  - Uses global hooks: `window.addTectonicNode`, `window.updateTectonicNode`, `window.showMemoryTapestry`

- **demo_synthetic_worldview.html** (`systems/visual_shell/web/demo_synthetic_worldview.html`)
  - PixiJS-based 3D globe with Tectonic Nodes
  - HUD overlay pattern with green terminal aesthetic
  - Memory Tapestry zoom-to-memory visualization
  - 10Hz orchestrator sync loop

- **Green phosphor aesthetic** (from demo_synthetic_worldview.html):
  - Background: `#000800`
  - Primary color: `#00FF00`
  - Border glow: `box-shadow: 0 0 20px rgba(0, 255, 0, 0.3)`

### Dependencies

| Dependency | Status | Notes |
|------------|--------|-------|
| Leaflet.js | CDN | `unpkg.com/leaflet@1.9.4` |
| OpenStreetMap tiles | External | `tile.openstreetmap.org` |
| WorldViewOrchestrator | Existing | Already implemented |
| CSS filters | Native | `sepia`, `hue-rotate`, `saturate` |

### Constraints

- OSM tiles require internet or pre-cached local tiles
- CSS filter performance depends on browser GPU acceleration
- Tile cache needs ~500 tiles for zoom 0-8 US coverage

## Feasibility Assessment

| Aspect | Assessment | Notes |
|--------|------------|-------|
| Technical Viability | High | Leaflet is mature, CSS filters well-supported |
| Effort Estimate | S | 6 focused tasks, clear implementation path |
| Risk Level | Low | No new external services, fallback to online tiles |

## Recommendations

1. Use Leaflet.js CDN for simplicity (no build step)
2. Apply CSS filter chain: `sepia(100%) hue-rotate(70deg) saturate(300%) brightness(0.7) contrast(1.2)`
3. Reuse existing WorldViewOrchestrator API unchanged
4. Implement tile cache as optional enhancement (not blocker)
