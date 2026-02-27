# Stack Research

**Domain:** Vision-based OS Boot and Installation
**Researched:** 2026-02-11 (updated 2026-02-27 for Visual Shell Integration)
**Confidence:** HIGH

---

## Visual Shell Integration Additions

**Milestone:** Connect PixelRTS catalog to PixiJS infinite desktop
**Date:** 2026-02-27
**Mode:** Stack additions for subsequent milestone

### Executive Summary

This milestone integrates the **existing** Visual Catalog (Phase 4 complete) with the **existing** PixiJS Infinite Desktop (WindowManager, DesktopWindow, WindowParticle). No new core frameworks needed - only integration components to connect these validated systems.

**Key insight:** The stack is already in place. This milestone is about **wiring**, not **adding**.

---

## Recommended Stack

### Core Technologies (Backend)

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| Python | 3.12+ | Primary implementation language | Already used in codebase; async/await support; excellent library ecosystem |
| PyFuse3 | 3.4.0+ | FUSE filesystem bindings | Modern async API for libfuse3; actively maintained; official docs at pyfuse3.readthedocs.io |
| Pillow | 12.1.0+ | PNG/image processing | Already used in PixelRTS v2; latest version (2026-01-02); mature and stable |
| OpenCV | 4.14+ | Computer vision operations | Industry standard for image processing; extensive algorithm library; includes DNN module |

### Frontend Stack (Existing - No New Dependencies)

| Technology | Version | Purpose | Status |
|------------|---------|---------|--------|
| PixiJS | 7.x (CDN) | 2D rendering engine | Already integrated via CDN |
| pixi-viewport | 3.x (CDN) | Infinite canvas pan/zoom | Already integrated via CDN |
| Native WebSockets | Browser API | Real-time communication | Already in use |

### Vision Model Integration

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| anthropic | 0.40+ | Claude Vision API | Already in codebase; excellent visual understanding; supports image analysis |
| openai | 1.10+ | GPT-4 Vision API | Alternative VLM with strong image analysis; good for cross-validation |
| numpy | 1.24+ | Numerical operations for image data | Already in codebase; foundation for most image processing; highly optimized |

### Supporting Libraries

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| rich | 13.7+ | Terminal UI for progress feedback | When building visual installer with CLI progress bars |
| pydantic | 2.5+ | Data validation for metadata | Already in codebase; validate vision model responses |
| httpx | 0.24+ | Async HTTP for vision APIs | Already in codebase dependency via anthropic; async support |
| aiofiles | 23.2+ | Async file operations | Use when building async FUSE filesystem or installer |
| FastAPI | Latest | Catalog API server | Already in use (port 8080) |

### Development Tools

| Tool | Purpose | Notes |
|------|---------|-------|
| pytest | 7.4+ | Testing framework | Already in codebase; use for FUSE and vision tests |
| pytest-asyncio | 0.21+ | Async test support | Required for pyfuse3 testing |
| mypy | 1.5+ | Type checking | Already in codebase; essential for FUSE type safety |

---

## New Components Required (Visual Shell Integration)

### Frontend JavaScript Modules

| Component | Purpose | Implementation Pattern |
|-----------|---------|------------------------|
| `RTSDesktopObject` | PixiJS sprite wrapper for .rts.png files | Extends existing `WindowParticle` class |
| `BootProgressOverlay` | Real-time boot visualization | PIXI.Graphics + WebSocket streaming |
| `CatalogBridge` | Frontend catalog state management | Vanilla JavaScript module (no library) |
| `BootOrchestrator` | QEMU boot command dispatch | FastAPI endpoint (existing server) |

### Backend Endpoints

| Endpoint | Purpose | Implementation |
|----------|---------|----------------|
| `POST /api/v1/boot/{entry_id}` | Dispatch QEMU boot command | Add to existing FastAPI catalog server |
| `WS /ws/boot/{entry_id}` | Stream boot progress | Use existing `qemu_texture_bridge.py` pattern |

---

## Integration Architecture

