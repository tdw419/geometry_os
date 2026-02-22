# WebMCP Phase F: AI-Driven Visual Builder — Design Document

**Date:** 2026-02-13
**Phase:** Phase F: AI-Driven Visual Builder
**Status:** Design Approved
**Depends On:** Phase A-E (16 WebMCP tools)

---

## Overview

Phase F enables AI agents to "build" Geometry OS and the Infinite Map visually by triggering UI controls through WebMCP tools. Instead of generating code, the AI acts as a visual user - placing tiles, loading shaders, assembling cartridges, and verifying results through a multi-channel feedback loop.

**Paradigm:** "The AI doesn't write code - it clicks buttons and watches the canvas."

---

## Architecture

```
┌──────────────────────────────────────────────────────────────────────┐
│                    AI Coding Assistant (Claude, etc.)                │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  MCP Client                                                  │   │
│  │  • Existing WebMCP tools (navigate_map, get_os_state...)    │   │
│  │  • NEW Builder tools (builder_place_tile, builder_shader...)│   │
│  └──────────────────────────────────────────────────────────────┘   │
│                              │                                       │
└──────────────────────────────┼───────────────────────────────────────┘
                               │ WebMCP Protocol
                               │
┌──────────────────────────────┼───────────────────────────────────────┐
│                    Chrome 146+ Browser                               │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  webmcp_bridge.js (EXTENDED)                                 │   │
│  │  • Phase A-E tools (existing)                                │   │
│  │  • Phase F: builder_place_tile, builder_load_shader,        │   │
│  │            builder_evolve_shader, builder_assemble_cartridge │   │
│  │            builder_preview, builder_get_state                │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                              │                                       │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  BuilderPanel.js (NEW)                                       │   │
│  │  • Tile Palette (place tiles on map)                         │   │
│  │  • Shader Editor (load, evolve, preview)                     │   │
│  │  • Cartridge Rack (assemble from regions)                    │   │
│  │  • Action Log (real-time AI activity feed)                   │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  Infinite Map (PixiJS Canvas)                                │   │
│  │  [Visual result of AI building actions]                      │   │
│  └──────────────────────────────────────────────────────────────┘   │
└──────────────────────────────────────────────────────────────────────┘
```

---

## New WebMCP Tools

### Tool 12: `builder_place_tile`

Place a tile on the infinite map at specific coordinates.

**Input Schema:**
```json
{
  "tile_type": {
    "type": "string",
    "enum": ["empty", "system", "data", "code", "cartridge", "nursery"],
    "description": "Type of tile to place"
  },
  "x": { "type": "number", "description": "Grid X coordinate" },
  "y": { "type": "number", "description": "Grid Y coordinate" },
  "size": { "type": "number", "default": 100 },
  "metadata": { "type": "object", "description": "Optional tile metadata" }
}
```

**Returns:**
```json
{
  "success": true,
  "tile_id": "tile_abc123",
  "position": {"x": 100, "y": 200},
  "preview_url": "data:image/png;base64,..."
}
```

---

### Tool 13: `builder_load_shader`

Load a WGSL shader into the shader editor panel for visual preview.

**Input Schema:**
```json
{
  "shader_name": { "type": "string", "description": "Name for the shader" },
  "wgsl_code": { "type": "string", "description": "WGSL shader source code" },
  "auto_preview": { "type": "boolean", "default": true }
}
```

**Returns:**
```json
{
  "success": true,
  "shader_id": "shader_xyz789",
  "preview_ready": true,
  "errors": []
}
```

---

### Tool 14: `builder_evolve_shader`

Trigger evolution on the loaded shader using visual controls.

**Input Schema:**
```json
{
  "generations": { "type": "number", "default": 10 },
  "fitness_metric": {
    "type": "string",
    "enum": ["performance", "visual_quality", "entropy", "correctness"]
  },
  "preview_best": { "type": "boolean", "default": true }
}
```

**Returns:**
```json
{
  "success": true,
  "best_shader_id": "shader_evolved_001",
  "fitness_score": 0.87,
  "preview_url": "data:image/png;base64,..."
}
```

