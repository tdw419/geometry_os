# Vision Cortex: Client-Side OCR for AI GUI Operation

**Date:** 2026-02-13
**Status:** Approved Design
**Depends On:** WebMCP Bridge (Phase A-G), GPU Framebuffer Access

---

## Overview

The Vision Cortex enables AI agents to "see" and "read" the GUI through structured tool calls instead of raw pixel processing. This implements the Semantic Perception model described in the WebMCP specification, replacing slow, error-prone vision with deterministic text extraction.

**Paradigm:** "Structured tool calls, not pixel guessing."

---

## Goals

1. **Instant Comprehension** - AI reads terminal/GUI text without OCR latency tax
2. **Element Detection** - Find buttons, text fields, and windows by label
3. **Semantic Frames** - Return structured UI state instead of 4MB screenshots
4. **Zero Backend** - Pure browser/WASM implementation, no Python required
5. **Performance** - Cache aggressively, block UI minimally

---

## Architecture

### System Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    WebMCP Bridge                             │
│  ┌───────────────────────────────────────────────────────┐  │
│  │              VisionCortex Module                       │  │
│  │  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐   │  │
│  │  │ Tesseract.js│  │  TextCache  │  │ Element     │   │  │
│  │  │ (WASM OCR)  │  │  (dedupe)   │  │ Detector    │   │  │
│  │  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘   │  │
│  │         │                │                │           │  │
│  │         └────────────────┴────────────────┘           │  │
│  │                          │                            │  │
│  │                    OCR Pipeline                       │  │
│  └──────────────────────────┬────────────────────────────┘  │
│                             │                               │
│  ┌──────────────────────────┴────────────────────────────┐  │
│  │                  WebMCP Tools                          │  │
│  │  • hypervisor_read_text()                             │  │
│  │  • hypervisor_find_element()                          │  │
│  │  • hypervisor_frame({format:'semantic'})              │  │
│  └───────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
                    ┌─────────────────┐
                    │ GPU Framebuffer │
                    │ (Canvas/Texture)│
                    └─────────────────┘
