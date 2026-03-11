# Phase 4: Visual Catalog Manager - Research

**Researched:** 2026-02-15
**Domain:** Web gallery UI, thumbnail generation, drag-and-drop spatial arrangement, FastAPI web server
**Confidence:** HIGH

## Summary

This phase builds a Visual Catalog Manager that enables users to browse, discover, and boot OS containers from a visual thumbnail gallery. The research examined the existing codebase patterns from Phases 1-3, the RTSRegistryManager for cartridge tracking, the WebMCP bridge for web integration, and the Auto-Claude UI components for drag-and-drop patterns.

The standard approach leverages the existing RTSRegistryManager for catalog data, extends the FastAPI pattern from `systems/pixel_compiler/api/main.py` for web serving, uses PIL for thumbnail generation (already a dependency), and implements drag-and-drop with the HTML5 Drag and Drop API (native browser support, no external library needed). The catalog should be served as a static HTML+JS page that communicates with a FastAPI backend for dynamic operations.

**Primary recommendation:** Create a `CatalogServer` class that extends the existing FastAPI pattern, uses RTSRegistryManager for catalog data, serves a single-page HTML gallery with native HTML5 drag-and-drop, and integrates with the existing BootBridge for one-click boot functionality.

## Standard Stack

The established libraries/tools for this domain:

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| FastAPI | 0.100+ | REST API server | Already used in `systems/pixel_compiler/api/main.py` with CORS middleware configured |
| PIL/Pillow | 10.x | Thumbnail generation | Already imported in `rts_registry_manager.py` for PNG metadata extraction |
| aiohttp | 3.x | Async HTTP/WebSocket | Already used in `web_server.py` and `infinite_map_dashboard.py` |
| HTML5 Drag & Drop API | Native | Drag-and-drop functionality | Zero dependencies, works in all modern browsers, matches existing pattern in Auto-Claude UI |

### Supporting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| pathlib | stdlib | Path handling | All file operations (consistent with existing code) |
| dataclasses | stdlib | Data structures | For CatalogEntry, ThumbnailResult |
| json | stdlib | Serialization | Registry data, API responses |
| base64 | stdlib | Image encoding | Embedding thumbnails in JSON responses |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| Native HTML5 Drag/Drop | dnd-kit/sortable.js | External dependency, more complex; native API sufficient for grid rearrangement |
| FastAPI | Flask | FastAPI is already in use with async support, type hints, auto docs |
| PIL for thumbnails | OpenCV | OpenCV is heavier; PIL already imported in registry manager |
| Single HTML file | React/Vue SPA | SPA requires build pipeline; single HTML file is simpler for catalog use case |

**Installation:**
No additional packages needed - all dependencies are already installed from Phases 1-3 and existing web infrastructure.

## Architecture Patterns

### Recommended Project Structure
```
systems/pixel_compiler/catalog/
├── __init__.py           # Export CatalogServer, CatalogEntry, ThumbnailCache
├── catalog_server.py     # FastAPI server with REST endpoints
├── catalog_scanner.py    # Discovers .rts.png files in directories
├── thumbnail_cache.py    # Generates and caches thumbnails
└── templates/
    └── catalog.html      # Single-page gallery UI
```

### Pattern 1: CatalogScanner - File Discovery
**What:** Recursively scan directories for .rts.png files and extract metadata
**When to use:** On catalog load and with filesystem watching for live updates
**Example:**
```python
# Pattern from rts_registry_manager.py (lines 177-342)
class CatalogScanner:
    """Scan directories for .rts.png files and extract metadata."""

    def __init__(self, watch_paths: List[str]):
        self.watch_paths = [Path(p) for p in watch_paths]
        self._registry = RTSRegistryManager()

    def scan(self) -> List[CatalogEntry]:
        """Scan all watch paths for .rts.png files."""
        entries = []
        for watch_path in self.watch_paths:
            for rts_file in watch_path.rglob("*.rts.png"):
                try:
                    entry = self._create_entry(rts_file)
                    entries.append(entry)
                except Exception as e:
                    logging.warning(f"Failed to scan {rts_file}: {e}")
        return entries

    def _create_entry(self, rts_path: Path) -> CatalogEntry:
        """Create catalog entry from .rts.png file."""
        # Reuse existing registry manager pattern
        metadata = self._extract_metadata(rts_path)
        return CatalogEntry(
            id=self._generate_id(rts_path),
            name=metadata.get("name", rts_path.stem),
            path=str(rts_path),
            size=rts_path.stat().st_size,
            grid_size=metadata.get("grid_size"),
            kernel_version=metadata.get("kernel_version"),
            distro=metadata.get("distro"),
            architecture=metadata.get("architecture"),
            thumbnail_position=(0, 0),  # Will be set by spatial manager
        )
```