---

### Tool 15: `builder_assemble_cartridge`

Assemble a PixelRTS cartridge from placed components.

**Input Schema:**
```json
{
  "name": { "type": "string", "description": "Cartridge name" },
  "region": {
    "type": "object",
    "properties": {
      "x": { "type": "number" },
      "y": { "type": "number" },
      "width": { "type": "number" },
      "height": { "type": "number" }
    }
  },
  "include_files": { "type": "array", "items": { "type": "string" } },
  "boot_config": { "type": "object" }
}
```

**Returns:**
```json
{
  "success": true,
  "cartridge_id": "cart_def456",
  "rts_url": "/cartridges/test_cart.rts.png",
  "preview_url": "data:image/png;base64,..."
}
```

---

### Tool 16: `builder_preview`

Capture a preview of the current build state as an image.

**Input Schema:**
```json
{
  "region": {
    "type": "object",
    "properties": {
      "x": { "type": "number" },
      "y": { "type": "number" },
      "width": { "type": "number" },
      "height": { "type": "number" }
    }
  },
  "format": { "type": "string", "enum": ["png", "data_url"], "default": "data_url" }
}
```

**Returns:**
```json
{
  "success": true,
  "preview_url": "data:image/png;base64,...",
  "timestamp": "2026-02-13T10:24:01Z"
}
```

---

### Tool 17: `builder_get_state`

Get the current state of the builder (placed tiles, loaded shaders, etc.).

**Input Schema:**
```json
{
  "include": {
    "type": "array",
    "items": { "enum": ["tiles", "shaders", "cartridges", "all"] },
    "default": ["all"]
  }
}
```

**Returns:**
```json
{
  "tiles": [
    {"tile_id": "tile_001", "type": "system", "position": {"x": 100, "y": 200}}
  ],
  "shaders": [
    {"shader_id": "shader_001", "name": "compute.wgsl", "evolved": true}
  ],
  "cartridges": [
    {"cartridge_id": "cart_001", "name": "test_cart", "size_kb": 42}
  ]
}
```

---

## BuilderPanel UI

### Panel Layout

```
┌─────────────────────────────────────────────────────────────────┐
│ 🏗️ AI Builder Panel                          [Minimize] [Close] │
├─────────────────────────────────────────────────────────────────┤
│ ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐   │
│ │ 📍 Tiles        │ │ ✨ Shaders      │ │ 📦 Cartridges   │   │
│ │                 │ │                 │ │                 │   │
│ │ [Empty] [Sys]   │ │ [Load WGSL]     │ │ [Select Region] │   │
│ │ [Data] [Code]   │ │ [Evolve]        │ │ [Add Files]     │   │
│ │ [Cart] [Nurs]   │ │ [Preview]       │ │ [Assemble]      │   │
│ │                 │ │                 │ │ [Boot Test]     │   │
│ │ Click map to    │ │ Current:        │ │ Files: 0        │   │
│ │ place selected  │ │ shader_001.wgsl │ │ Size: 0 KB      │   │
│ └─────────────────┘ └─────────────────┘ └─────────────────┘   │
├─────────────────────────────────────────────────────────────────┤
│ 📋 Action Log                                                   │
│ ┌─────────────────────────────────────────────────────────────┐ │
│ │ 10:23:45 AI placed 'system' tile at (100, 200) ✅          │ │
│ │ 10:23:47 AI loaded shader 'compute.wgsl' ✅                 │ │
│ │ 10:23:52 AI evolved shader (gen 10, fitness 0.87) ✅        │ │
│ │ 10:24:01 AI assembled cartridge 'test_cart.rts' ✅          │ │
│ └─────────────────────────────────────────────────────────────┘ │
├─────────────────────────────────────────────────────────────────┤
│ [📸 Preview Region] [🔄 Undo Last] [🗑️ Clear All] [💾 Save]    │
└─────────────────────────────────────────────────────────────────┘
```

### Components