```

### Component Responsibilities

| Component | Responsibility |
|-----------|---------------|
| **VisionCortex.js** | OCR orchestration, caching, element detection |
| **Tesseract.js** | WASM-based OCR engine (external dependency) |
| **TextCache** | Region-based caching with TTL and hash invalidation |
| **ElementDetector** | Parse OCR output into semantic UI elements |

---

## WebMCP Tools

### Tool 1: `hypervisor_read_text`

Read text content from the framebuffer.

**Input Schema:**
```json
{
  "region": {
    "type": "object",
    "properties": {
      "x": { "type": "number", "default": 0 },
      "y": { "type": "number", "default": 0 },
      "width": { "type": "number" },
      "height": { "type": "number" }
    },
    "description": "Screen region to read. Defaults to full screen."
  },
  "scale": {
    "type": "number",
    "default": 1.0,
    "description": "Scale factor for OCR. >1.0 for pixel art fonts, <1.0 for high-DPI."
  },
  "lang": {
    "type": "string",
    "default": "eng",
    "description": "Language code for OCR (eng, chi_sim, jpn, etc.)"
  }
}
```

**Returns:**
```json
{
  "success": true,
  "text": "root@alpine:~# uname -a\nLinux alpine 5.15.0...",
  "confidence": 0.94,
  "regions": [
    {
      "text": "root@alpine:~#",
      "bounds": { "x": 10, "y": 5, "width": 120, "height": 16 },
      "confidence": 0.98
    },
    {
      "text": "uname -a",
      "bounds": { "x": 130, "y": 5, "width": 70, "height": 16 },
      "confidence": 0.96
    }
  ],
  "processing_time_ms": 127
}
```

---

### Tool 2: `hypervisor_find_element`

Find UI elements by label or type.

**Input Schema:**
```json
{
  "label": {
    "type": "string",
    "description": "Text to search for (fuzzy match)"
  },
  "type": {
    "type": "string",
    "enum": ["button", "text", "link", "window", "any"],
    "default": "any",
    "description": "Element type to filter by"
  },
  "exact": {
    "type": "boolean",
    "default": false,
    "description": "Require exact label match"
  }
}
```

**Returns (Found):**
```json
{
  "success": true,
  "found": true,
  "elements": [
    {
      "label": "Login",
      "type": "button",
      "bounds": { "x": 200, "y": 300, "width": 80, "height": 32 },
      "center": { "x": 240, "y": 316 },
      "confidence": 0.97
    }
  ],
  "count": 1
}
```

**Returns (Not Found):**
```json
{
  "success": true,
  "found": false,
  "elements": [],
  "suggestion": "No elements matching 'Login' found. Similar: 'Sign In', 'Log Out'"
}
```

---

### Tool 3: `hypervisor_frame`

Get current screen state in structured format.

**Input Schema:**
```json
{
  "format": {
    "type": "string",
    "enum": ["semantic", "raw", "both"],
    "default": "semantic",
    "description": "Output format: semantic (JSON), raw (base64 PNG), or both"
  },
  "region": {
    "type": "object",
    "properties": {
      "x": { "type": "number" },
      "y": { "type": "number" },
      "width": { "type": "number" },
      "height": { "type": "number" }
    }
  }
}
```

**Returns (semantic):**
```json
{
  "success": true,
  "format": "semantic",
  "timestamp": 1739452800000,
  "screen": {
    "width": 800,
    "height": 600
  },
  "windows": [
    {
      "id": "win_terminal",
      "title": "Terminal",
      "bounds": { "x": 50, "y": 50, "width": 640, "height": 400 },
      "focused": true
    }
  ],
  "buttons": [
    {
      "label": "OK",
      "bounds": { "x": 350, "y": 520, "width": 60, "height": 24 },
      "enabled": true
    }
  ],
  "text_fields": [
    {
      "label": "Search",
      "bounds": { "x": 100, "y": 10, "width": 200, "height": 24 },
      "value": "",
      "focused": false
    }
  ],
  "text_content": "root@alpine:~# _"
}
```

---

## VisionCortex Module Design

### Class Structure

```javascript
class VisionCortex {
    // Configuration
    #config = {
        tesseractLang: 'eng',
        tesseractWorkerCount: 1,
        cacheTTL: 500,        // ms
        cacheMaxSize: 50,     // regions
        defaultScale: 1.0,
        lazyLoad: true
    };

    // State
    #tesseractWorker = null;
    #textCache = new Map();
    #lastFrameHash = null;
    #isLoading = false;
    #isReady = false;

    // Public API
    async initialize();
    async recognize(canvas, region, options);
    async findElement(label, type, options);
    async getSemanticFrame(canvas);
    clearCache();

    // Private helpers
    #hashRegion(canvas, region);
    #scaleCanvas(canvas, scale);
    #parseButtons(ocrResult);
    #parseTextFields(ocrResult);
    #parseWindows(ocrResult);
}
```

### Initialization Flow

```
┌──────────────────────────────────────────────────────────┐
│                    Lazy Loading                          │
│                                                          │
│  App Boot                                                │
│      │                                                   │
│      ▼                                                   │
│  VisionCortex Created                                    │
│      │                                                   │
│      ▼ (tesseractWorker = null)                         │
│  ... App Runs Normally ...                               │
│      │                                                   │
│      ▼                                                   │
│  First hypervisor_read_text Call                         │
│      │                                                   │
│      ▼                                                   │
│  ┌─────────────────────────────────────────┐            │
│  │ Load Tesseract.js from CDN              │            │
│  │ Initialize WASM Worker                  │            │
│  │ Load Language Data (eng.traineddata)    │            │
│  └─────────────────────────────────────────┘            │
│      │ (~2-3 seconds on first load)                      │
│      ▼                                                   │
│  Worker Ready - OCR Proceeds                             │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

---

## Performance Optimizations

### 1. Region-Based Caching

```javascript
// Cache key combines region + content hash
#hashRegion(canvas, region) {
    const ctx = canvas.getContext('2d');
    const imageData = ctx.getImageData(region.x, region.y, region.width, region.height);

    // Fast hash using first/last bytes and dimensions
    const data = imageData.data;
    const hash = `${region.x},${region.y},${region.width},${region.height}:` +
                 `${data[0]},${data[1]},${data[data.length-4]},${data[data.length-1]}`;
    return hash;
}
```

### 2. Incremental OCR

For terminal-like applications where only the bottom changes:

```javascript
async #smartRecognize(canvas) {
    // Split into regions
    const staticRegion = { x: 0, y: 0, width: canvas.width, height: canvas.height - 100 };
    const dynamicRegion = { x: 0, y: canvas.height - 100, width: canvas.width, height: 100 };

    // Only OCR dynamic region if static unchanged
    const staticHash = this.#hashRegion(canvas, staticRegion);
    const staticCached = this.#textCache.get(staticHash);

    const [staticText, dynamicText] = await Promise.all([
        staticCached ? staticCached : this.#ocr(canvas, staticRegion),
        this.#ocr(canvas, dynamicRegion)
    ]);

    return mergeResults(staticText, dynamicText);
}
```