### Pattern 2: ThumbnailCache - Thumbnail Generation
**What:** Generate and cache thumbnails at multiple sizes with lazy loading
**When to use:** When serving catalog entries with visual previews
**Example:**
```python
# Pattern from infinite_map_dashboard.py (lines 45-55 for PIL usage)
class ThumbnailCache:
    """Generate and cache thumbnails for .rts.png files."""

    def __init__(self, cache_dir: str = "~/.cache/pixelrts/thumbnails"):
        self.cache_dir = Path(cache_dir).expanduser()
        self.cache_dir.mkdir(parents=True, exist_ok=True)
        self.thumbnail_size = (256, 256)

    def get_thumbnail(self, rts_path: str, size: int = 256) -> ThumbnailResult:
        """Get or generate thumbnail for .rts.png file."""
        cache_key = self._cache_key(rts_path, size)
        cache_file = self.cache_dir / f"{cache_key}.png"

        if cache_file.exists():
            return ThumbnailResult(path=str(cache_file), cached=True)

        # Generate new thumbnail
        with Image.open(rts_path) as img:
            # Create square thumbnail maintaining aspect ratio
            img.thumbnail((size, size), Image.Resampling.LANCZOS)
            img.save(cache_file, "PNG")

        return ThumbnailResult(path=str(cache_file), cached=False)

    def get_thumbnail_base64(self, rts_path: str, size: int = 256) -> str:
        """Get thumbnail as base64 string for JSON API response."""
        result = self.get_thumbnail(rts_path, size)
        with open(result.path, "rb") as f:
            return base64.b64encode(f.read()).decode("utf-8")
```

### Pattern 3: SpatialLayoutManager - Drag-and-Drop Position Management
**What:** Manage spatial positions of catalog entries with drag-and-drop support
**When to use:** When user reorganizes catalog entries spatially
**Example:**
```python
@dataclass
class SpatialPosition:
    """Position in the catalog grid."""
    x: int  # Grid column (0-based)
    y: int  # Grid row (0-based)

class SpatialLayoutManager:
    """Manage spatial arrangement of catalog entries."""

    def __init__(self, layout_file: str = "~/.rts/catalog_layout.json"):
        self.layout_file = Path(layout_file).expanduser()
        self.positions: Dict[str, SpatialPosition] = self._load_layout()

    def move_entry(self, entry_id: str, new_position: SpatialPosition) -> bool:
        """Move entry to new position, handling collisions."""
        if entry_id not in self.positions:
            return False

        # Check for collision - swap if occupied
        for other_id, pos in self.positions.items():
            if other_id != entry_id and pos == new_position:
                # Swap positions
                old_pos = self.positions[entry_id]
                self.positions[other_id] = old_pos
                break

        self.positions[entry_id] = new_position
        self._save_layout()
        return True

    def get_grid_dimensions(self) -> Tuple[int, int]:
        """Get required grid dimensions based on entries."""
        if not self.positions:
            return (4, 4)  # Default 4x4 grid
        max_x = max(p.x for p in self.positions.values())
        max_y = max(p.y for p in self.positions.values())
        return (max_x + 2, max_y + 2)  # Add padding
```

### Pattern 4: CatalogServer - FastAPI Backend
**What:** REST API server for catalog operations with CORS support
**When to use:** Serving catalog data and handling boot requests
**Example:**
```python
# Pattern from systems/pixel_compiler/api/main.py (lines 33-51)
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse, JSONResponse
from fastapi.staticfiles import StaticFiles

app = FastAPI(
    title="PixelRTS Catalog",
    description="Visual catalog for OS containers",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/api/v1/catalog", response_model=CatalogResponse)
async def get_catalog():
    """Get all catalog entries with thumbnails."""
    scanner = CatalogScanner(watch_paths=get_watch_paths())
    entries = scanner.scan()
    thumbnail_cache = ThumbnailCache()

    return {
        "entries": [
            {
                **entry.to_dict(),
                "thumbnail": thumbnail_cache.get_thumbnail_base64(entry.path)
            }
            for entry in entries
        ],
        "layout": spatial_manager.get_layout()
    }

@app.post("/api/v1/catalog/{entry_id}/boot")
async def boot_entry(entry_id: str, options: BootOptions):
    """Boot an OS from catalog with single click."""
    entry = catalog_manager.get_entry(entry_id)
    if not entry:
        raise HTTPException(status_code=404, detail="Entry not found")

    # Use existing BootBridge from Phase 2
    bridge = BootBridge(
        rts_png_path=entry.path,
        memory=options.memory,
        cpus=options.cpus,
        verbose=True
    )
    result = bridge.boot()
    return {"success": result.success, "pid": result.pid}

@app.post("/api/v1/catalog/layout")
async def update_layout(layout: LayoutUpdate):
    """Update spatial layout after drag-and-drop."""
    spatial_manager.move_entry(layout.entry_id, layout.new_position)
    return {"success": True}
```