```
[SpatialCatalog] ──────► [RTSDesktopObject] ──────► [Infinite Canvas]
      │                        │                         │
      │ (fetch thumbnails)     │ (drag-drop)             │ (pan/zoom)
      ▼                        ▼                         ▼
[FastAPI Catalog]       [WindowParticle]         [pixi-viewport]
      │                        │
      │ (boot command)         │ (progress events)
      ▼                        ▼
[BootOrchestrator] ◄──── [BootProgressOverlay]
      │
      ▼
[QEMU/KVM]
```

---

## Component Details

### RTSDesktopObject

**Purpose:** Represents a .rts.png file as an interactive desktop object.

**Pattern:** Extend existing `WindowParticle` class (from `systems/visual_shell/web/WindowParticle.js`).

```javascript
class RTSDesktopObject extends WindowParticle {
    constructor(rtsMetadata, sprite, options) {
        super(sprite, { type: 'rts-image', ...options });
        this.metadata = rtsMetadata;  // kernel, distro, arch from PNG
        this.bootStatus = 'idle';     // idle | booting | running | error
    }

    async boot() {
        this.bootStatus = 'booting';
        this.showProgressOverlay();
        await this.bootOrchestrator.start(this.metadata.id);
    }
}
```

**Why this approach:**
- Reuses validated drag-drop from `WindowParticle`
- Integrates with existing `NeuralEventBus` for coordination
- Follows established `TerminalManager` lifecycle patterns

### BootProgressOverlay

**Purpose:** Real-time boot progress visualization on the RTS object.

**Pattern:** PIXI.Graphics overlay with WebSocket event subscription.

```javascript
class BootProgressOverlay extends PIXI.Container {
    constructor(rtsObject) {
        this.rtsObject = rtsObject;
        this.progressBar = new PIXI.Graphics();
        this.statusText = new PIXI.Text('', style);
        this.eventBus.on('boot:progress', this.updateProgress.bind(this));
    }

    updateProgress(data) {
        // Visual progress bar fill
        // Status text updates ("Loading kernel...", "Starting init...", etc.)
    }
}
```

**Why this approach:**
- No new libraries needed - PIXI.Graphics is sufficient
- WebSocket streaming already established via `qemu_texture_bridge.py`
- Follows existing `VisualBootLoader` pattern from `visual_boot_loader.js`

### CatalogBridge

**Purpose:** Frontend state management for catalog entries and positions.

**Pattern:** Vanilla JavaScript module - no state management library needed.

```javascript
// CatalogBridge.js
export class CatalogBridge {
    constructor(config) {
        this.apiUrl = config.apiUrl || 'http://localhost:8080/api/v1/catalog';
        this.entries = new Map();
        this.positions = this.loadPositions();  // localStorage persistence
    }

    async refresh() { /* fetch from FastAPI */ }
    savePosition(id, x, y) { /* persist to localStorage + backend */ }
    async boot(id) { /* call boot endpoint */ }
}
```

**Why this approach:**
- `SpatialCatalog` already has refresh/fetch logic - extract to bridge
- LocalStorage pattern already used in `TerminalManager._loadFromLocalStorage()`
- No Redux/MobX needed - scope is narrow

### BootOrchestrator

**Purpose:** Dispatch QEMU boot commands and stream progress.

**Pattern:** FastAPI endpoint added to existing catalog server.

```python
# Add to unified_visual_server.py or create boot_orchestrator.py
@router.post("/api/v1/boot/{entry_id}")
async def boot_entry(entry_id: str):
    entry = catalog.get(entry_id)
    # Dispatch QEMU command
    # Return WebSocket URL for progress streaming
    return {"ws_url": f"ws://localhost:8769/boot/{entry_id}"}
```

**Why this approach:**
- `qemu_texture_bridge.py` already handles WebSocket streaming
- FastAPI already running for catalog - add endpoint
- Pattern established by existing `visual_boot_loader.js` ignition logic

---

## Alternatives Considered