### 3. Web Worker Offloading

Tesseract.js runs in a Web Worker to avoid blocking the main thread:

```javascript
async #initWorker() {
    this.#tesseractWorker = await Tesseract.createWorker('eng', 1, {
        workerPath: 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/worker.min.js',
        corePath: 'https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/tesseract-core.wasm.js',
        logger: m => console.log('[VisionCortex]', m)
    });
}
```

---

## Scale Parameter Handling

The `scale` parameter handles edge cases in pixel art and high-DPI:

```javascript
#scaleCanvas(canvas, scale) {
    if (scale === 1.0) return canvas;

    const scaled = document.createElement('canvas');
    scaled.width = canvas.width * scale;
    scaled.height = canvas.height * scale;

    const ctx = scaled.getContext('2d');
    ctx.imageSmoothingEnabled = scale < 1.0; // Smooth for downscale
    ctx.drawImage(canvas, 0, 0, scaled.width, scaled.height);

    return scaled;
}
```

**Recommended scales:**
- **Terminal (8x16 fonts):** `scale: 2.0` - Upscale for better character recognition
- **High-DPI (4K):** `scale: 0.5` - Downscale for faster processing
- **Standard GUI:** `scale: 1.0` (default)

---

## Error Handling

```javascript
async recognize(canvas, region, options = {}) {
    try {
        // Validate inputs
        if (!canvas || !(canvas instanceof HTMLCanvasElement)) {
            throw new Error('Invalid canvas provided');
        }

        // Ensure worker ready
        if (!this.#isReady) {
            await this.initialize();
        }

        // Perform OCR
        const result = await this.#tesseractWorker.recognize(
            this.#scaleCanvas(canvas, options.scale || 1.0),
            { rectangle: region }
        );

        return {
            success: true,
            text: result.data.text,
            confidence: result.data.confidence,
            regions: result.data.words.map(w => ({
                text: w.text,
                bounds: {
                    x: w.bbox.x0 / (options.scale || 1.0),
                    y: w.bbox.y0 / (options.scale || 1.0),
                    width: (w.bbox.x1 - w.bbox.x0) / (options.scale || 1.0),
                    height: (w.bbox.y1 - w.bbox.y0) / (options.scale || 1.0)
                },
                confidence: w.confidence
            }))
        };

    } catch (error) {
        console.error('[VisionCortex] OCR failed:', error);
        return {
            success: false,
            error: error.message,
            text: '',
            confidence: 0
        };
    }
}
```

---

## File Structure

```
systems/visual_shell/web/
├── VisionCortex.js          # NEW: OCR module (~250 lines)
├── webmcp_bridge.js         # MODIFY: Wire up tools (~50 lines added)
├── index.html               # MODIFY: Load Tesseract CDN
└── test_vision_cortex.html  # NEW: Test page (~150 lines)
```

---

## Dependencies

| Package | Version | Source | Size |
|---------|---------|--------|------|
| tesseract.js | ^5.0.0 | CDN (jsdelivr) | ~2MB WASM |

Loaded lazily on first OCR call.

---

## Success Criteria

| # | Criteria | Verification |
|---|----------|-------------|
| 1 | `hypervisor_read_text` returns terminal output | OCR matches actual terminal text |
| 2 | Scale parameter improves pixel font recognition | 2.0 scale on 8x16 fonts >90% accuracy |
| 3 | Cache prevents redundant OCR | Same region read twice → second call <10ms |
| 4 | UI thread not blocked | OCR runs in worker, main thread free |
| 5 | `hypervisor_find_element` finds buttons by label | Search "Login" returns correct bounds |
| 6 | `hypervisor_frame({format:'semantic'})` returns structure | JSON contains windows, buttons, text_fields |

---

## Future Enhancements (Out of Scope)

1. **Multi-language OCR** - Add lang parameter support for CJK, Cyrillic
2. **Custom Training** - Train Tesseract on terminal fonts for higher accuracy
3. **Element Heuristics** - Detect buttons by shape, not just text proximity
4. **Accessibility Tree Integration** - Query VM's a11y layer directly (zero OCR)

---

## References

- WebMCP Specification: `https://docs.mcp-b.ai/`
- Tesseract.js Documentation: `https://tesseract.projectnaptha.com/`
- Phase F Design: `docs/plans/2026-02-13-webmcp-phase-f-design.md`
- Phase G Design: `docs/plans/2026-02-13-webmcp-phase-g-design.md`

---

**Document Status:** Approved, Ready for Implementation
