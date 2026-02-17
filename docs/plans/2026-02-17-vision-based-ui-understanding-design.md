# Design: Vision-Based UI Understanding System

**Date**: 2026-02-17
**Status**: Approved
**Target**: Replace hardcoded coordinate guessing with semantic UI perception

## Overview

A shared GPU inference daemon that provides visual UI understanding as a system-level primitive for all Geometry OS agents. Uses Florence-2 as the foundational vision model, enabling the ShotcutAgent (and future agents) to perceive UI elements semantically rather than relying on hardcoded coordinates.

## Problem Statement

The current ShotcutAgent uses hardcoded element positions in `find_element()`:

```python
element_positions = {
    "open_other": (80, 50),      # Brittle!
    "text_option": (80, 150),
    "text_field": (400, 320),
    "ok_button": (520, 450)
}
```

This approach:
- Breaks when UI layouts change
- Doesn't work across themes or resolutions
- Requires manual calibration for each application
- Doesn't scale to multiple agents

## Architecture

```
┌─────────────────┐     Unix Socket      ┌──────────────────────┐
│  ShotcutAgent   │ ───────────────────► │                      │
│  (and others)   │                      │   VisionDaemon       │
├─────────────────┤                      │   (port TBD)         │
│  Area Agents    │ ───────────────────► │                      │
│  VisualShell    │                      │   ┌──────────────┐   │
│  etc.           │                      │   │  Florence-2  │   │
└─────────────────┘                      │   │  (RTX 5090)  │   │
                                         │   └──────────────┘   │
                                         └──────────────────────┘
```

### Key Design Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| **Model** | Florence-2 | Unified OCR + detection + grounding in single model (~0.5GB) |
| **Hosting** | Shared GPU daemon | Multi-agent support, GPU memory efficiency, <100ms latency via IPC |
| **API** | Pipeline endpoint | Complex multi-step queries in single request, server-side logic |
| **Scope** | 8 operations (MVP) | Foundation + spatial reasoning + debug rendering |

### Hardware Constraints

- **GPU**: NVIDIA RTX 5090 with WebGPU/Vulkan support
- **Deployment**: Local-only (non-negotiable for self-sufficiency)
- **Latency Target**: Sub-100ms for responsive control loop

## API Contract

### Single Endpoint: `POST /pipeline`

**Request:**
```json
{
  "image": "<base64 PNG/JPEG>",
  "steps": [
    { "op": "detect", "classes": ["button", "input"], "assign_to": "elements" },
    { "op": "ground", "text": "Export", "assign_to": "export_btn" },
    { "op": "relative", "anchor": "$export_btn", "direction": "below", "assign_to": "nearby" },
    { "op": "render_text_layout", "sources": ["$elements", "$export_btn"], "assign_to": "debug" }
  ]
}
```

**Response:**
```json
{
  "success": true,
  "results": {
    "elements": [
      { "bbox": [x, y, w, h], "class": "button", "confidence": 0.94 }
    ],
    "export_btn": {
      "bbox": [450, 120, 80, 32],
      "text": "Export",
      "confidence": 0.97
    },
    "nearby": [...],
    "debug": "┌────────────────────┐\n│ [Export]           │\n│        [Cancel]    │\n└────────────────────┘"
  },
  "latency_ms": 45
}
```

### Variable References

- `assign_to`: Store result in named variable
- `$varname`: Reference previously stored variable
- `$varname.bbox`: Access nested property

## Operations (MVP)

### Core Detection

| Op | Description | Parameters |
|----|-------------|------------|
| `detect` | Find UI elements by type | `classes`: ["button", "input", "menu", "checkbox"] |
| `ocr` | Extract text with bounding boxes | `region`: optional bbox to constrain |
| `ground` | Find elements matching text | `text`: string to find |

### Spatial Reasoning

| Op | Description | Parameters |
|----|-------------|------------|
| `relative` | Find elements relative to anchor | `anchor`, `direction`: above/below/left/right, `max_distance`: pixels |
| `contains` | Filter elements containing text | `source`, `text`, `match`: exact/fuzzy/regex |
| `largest` | Get largest element from list | `source`, `count`: optional limit |
| `smallest` | Get smallest element from list | `source`, `count`: optional limit |