### Pattern 5: HTML5 Drag-and-Drop Gallery
**What:** Native browser drag-and-drop for spatial reorganization
**When to use:** Frontend catalog gallery UI
**Example:**
```html
<!-- Single-page gallery with native drag-and-drop -->
<!DOCTYPE html>
<html>
<head>
    <title>PixelRTS Catalog</title>
    <style>
        .catalog-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 16px;
            padding: 20px;
        }
        .catalog-entry {
            border: 2px solid #333;
            border-radius: 8px;
            padding: 12px;
            cursor: grab;
            transition: transform 0.2s;
        }
        .catalog-entry:active { cursor: grabbing; }
        .catalog-entry.dragging { opacity: 0.5; transform: scale(0.95); }
        .catalog-entry.drag-over { border-color: #4CAF50; background: #e8f5e9; }
        .catalog-thumbnail { width: 100%; aspect-ratio: 1; object-fit: contain; }
        .catalog-metadata { font-size: 0.85em; color: #666; margin-top: 8px; }
    </style>
</head>
<body>
    <div id="catalog-grid" class="catalog-grid"></div>
    <script>
        let entries = [];
        let draggedEntry = null;

        async function loadCatalog() {
            const response = await fetch('/api/v1/catalog');
            const data = await response.json();
            entries = data.entries;
            renderCatalog();
        }

        function renderCatalog() {
            const grid = document.getElementById('catalog-grid');
            grid.innerHTML = '';
            entries.forEach(entry => {
                const div = document.createElement('div');
                div.className = 'catalog-entry';
                div.draggable = true;
                div.dataset.id = entry.id;
                div.innerHTML = `
                    <img class="catalog-thumbnail" src="data:image/png;base64,${entry.thumbnail}" alt="${entry.name}">
                    <h3>${entry.name}</h3>
                    <div class="catalog-metadata">
                        <div>Kernel: ${entry.kernel_version || 'Unknown'}</div>
                        <div>Distro: ${entry.distro || 'Unknown'}</div>
                    </div>
                    <button onclick="bootEntry('${entry.id}')">Boot</button>
                `;

                // Drag events
                div.addEventListener('dragstart', (e) => {
                    draggedEntry = entry.id;
                    div.classList.add('dragging');
                });
                div.addEventListener('dragend', () => {
                    div.classList.remove('dragging');
                    draggedEntry = null;
                });
                div.addEventListener('dragover', (e) => {
                    e.preventDefault();
                    div.classList.add('drag-over');
                });
                div.addEventListener('dragleave', () => {
                    div.classList.remove('drag-over');
                });
                div.addEventListener('drop', (e) => {
                    e.preventDefault();
                    div.classList.remove('drag-over');
                    if (draggedEntry && draggedEntry !== entry.id) {
                        swapEntries(draggedEntry, entry.id);
                    }
                });

                grid.appendChild(div);
            });
        }

        async function bootEntry(entryId) {
            const response = await fetch(`/api/v1/catalog/${entryId}/boot`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ memory: '2G', cpus: 2 })
            });
            const result = await response.json();
            if (result.success) {
                alert(`Booting... PID: ${result.pid}`);
            }
        }

        async function swapEntries(id1, id2) {
            // Find positions and swap
            const idx1 = entries.findIndex(e => e.id === id1);
            const idx2 = entries.findIndex(e => e.id === id2);
            [entries[idx1], entries[idx2]] = [entries[idx2], entries[idx1]];

            // Persist to server
            await fetch('/api/v1/catalog/layout', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ entry_id: id1, new_position: { x: idx2 % 4, y: Math.floor(idx2 / 4) } })
            });

            renderCatalog();
        }

        loadCatalog();
    </script>
</body>
</html>
```

