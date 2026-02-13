# WebMCP Bridge Phase B: Expanded 8 Tools — Design Document

**Date:** 2026-02-12
**Phase:** Phase B: Expanded Tools
**Status:** Design Approved
**Depends On:** Phase A (Core 4 Tools)

---

## Overview

Phase B extends the WebMCP Bridge with 4 additional tools, bringing the total to 8 tools for AI agent access to Geometry OS capabilities.

**Paradigm:** "The Screen is the Hard Drive — and now the API surface."

---

## Architecture

### Approach A: Extend Existing Bridge

Add 4 new tools directly to `webmcp_bridge.js` with hybrid connectivity:

```
┌──────────────────────────────────────────────────────────────────────┐
│                    Chrome 146+ Browser                               │
│                                                                      │
│  ┌────────────────────────────────────────────────────────────────┐ │
│  │  webmcp_bridge.js (EXTENDED)                                   │ │
│  │  ┌──────────────────────────────────────────────────────────┐  │ │
│  │  │  Phase A Tools (existing)                                │  │ │
│  │  │  • navigate_map        • get_os_state                    │  │ │
│  │  │  • execute_pixel_program • load_rts_cartridge            │  │ │
│  │  └──────────────────────────────────────────────────────────┘  │ │
│  │  ┌──────────────────────────────────────────────────────────┐  │ │
│  │  │  Phase B Tools (NEW)                                     │  │ │
│  │  │  • query_hilbert_address ───► HilbertLUT (in-browser)    │  │ │
│  │  │  • trigger_evolution ───────► ws://localhost:8765/evo    │  │ │
│  │  │  • send_llm_prompt ─────────► http://localhost:1234/v1   │  │ │
│  │  │  • spawn_area_agent ────────► ws://localhost:8765/agents │  │ │
│  │  └──────────────────────────────────────────────────────────┘  │ │
│  └────────────────────────────────────────────────────────────────┘ │
│                              │                                       │
│            ┌─────────────────┼─────────────────┐                    │
│            ▼                 ▼                 ▼                    │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐              │
│  │ HilbertLUT   │  │ WebSocket    │  │ HTTP Client  │              │
│  │ (pure JS)    │  │ Backend      │  │ (LM Studio)  │              │
│  └──────────────┘  └──────────────┘  └──────────────┘              │
└──────────────────────────────────────────────────────────────────────┘
```

### Key Design Decisions

1. **Single file extension** - Add ~450 lines to `webmcp_bridge.js`
2. **Hybrid connectivity** - JS for Hilbert, WebSocket for evolution/agents, HTTP for LLM
3. **Graceful degradation** - If backend unavailable, tool returns informative error
4. **Consistent patterns** - Same handler style as Phase A tools

---

## Tool Definitions

### Tool 5: `query_hilbert_address`

**Purpose:** Convert a 1D Hilbert index to 2D coordinates and read pixel data.

**Input Schema:**
```json
{
  "hilbert_index": { "type": "number", "description": "1D Hilbert index" },
  "grid_size": { "type": "number", "default": 256 },
  "read_pixels": { "type": "boolean", "default": true },
  "context_range": { "type": "number", "default": 0 }
}
```

**Returns:**
- `coordinates`: {x, y} from Hilbert conversion
- `rgba`: {r, g, b, a} values at that pixel
- `context`: Array of surrounding pixel values (if context_range > 0)

**Backend:** Pure JS via `HilbertLUT.d2xy()` + canvas `getImageData()`

---

### Tool 6: `trigger_evolution`

**Purpose:** Trigger a WGSL kernel evolution cycle.

**Input Schema:**
```json
{
  "seed_shader": { "type": "string", "description": "WGSL shader code" },
  "generations": { "type": "number", "default": 10, "minimum": 1, "maximum": 100 },
  "fitness_metric": { "enum": ["performance", "visual_quality", "correctness", "entropy"] },
  "mutation_rate": { "type": "number", "default": 0.1 },
  "population_size": { "type": "number", "default": 20 }
}
```