| Component | Purpose |
|-----------|---------|
| **Tile Palette** | Select tile type, click map to place |
| **Shader Editor** | Load WGSL, evolve, preview |
| **Cartridge Rack** | Select region, add files, assemble |
| **Action Log** | Real-time log of AI actions with timestamps |
| **Quick Actions** | Preview, Undo, Clear, Save |

---

## Feedback Loop

### Multi-Channel Feedback

```
AI calls builder_place_tile(x=100, y=200, tile_type="system")
          │
          ▼
WebMCP Bridge processes → Updates Map → Updates Panel → Logs Action
          │
          ▼
Returns structured response:
{
  "success": true,
  "tile_id": "tile_abc123",
  "position": {"x": 100, "y": 200},
  "preview_url": "data:image/png;base64,..."
}
          │
          ▼
Optional verification via:
• DevTools MCP screenshot
• get_os_state query
• A2A agent region notifications
```

### Feedback Channels

| Channel | Method | Use Case |
|---------|--------|----------|
| **Structured** | Tool return value | Quick verification of action success |
| **Screenshot** | DevTools MCP `browser_screenshot` | Visual verification of layout |
| **State Query** | `builder_get_state` + `get_os_state` | Full inventory of placed items |
| **Agent Watch** | A2A `region_change` notifications | Continuous monitoring of regions |

---

## Files to Create/Modify

| File | Action | Est. Lines |
|------|--------|------------|
| `systems/visual_shell/web/webmcp_bridge.js` | Modify | +350 |
| `systems/visual_shell/web/BuilderPanel.js` | Create | ~400 |
| `systems/visual_shell/web/BuilderPanel.css` | Create | ~150 |
| `systems/visual_shell/web/builder_tools_test.html` | Create | ~200 |
| `docs/plans/2026-02-13-webmcp-phase-f-design.md` | Create | ~200 |

---

## Success Criteria

1. ✅ 6 new builder tools registered (17 total WebMCP tools)
2. ✅ BuilderPanel UI renders with Tile/Shader/Cartridge tabs
3. ✅ `builder_place_tile` creates visible tiles on Infinite Map
4. ✅ `builder_load_shader` + `builder_evolve_shader` work with visual preview
5. ✅ `builder_assemble_cartridge` creates downloadable .rts.png
6. ✅ Action Log shows real-time AI activity
7. ✅ Preview screenshots work via DevTools MCP integration
8. ✅ A2A agents can monitor builder region changes

---

## Example AI Building Session

```
AI: "I'll build a small system region on the infinite map."

1. AI calls navigate_map(x=0, y=0, zoom=1.0)
   → Moves viewport to origin

2. AI calls builder_place_tile(tile_type="system", x=0, y=0)
   → Places system tile at origin
   → Returns: {tile_id: "tile_001", preview_url: "..."}

3. AI calls builder_place_tile(tile_type="code", x=1, y=0)
   → Places code tile adjacent

4. AI calls builder_load_shader(shader_name="compute", wgsl_code="...")
   → Loads shader into editor
   → Visual preview appears

5. AI calls builder_evolve_shader(generations=10)
   → Evolution runs
   → Best shader displayed

6. AI calls builder_assemble_cartridge(name="my_system", region={x:0,y:0,w:2,h:1})
   → Creates cartridge
   → Returns download URL

7. AI calls builder_preview(region={x:-1,y:-1,w:4,h:3})
   → Captures preview of built region
   → Returns screenshot for verification
```

---

## Future Phases

**Phase G:** Collaborative multi-AI building with A2A coordination

---

## References

- Phase A Design: `docs/plans/2026-02-12-webmcp-bridge-design.md`
- Phase B Design: `docs/plans/2026-02-12-webmcp-phase-b-design.md`
- Phase C Design: `docs/plans/2026-02-13-webmcp-phase-c-design.md`
- Phase D Design: `docs/plans/2026-02-13-webmcp-phase-d-design.md`
- WebMCP Bridge: `systems/visual_shell/web/webmcp_bridge.js`