### Anti-Patterns to Avoid
- **Using external drag-and-drop libraries:** Native HTML5 Drag and Drop API is sufficient for grid rearrangement. Libraries like dnd-kit, Sortable.js add unnecessary complexity and dependencies.
- **Generating thumbnails on every request:** Always cache thumbnails. Use ~/.cache/pixelrts/thumbnails with content-hash filenames.
- **Loading full .rts.png files for display:** The .rts.png may be large (megabytes). Always generate and serve 256x256 or smaller thumbnails.
- **Ignoring layout persistence:** User's spatial arrangement must persist across sessions. Store in ~/.rts/catalog_layout.json.
- **Blocking UI during thumbnail generation:** Generate thumbnails lazily on first access, cache for subsequent requests.

## Don't Hand-Roll

Problems that look simple but have existing solutions:

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Drag-and-drop library | Custom JS drag logic | HTML5 native Drag and Drop API | Zero dependencies, well-tested, works in all modern browsers |
| PNG metadata extraction | Custom PNG parser | PIL Image.open() + img.text (already in rts_registry_manager.py) | Handles PNG chunks correctly, already imported |
| REST API server | Custom HTTP handler | FastAPI with CORSMiddleware (already in api/main.py) | Async, typed, auto docs, CORS pre-configured |
| Registry management | Custom JSON handling | RTSRegistryManager (already exists) | Handles both legacy .rts and .rts.png, checksum verification |
| Boot orchestration | Custom QEMU subprocess | BootBridge from Phase 2 | Already handles FUSE mount + QEMU boot |

**Key insight:** Phase 2 and 3 established infrastructure (BootBridge, RTSRegistryManager, FastAPI patterns) that should be reused. The catalog is primarily a UI layer over existing functionality.

## Common Pitfalls

### Pitfall 1: Large .rts.png Files in Browser
**What goes wrong:** Loading 16MB .rts.png files as img src causes browser slowdown and memory issues
**Why it happens:** .rts.png files are dense binary data visualizations, not optimized images
**How to avoid:** Always generate thumbnails (256x256 max) and serve those. Never serve full .rts.png to browser.
**Warning signs:** Browser tab becomes sluggish, network tab shows multi-MB image transfers

### Pitfall 2: Layout Not Persisting
**What goes wrong:** User's spatial arrangement is lost on page refresh
**Why it happens:** Layout stored only in browser memory or not saved to server
**How to avoid:** Persist layout to ~/.rts/catalog_layout.json after every drag operation. Load on page init.
**Warning signs:** Refreshing page resets catalog to default order

### Pitfall 3: Catalog Not Refreshing When Files Added
**What goes wrong:** New .rts.png files don't appear in catalog without server restart
**Why it happens:** Catalog scanned only at startup
**How to avoid:** Implement polling (simple) or filesystem watching (better) to detect new files. API endpoint for manual refresh.
**Warning signs:** Added .rts.png files don't show up in catalog

### Pitfall 4: Boot Without Verification
**What goes wrong:** Corrupted .rts.png boots and crashes QEMU
**Why it happens:** Skipping hash verification for speed
**How to avoid:** Always call BootBridge which verifies integrity. Reuse PixelRTSDecoder.verify_hash().
**Warning signs:** Boot fails with cryptic QEMU errors

### Pitfall 5: CORS Blocking API Requests
**What goes wrong:** Frontend can't call API due to CORS errors
**Why it happens:** FastAPI CORS middleware not configured
**How to avoid:** Copy CORS middleware pattern from api/main.py (lines 42-48) - allow_origins=["*"], allow_methods=["*"], allow_headers=["*"]
**Warning signs:** Browser console shows CORS policy errors

## Code Examples

Verified patterns from existing codebase:

### Reusing RTSRegistryManager (from rts_registry_manager.py)
```python
# Source: systems/pixel_compiler/rts_registry_manager.py lines 177-342
from systems.pixel_compiler.rts_registry_manager import RTSRegistryManager

# Register a .rts.png file (extracts metadata from PNG)
manager = RTSRegistryManager()
cartridge_id = manager.register("/path/to/alpine.rts.png")

# Get cartridge metadata
cartridge = manager.get(cartridge_id)
# cartridge contains: id, name, type, path, size, pixelrts.grid_size, etc.

# List all cartridges
cartridges = manager.list()
```

### FastAPI with CORS (from api/main.py)
```python
# Source: systems/pixel_compiler/api/main.py lines 33-51
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="PixelRTS Catalog",
    version="1.0.0",
    docs_url="/docs"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

### Boot with BootBridge (from boot_bridge.py)
```python
# Source: systems/pixel_compiler/boot/boot_bridge.py
from systems.pixel_compiler.boot import BootBridge

# One-click boot (Phase 2 pattern)
bridge = BootBridge(
    rts_png_path=entry.path,
    memory="2G",
    cpus=2,
    verbose=True
)