### Utility

| Op | Description | Parameters |
|----|-------------|------------|
| `click_point` | Get center of bbox for clicking | `source`: variable reference |
| `render_text_layout` | ASCII representation for debugging | `sources`: list of variables to render |

## Integration with ShotcutAgent

### Before (Hardcoded)

```python
async def find_element(self, element_type: str, ...):
    element_positions = {
        "open_other": (80, 50),  # Brittle!
        "text_option": (80, 150),
    }
    return element_positions.get(element_type)
```

### After (Vision-Based)

```python
async def find_element(self, description: str) -> Tuple[int, int]:
    result = await self.vision.query({
        "image": self._last_screenshot,
        "steps": [
            { "op": "ground", "text": description, "assign_to": "target" },
            { "op": "click_point", "source": "$target", "assign_to": "click" }
        ]
    })
    return result["click"]
```

### Complex Query Example

Find the value of the "Speed" setting in the "Properties" panel:

```python
await self.vision.query({
    "image": screenshot,
    "steps": [
        { "op": "ground", "text": "Properties", "assign_to": "panel" },
        { "op": "ocr", "region": "$panel.bbox", "assign_to": "panel_text" },
        { "op": "contains", "source": "$panel_text", "text": "Speed", "assign_to": "speed_line" },
        { "op": "relative", "anchor": "$speed_line", "direction": "right", "assign_to": "value" }
    ]
})
```

## File Structure

```
systems/vision/
├── vision_daemon.py          # GPU inference daemon (main service)
├── pipeline_executor.py      # Step-by-step pipeline execution
├── operations/
│   ├── __init__.py
│   ├── base.py               # Base operation class
│   ├── detect.py             # UI element detection
│   ├── ocr.py                # Text extraction
│   ├── ground.py             # Text grounding
│   ├── relative.py           # Spatial queries
│   ├── contains.py           # Text filtering
│   ├── size.py               # Largest/smallest
│   ├── click_point.py        # Click coordinate extraction
│   └── render_text_layout.py # ASCII debug rendering
├── florence_model.py         # Florence-2 model wrapper
└── tests/
    ├── test_pipeline.py
    ├── test_operations.py
    └── fixtures/
        └── sample_screenshots/

conductor/tracks/shotcut-on-the-map/
├── shotcut_agent.py          # Updated to use VisionDaemon
└── vision_client.py          # Lightweight client for VisionDaemon
```

## Success Criteria

| Criterion | Target | Measurement |
|-----------|--------|-------------|
| **Accuracy** | >90% | Correct element detection on Shotcut UI screenshots |
| **Latency** | <100ms | End-to-end for typical queries (P95) |
| **Robustness** | Works across | Different themes, resolutions, minor UI changes |
| **Extensibility** | Zero core changes | New operations added via plugin pattern |

## Future Roadmap

### Phase 2 Operations
- `compare` — Detect visual changes between screenshots
- `wait_for` — Block until element appears/disappears
- `read_table` — Extract structured data from tables
- `group` — Cluster nearby elements into panels

### Phase 3 Enhancements
- Request batching for multi-image analysis
- Model hot-swapping (switch models without restart)
- Caching layer for repeated queries
- WebSocket streaming for real-time analysis

## Dependencies

```toml
[project.dependencies]
torch = ">=2.0"
transformers = ">=4.36"
Pillow = ">=10.0"
numpy = ">=1.24"
fastapi = ">=0.109"  # Optional HTTP interface
uvicorn = ">=0.27"   # Optional HTTP interface
```

## References

- [Florence-2 Model Card](https://huggingface.co/microsoft/Florence-2-base)
- [ShotcutAgent Current Implementation](../../conductor/tracks/shotcut-on-the-map/shotcut_agent.py)
- [VisualCortex Vision System](../../systems/vectorland/vision.py)