**Returns:**
- `bestFitness`: Highest fitness score achieved
- `generationsCompleted`: Actual generations run
- `evolvedShader`: Best evolved WGSL code
- `cartridgeId`: ID of saved result cartridge

**Backend:** WebSocket to `ws://localhost:8765/evolution`

---

### Tool 7: `send_llm_prompt`

**Purpose:** Send a prompt to the LM Studio bridge for AI-to-AI communication.

**Input Schema:**
```json
{
  "prompt": { "type": "string" },
  "model": { "type": "string", "default": "local" },
  "temperature": { "type": "number", "default": 0.7 },
  "max_tokens": { "type": "number", "default": 2048 },
  "system_prompt": { "type": "string" }
}
```

**Returns:**
- `response`: Generated text
- `model`: Model used
- `tokensUsed`: {prompt, completion, total}
- `latencyMs`: Response time

**Backend:** HTTP POST to `http://localhost:1234/v1/chat/completions`

---

### Tool 8: `spawn_area_agent`

**Purpose:** Create a new area agent to monitor/act on a region.

**Input Schema:**
```json
{
  "agent_type": { "enum": ["monitor", "executor", "evolver", "analyzer"] },
  "region": { "x": "number", "y": "number", "width": "number", "height": "number" },
  "config": { "type": "object" },
  "auto_start": { "type": "boolean", "default": true }
}
```

**Returns:**
- `agentId`: Unique agent identifier
- `status`: "spawned" | "running" | "error"
- `region`: Assigned region bounds
- `heartbeatInterval`: Seconds between status updates

**Backend:** WebSocket to `ws://localhost:8765/agents`

---

## Error Handling

### Graceful Degradation

| Tool | Backend | Fallback Behavior |
|------|---------|-------------------|
| `query_hilbert_address` | HilbertLUT (JS) | **No fallback needed** |
| `trigger_evolution` | WebSocket | Return helpful error message |
| `send_llm_prompt` | HTTP | Return helpful error message |
| `spawn_area_agent` | WebSocket | Return helpful error message |

### Error Response Format

```json
{
  "success": false,
  "error": "Human-readable error message",
  "error_code": "BACKEND_UNAVAILABLE" | "INVALID_INPUT" | "EXECUTION_FAILED",
  "tool": "tool_name",
  "timestamp": "2026-02-12T..."
}
```

### Connection Timeouts

- WebSocket: 5 seconds
- HTTP: 30 seconds

---

## Testing Strategy

### Test Page Extension

Extend `test_webmcp_bridge.html` with Phase B tests:

- `query_hilbert_address`: HilbertLUT available, Index 0 → origin, round-trip
- `trigger_evolution`: WebSocket connection, input validation
- `send_llm_prompt`: HTTP endpoint, input validation
- `spawn_area_agent`: WebSocket connection, input validation

### Mock Backend Mode

Add `?mock_backends=true` URL parameter for testing without real services.

---

## Files to Modify

| File | Action | Est. Lines |
|------|--------|------------|
| `systems/visual_shell/web/webmcp_bridge.js` | Modify | +450 |
| `systems/visual_shell/web/test_webmcp_bridge.html` | Modify | +200 |
| `systems/visual_shell/web/hilbert_lut.js` | Verify | 0 (already exists) |

---

## Success Criteria

1. All 8 tools registered and callable via WebMCP
2. `query_hilbert_address` works with pure JS (no backend)
3. Backend tools fail gracefully with helpful messages
4. Test page passes all Phase A + Phase B tests
5. Integration workflow completes successfully

---

## References

- Phase A Design: `docs/plans/2026-02-12-webmcp-bridge-design.md`
- HilbertLUT: `systems/visual_shell/web/hilbert_lut.js`
- WebMCP Spec: https://github.com/GoogleChrome/webmcp