with bridge:
    result = bridge.boot()
    if result.success:
        print(f"Booted! PID: {result.pid}, VNC: :{result.vnc_port}")
```

### HTML5 Drag and Drop (from Auto-Claude UI pattern)
```javascript
// Source: Auto-Claude/auto-claude-ui/src/renderer/components/SortableTaskCard.tsx
// Native browser equivalent (no dnd-kit dependency needed)

element.draggable = true;
element.addEventListener('dragstart', (e) => {
    e.dataTransfer.setData('text/plain', entryId);
    element.classList.add('dragging');
});
element.addEventListener('dragover', (e) => {
    e.preventDefault();  // Required to allow drop
    element.classList.add('drag-over');
});
element.addEventListener('drop', (e) => {
    e.preventDefault();
    const draggedId = e.dataTransfer.getData('text/plain');
    handleSwap(draggedId, targetId);
});
```

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| External drag-drop libs (jQuery UI, Sortable) | HTML5 native Drag and Drop | ~2020 browser support | Zero dependencies, better touch support |
| Server-side HTML rendering | Client-side with REST API | Phase 1-3 established pattern | Faster updates, better UX |
| Custom thumbnail generation | PIL with LANCZOS resampling | Already in codebase | High-quality thumbnails |
| File scanning on demand | Cached registry + watch | RTSRegistryManager pattern | Instant catalog load |

**Deprecated/outdated:**
- jQuery UI Sortable: Use native HTML5 Drag and Drop instead
- Server-side template rendering: Use REST API + client-side rendering (matches existing dashboard patterns)
- Custom PNG parsing: Use PIL Image.text for metadata (already in registry manager)

## Open Questions

Things that couldn't be fully resolved:

1. **Filesystem Watching vs Polling**
   - What we know: Polling is simple but inefficient; inotify/watchdog is efficient but adds dependency
   - What's unclear: Whether to use watchdog library or implement simple polling
   - Recommendation: Start with polling (every 30s) for simplicity. Add watchdog in enhancement phase if needed.

2. **Multi-Directory Catalogs**
   - What we know: User may have .rts.png files in multiple directories
   - What's unclear: How to configure watch paths (env var, config file, CLI args)
   - Recommendation: Use RTS_REGISTRY_PATH env var pattern from rts_registry_manager.py (lines 20-28). Allow comma-separated paths.

3. **Thumbnail Size Trade-offs**
   - What we know: Smaller thumbnails load faster but less detail visible
   - What's unclear: Optimal thumbnail size for catalog view
   - Recommendation: Generate 256x256 by default. Support 128x128 for compact view via API parameter.

4. **Grid vs Free-form Layout**
   - What we know: Grid is simpler to implement; free-form allows more flexibility
   - What's unclear: User preference for spatial arrangement
   - Recommendation: Start with grid layout (snap to grid). Free-form is a future enhancement.

## Sources

### Primary (HIGH confidence)
- `systems/pixel_compiler/rts_registry_manager.py` - Registry management, PNG metadata extraction
- `systems/pixel_compiler/boot/boot_bridge.py` - BootBridge for one-click boot
- `systems/pixel_compiler/api/main.py` - FastAPI with CORS middleware pattern
- `systems/pixel_compiler/web_server.py` - aiohttp WebSocket server pattern
- `systems/pixel_compiler/infinite_map_dashboard.py` - Dashboard with PIL image handling
- `.planning/phases/02-fuse-bridge/02-VERIFICATION.md` - Phase 2 verification (36/36 tests pass)
- `.planning/phases/03-visual-installer-engine/03-VERIFICATION.md` - Phase 3 verification (28/28 tests pass)

### Secondary (MEDIUM confidence)
- `systems/visual_shell/web/webmcp_bridge.js` - WebMCP tools pattern
- `Auto-Claude/auto-claude-ui/src/renderer/components/SortableTaskCard.tsx` - dnd-kit drag pattern (concepts reusable with native API)
- `systems/visual_shell/web/improvement_dashboard.html` - HTML dashboard pattern
- `.planning/STATE.md` - Project decisions and phase status
- `.planning/ROADMAP.md` - Phase 4 success criteria

### Tertiary (LOW confidence)
- None - all findings verified against existing codebase

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH - All components already in use (FastAPI, PIL, aiohttp, RTSRegistryManager, BootBridge)
- Architecture: HIGH - Patterns from existing dashboard and API code
- Pitfalls: HIGH - Derived from codebase analysis and common web gallery issues

**Research date:** 2026-02-15
**Valid until:** 30 days - Stack is stable, patterns from completed phases