| Category | Recommended | Alternative | Why Not |
|----------|-------------|-------------|---------|
| State Management | Vanilla JS module | Redux/Zustand | Overkill for narrow scope |
| Progress Visualization | PIXI.Graphics | Progress bar library | No PIXI-specific libs needed |
| WebSocket | Native | Socket.io | Native sufficient, already in use |
| Drag-Drop | WindowParticle | react-dnd/html5-dnd | Must stay in PIXI ecosystem |
| HTTP Client | fetch | Axios | fetch sufficient for 2-3 endpoints |
| pyfuse3 | llfuse | Only if you need Python 2.7 support (deprecated) or legacy libfuse2 |
| pyfuse3 | fusepy | Only if you need pure Python implementation without libfuse3 dependency |
| anthropic | openai | When you need GPT-4o specifically or cross-validation between models |
| Claude Vision | GPT-4 Vision | When cost is a concern (GPT-4o is cheaper but less capable visually) |
| rich | tqdm | When you only need simple progress bars (rich provides full TUI) |
| OpenCV | scikit-image | When you need scientific image processing algorithms vs computer vision |

---

## What NOT to Use

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| PixiJS v8 migration | Existing code built against v7 API | Stay on v7 for this milestone |
| Redux/Zustand/MobX | Overkill for 2-3 state values | Vanilla JS module |
| Socket.io | Native WebSockets sufficient | Native WebSocket API |
| python-fuse (libfuse2 bindings) | Deprecated; libfuse2 is EOL; no async support | pyfuse3 (libfuse3) |
| PIL (original) | Abandoned in 2009; no Python 3 support | Pillow (active fork) |
| OpenCV 2.x or 3.x | End-of-life; missing modern features; security issues | OpenCV 4.14+ |
| synchronous vision APIs | Blocks event loop; poor UX for installer operations | Use async anthropic/openai clients |
| raw subprocess calls to QEMU | Fragile; poor error handling; hard to test | Use existing QEMU wrapper patterns from codebase |
| New npm packages | All features achievable with existing CDN-loaded PixiJS | Existing stack |

---

## Version Consistency Note

**PixiJS Version Split:**
- Production (demo.html): v7 via CDN (`https://pixijs.download/v7/pixi.min.js`)
- Tests (some): v8.1.0 via CDN

**Recommendation:** Keep v7 for this milestone. The existing `WindowParticle`, `TerminalManager`, and `DesktopWindow` classes are built against v7 API. Migration to v8 is out of scope.

**Current npm versions (verified 2026-02-27):**
- pixi.js: 8.16.0
- pixi-viewport: 6.0.3

---

## Installation

```bash
# Core FUSE and vision libraries
pip install pyfuse3>=3.4.0 opencv-python>=4.14.0 anthropic>=0.40.0

# Already in codebase - verify versions
pip install "pillow>=12.1.0" "numpy>=1.24.0" "pydantic>=2.5.0" "httpx>=0.24.0"

# For installer UI
pip install "rich>=13.7.0"

# For async file operations
pip install "aiofiles>=23.2.0"

# Testing
pip install "pytest>=7.4.0" "pytest-asyncio>=0.21.0"
```

**System dependencies for FUSE:**
```bash
# Ubuntu/Debian
sudo apt-get install libfuse3-dev fuse3

# Alpine Linux
sudo apk add fuse3-dev fuse3
```

**Frontend:** No new npm packages required. All components use existing stack loaded via CDN.

---

## Integration Points with Existing Stack

### 1. SpatialCatalog → RTSDesktopObject

**Existing code:** `spatial_catalog.js` already fetches catalog and renders thumbnails.

**Integration:** Extract thumbnail rendering to `RTSDesktopObject` class, keep `SpatialCatalog` as data source.

### 2. WindowParticle → Drag-Drop

**Existing code:** `WindowParticle.js` provides full drag-drop with position persistence.

**Integration:** `RTSDesktopObject extends WindowParticle` inherits all drag-drop behavior.

### 3. NeuralEventBus → Coordination

**Existing code:** `NeuralEventBus.js` provides pub/sub for all visual shell components.

**Integration:** `BootProgressOverlay` subscribes to `boot:progress` events.

### 4. TerminalManager → Lifecycle

**Existing code:** `TerminalManager.js` shows create/destroy/focus patterns.

**Integration:** Create `RTSObjectManager` following same patterns (or extend TerminalManager).

### 5. QEMU Texture Bridge → Live Streaming

**Existing code:** `qemu_texture_bridge.py` streams framebuffer via WebSocket.

**Integration:** After boot completes, swap static thumbnail for live texture stream.

---

## Stack Patterns by Variant

**If building FUSE filesystem for direct PNG boot:**
- Use pyfuse3 with async/await
- Implement lazy loading (decode on read, not on mount)
- Cache decoded chunks to avoid repeated PNG decoding
- Because PNG decoding is CPU-intensive and FUSE operations should be fast

