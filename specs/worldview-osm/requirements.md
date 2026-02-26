---
spec: worldview-osm
phase: requirements
created: 2026-02-25T19:35:00Z
generated: auto
---

# Requirements: worldview-osm

## Summary

Replace synthetic wireframe globe with real OpenStreetMap data while maintaining Geometry OS green terminal aesthetic and preserving Tectonic Node + Memory Tapestry functionality.

## User Stories

### US-1: View Real-World Map

As a Geometry OS operator, I want to see a real geographic map so that kernel locations correspond to actual places.

**Acceptance Criteria**:
- AC-1.1: Map displays OpenStreetMap tiles centered on Texas State Capitol
- AC-1.2: Map supports zoom levels 0-19
- AC-1.3: Map has green phosphor aesthetic applied via CSS filter
- AC-1.4: Scanline and vignette overlays visible

### US-2: Monitor Tectonic Nodes

As a system administrator, I want to see running kernels as markers on the map so that I can monitor distributed compute resources.

**Acceptance Criteria**:
- AC-2.1: Tectonic Node markers appear at registered lat/lon coordinates
- AC-2.2: Markers pulse with animation tied to kernel load
- AC-2.3: HUD displays kernel count and average load
- AC-2.4: Clicking a marker triggers Memory Tapestry view

### US-3: Inspect Memory Tapestry

As a developer, I want to zoom into a kernel's memory so that I can visualize running state.

**Acceptance Criteria**:
- AC-3.1: Memory Tapestry overlay appears on marker click
- AC-3.2: 512x512 canvas renders memory as color pixels
- AC-3.3: Close button returns to map view
- AC-3.4: Tapestry title shows kernel name

### US-4: Operate Offline

As a field operator, I want cached map tiles so that WorldView works without internet.

**Acceptance Criteria**:
- AC-4.1: Python script downloads tiles to local directory
- AC-4.2: Map checks for local tiles before online fallback
- AC-4.3: Console indicates tile source (local vs online)

## Functional Requirements

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| FR-1 | Initialize Leaflet map with OSM tile layer | Must | US-1 |
| FR-2 | Apply green phosphor CSS filter to map | Must | US-1 |
| FR-3 | Add scanline and vignette overlays | Must | US-1 |
| FR-4 | Display coordinate tracking in HUD | Should | US-1 |
| FR-5 | Create Tectonic Node marker system | Must | US-2 |
| FR-6 | Animate marker pulse based on load | Should | US-2 |
| FR-7 | Update HUD with kernel metrics | Must | US-2 |
| FR-8 | Implement Memory Tapestry overlay | Must | US-3 |
| FR-9 | Render memory buffer as pixel visualization | Must | US-3 |
| FR-10 | Connect WorldViewOrchestrator | Must | US-2, US-3 |
| FR-11 | Create tile cache download script | Should | US-4 |
| FR-12 | Implement local/online tile fallback | Should | US-4 |

## Non-Functional Requirements

| ID | Requirement | Category |
|----|-------------|----------|
| NFR-1 | Map initial load < 2 seconds | Performance |
| NFR-2 | Tile cache supports zoom 0-8 for North America | Reliability |
| NFR-3 | CSS filter maintains 60fps scroll/zoom | Performance |
| NFR-4 | Works in Chrome, Firefox, Safari | Compatibility |

## Out of Scope

- Real GPU execution system connection (uses mock)
- Satellite imagery layer
- Hilbert-curve memory visualization
- Real-time process spawning markers

## Dependencies

- Leaflet.js 1.9.4 (CDN)
- OpenStreetMap tile servers
- Existing WorldViewOrchestrator.js
- Python 3 for tile cache script
