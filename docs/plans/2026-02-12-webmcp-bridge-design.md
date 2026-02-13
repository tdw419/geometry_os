# WebMCP Bridge for Geometry OS — Design Document

**Date:** 2026-02-12
**Phase:** Phase A: WebMCP Tool Layer
**Status:** Implemented
**Architect:** Claude Code (Brainstorming Session)

---

## Overview

WebMCP Bridge exposes Geometry OS capabilities as structured WebMCP tools that any AI agent (Gemini, Claude, GPT, local LLM via LM Studio) can invoke directly — no screenshotting, no DOM scraping, no pixel-guessing.

This completes the paradigm: **"The Screen is the Hard Drive — and now the API surface."**

---

## Architecture Decision

### Approach A: Event-Driven Bridge (Selected)

```
┌─────────────────────────────────────────────────────────────────┐
│                    Chrome 146+ Browser                          │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │  navigator.modelContext (WebMCP API)                    │   │
│  │  • registerTool()  • provideContext()                   │   │
│  └───────────────────────┬─────────────────────────────────┘   │
│                          │                                      │
│  ┌───────────────────────▼─────────────────────────────────┐   │
│  │  webmcp_bridge.js                                       │   │
│  │  • Listens for 'geometry-os-ready' event               │   │
│  │  • Registers 4 Core tools                               │   │
│  │  • Publishes OS context                                 │   │
│  └───────────────────────┬─────────────────────────────────┘   │
│                          │ (via window.geometryOSApp)          │
│  ┌───────────────────────▼─────────────────────────────────┐   │
│  │  application.js (NO CHANGES REQUIRED)                   │   │
│  │  • GeometryOSApplication                                │   │
│  │  • Emits 'geometry-os-ready' at end of init             │   │
│  └─────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
```

**Why Event-Driven:**
- Zero modifications to application.js
- Uses existing `geometry-os-ready` event (line 225)
- Clean separation of concerns
- Late-load safe (checks for pre-existing app)

---

## The 4 Core Tools

### Tool 1: `navigate_map`

**Purpose:** Pan/zoom the infinite canvas to coordinates or named regions.

**Input Schema:**
```json
{
  "x": { "type": "number", "description": "World X coordinate (grid units)" },
  "y": { "type": "number", "description": "World Y coordinate (grid units)" },
  "zoom": { "type": "number", "minimum": 0.05, "maximum": 10.0 },
  "region": { "enum": ["origin", "antigravity_prime", "neural_nursery", "system_console"] }
}
```

**Returns:**
- Camera position (x, y, zoom)
- Visible bounds
- Resolved region name

---

### Tool 2: `get_os_state`

**Purpose:** Read-only snapshot of Geometry OS state.

**Input Schema:**
```json
{
  "include": {
    "type": "array",
    "items": { "enum": ["camera", "windows", "subsystems", "performance", "evolution", "all"] }
  }
}
```

**Returns:**
- Camera state
- Window list
- Subsystem availability (viewport, infiniteMap, computeSystem, etc.)
- Performance metrics (FPS, renderer type)
- Evolution state
- WebMCP bridge metrics

---

### Tool 3: `execute_pixel_program`

**Purpose:** Run code on Pixel CPU or GPU execution system.

**Input Schema:**
```json
{
  "mode": { "enum": ["cpu", "gpu", "auto"] },
  "program": { "type": "string", "description": "Inline source (RISC-V, WGSL, or hex)" },
  "brick_url": { "type": "string", "description": "URL to .brick file" },
  "entrypoint": { "type": "string", "default": "main" },
  "args": { "type": "array", "items": { "type": "number" } },
  "trace": { "type": "boolean", "default": true }
}
```

**Returns:**
- Execution output
- Trace (if requested)
- Instruction count
- Target used (cpu/gpu)

---

### Tool 4: `load_rts_cartridge`

**Purpose:** Mount PixelRTS v2 cartridge (.rts.png) into infinite map.

**Input Schema:**
```json
{
  "url": { "type": "string", "description": "URL to .rts.png file" },
  "position": { "x": "number", "y": "number" },
  "autoNavigate": { "type": "boolean", "default": true }
}
```

**Returns:**
- Dimensions (width x height)
- SHA256 hash
- Unique color count
- Grid position
- Scale applied

---

## Context Publisher

The bridge also publishes OS context via `navigator.modelContext.provideContext()`:

```javascript
{
  os_name: 'Geometry OS',
  paradigm: 'The Screen is the Hard Drive',
  rendering_engine: 'PixiJS v8 (WebGPU)',
  spatial_mapping: 'Hilbert Curve (1D→2D locality preserving)',
  file_format: 'PixelRTS v2 (.rts.png)',
  encoding: 'RGBA 4 bytes/pixel dense packing',
  verification: 'SHA256 embedded hashes',
  grid_size: 100,
  named_regions: { origin, antigravity_prime, neural_nursery, system_console },
  controls: { pan, zoom, drag_window }
}
```

---

## Fallback Behavior

**Silent Fallback (Recommended):**
- If `navigator.modelContext` is unavailable (Chrome <146 or other browsers)
- Log single warning: `"WebMCP: Not available (Chrome 146+ required). Visual Shell running in standard mode."`
- App continues normally — no broken functionality

---

## Files Created/Modified

| File | Action | Lines |
|------|--------|-------|
| `systems/visual_shell/web/webmcp_bridge.js` | Created | 746 |
| `systems/visual_shell/web/index.html` | Modified | +3 |

---

## DevTools Verification

Once running in Chrome 146+:

```javascript
// Check bridge status
window.webmcpBridge.getStatus()
// → { available: true, registered: true, tools: [...], totalCalls: N }

// Test navigation
navigator.modelContext.callTool('navigate_map', { region: 'antigravity_prime' })

// Get state
navigator.modelContext.callTool('get_os_state', { include: ['all'] })
```

---

## Future Phases

**Phase B:** Expanded 8 tools (evolution, LLM chat, area agents, Hilbert queries)
**Phase C:** DevTools MCP Server integration for TDD on PixiJS render loop
**Phase D:** Agent2Agent (A2A) protocol for horizontal agent coordination

---

## References

- [WebMCP Specification](https://github.com/GoogleChrome/webmcp)
- `GPU_NATIVE_ARCHITECTURE.md` — GPU execution context
- `systems/visual_shell/web/application.js` — Main app (lines 224-225 for event)