**If building vision-based OS detection:**
- Use Claude Vision API (anthropic) with structured prompts
- Extract metadata from PNG tEXt chunks first (fallback to vision)
- Use OpenCV for pre-processing (resize, entropy analysis)
- Because vision models have size limits and token costs

**If building visual installer:**
- Use rich for terminal UI with progress bars and live status
- Implement checkpoint/resume capability (install state persistence)
- Use async I/O for disk operations
- Because OS installation can take minutes and users need visibility

**If building thumbnail gallery:**
- Use Pillow thumbnail() method (efficient, preserves aspect ratio)
- Cache thumbnails in ~/.cache/pixelrts/
- Use rich for TUI or FastAPI for web interface
- Because generating thumbnails on-demand is slow

**If building Visual Shell Integration:**
- Extend `WindowParticle` for drag-drop desktop objects
- Use `NeuralEventBus` for boot progress coordination
- Add FastAPI endpoint for boot orchestration
- Because all patterns already exist in the codebase

---

## Version Compatibility

| Package A | Compatible With | Notes |
|-----------|-----------------|-------|
| pyfuse3 3.4.0+ | Python 3.8+, libfuse3 3.2+ | Requires fuse3 kernel module (Linux 4.20+) |
| Pillow 12.1.0 | Python 3.9+, numpy 1.24+ | Released 2026-01-02, latest stable |
| OpenCV 4.14+ | Python 3.8+, numpy 1.24+ | Pre-built wheels available for most platforms |
| anthropic 0.40+ | Python 3.9+, httpx 0.24+ | Async client requires Python 3.9+ |
| rich 13.7+ | Python 3.8+ | Optional dependency for installer UI |
| PixiJS 7.x | pixi-viewport 3.x | CDN versions - stay on v7 for compatibility |

---

## Sources

- **pyfuse3** — Official documentation at https://pyfuse3.readthedocs.io/ (HIGH confidence)
- **Pillow** — Official docs at https://pillow.readthedocs.io/en/stable/ (HIGH confidence)
- **OpenCV** — Official docs at https://docs.opencv.org/4.x/ (HIGH confidence)
- **anthropic-sdk-python** — GitHub repository at https://github.com/anthropics/anthropic-sdk-python (HIGH confidence)
- **FUSE in Python guide (2024)** — Gunnar Wolf's guide: https://gwolf.org/2024/10/started-a-guide-to-writing-fuse-filesystems-in-python.html (MEDIUM confidence)
- **Deep learning binary analysis (2026)** — arXiv paper: https://arxiv.org/html/2601.09157v1 (MEDIUM confidence - vision approaches for binary analysis)
- **Existing code patterns** — `/systems/visual_shell/web/*.js` (HIGH confidence - verified in codebase)
- **Existing backend** — `/systems/visual_shell/server/*.py` (HIGH confidence - verified in codebase)
- **PixiJS versions** — npm registry (HIGH confidence - verified 2026-02-27)

---

## Confidence Assessment

| Area | Confidence | Reason |
|------|------------|--------|
| PixiJS integration | HIGH | Existing patterns in WindowParticle, TerminalManager |
| Drag-drop implementation | HIGH | WindowParticle already provides this |
| Boot progress visualization | MEDIUM | Pattern exists in visual_boot_loader.js, needs extraction |
| QEMU streaming integration | MEDIUM | qemu_texture_bridge.py exists, needs boot-time adaptation |
| No new dependencies | HIGH | All components achievable with existing stack |

---

## Summary

**The stack is already complete.** Visual Shell Integration requires:

1. **0 new npm packages** — PixiJS v7 already loaded via CDN
2. **0 new Python packages** — FastAPI, WebSockets already in use
3. **4 new JavaScript modules** — Following existing patterns
4. **1-2 new FastAPI endpoints** — Boot orchestration and progress streaming

The work is integration, not innovation. Follow existing patterns from `WindowParticle`, `TerminalManager`, and `VisualBootLoader`.

---

*Stack research for: Vision-based OS Boot and Installation*
*Original: 2026-02-11*
*Updated for Visual Shell Integration: 2026-02-27*
