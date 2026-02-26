# WorldView OpenStreetMap Integration Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Replace the synthetic wireframe globe with real OpenStreetMap data while maintaining the Geometry OS aesthetic (green terminal look) and preserving the Tectonic Node + Memory Tapestry functionality.

**Architecture:** Use Leaflet.js as a lightweight map renderer, overlay a custom CSS/SVG filter to apply the Geometry OS "green phosphor" aesthetic, and integrate with the existing WorldViewOrchestrator for Tectonic Node placement. Support offline mode via a local tile cache.

**Tech Stack:** Leaflet.js, OpenStreetMap tiles (with local cache option), CSS filters, existing WorldViewOrchestrator

---

## Prerequisites

- Existing `demo_synthetic_worldview.html` with Tectonic Nodes
- Existing `WorldViewOrchestrator.js`
- Internet connection for initial tile fetch (or pre-cached tiles)

---

### Task 1: Create Base OSM WorldView HTML

**Files:**
- Create: `systems/visual_shell/web/demo_worldview_osm.html`

**Step 1: Create the HTML structure with Leaflet**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Geometry OS - OpenStreetMap WorldView</title>
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }

    body {
      background: #000;
      font-family: 'Courier New', monospace;
      overflow: hidden;
    }

    /* Geometry OS Aesthetic Filter */
    #map-container {
      position: relative;
      width: 100vw;
      height: 100vh;
    }

    #map {
      width: 100%;
      height: 100%;
      /* Apply green phosphor effect via CSS filter */
      filter:
        sepia(100%)
        hue-rotate(70deg)
        saturate(300%)
        brightness(0.7)
        contrast(1.2);
    }

    /* Scanline overlay */
    #scanlines {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      background: repeating-linear-gradient(
        0deg,
        rgba(0, 0, 0, 0.15) 0px,
        rgba(0, 0, 0, 0.15) 1px,
        transparent 1px,
        transparent 3px
      );
      z-index: 1000;
    }

    /* Vignette effect */
    #vignette {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      background: radial-gradient(ellipse at center, transparent 40%, rgba(0,0,0,0.8) 100%);
      z-index: 999;
    }

    /* HUD Overlay */
    #ui-overlay {
      position: absolute;
      top: 20px;
      left: 20px;
      z-index: 1001;
      background: rgba(0, 15, 0, 0.9);
      border: 2px solid #00FF00;
      padding: 20px;
      color: #00FF00;
      min-width: 280px;
      pointer-events: none;
      box-shadow: 0 0 20px rgba(0, 255, 0, 0.3);
    }

    .hud-title {
      font-size: 20px;
      font-weight: bold;
      border-bottom: 2px solid #00FF00;
      margin-bottom: 10px;
      text-shadow: 0 0 10px #00FF00;
    }

    .status {
      font-size: 14px;
      margin: 5px 0;
    }

    .node-item {
      font-size: 12px;
      color: #00AA00;
      margin-left: 10px;
      padding-left: 10px;
      border-left: 1px solid #004400;
    }

    .pulse-high { color: #00FF00; font-weight: bold; text-shadow: 0 0 5px #00FF00; }
    .pulse-low { color: #004400; }

    /* Tectonic Node Markers */
    .tectonic-marker {
      background: rgba(0, 255, 0, 0.8);
      border: 2px solid #00FF00;
      border-radius: 50%;
      width: 16px;
      height: 16px;
      box-shadow: 0 0 15px #00FF00;
    }

    .tectonic-marker-pulse {
      position: absolute;
      border: 2px solid #00FF00;
      border-radius: 50%;
      animation: pulse 2s infinite;
    }

    @keyframes pulse {
      0% { transform: scale(1); opacity: 1; }
      100% { transform: scale(3); opacity: 0; }
    }

    .tectonic-label {
      font-family: 'Courier New', monospace;
      font-size: 11px;
      font-weight: bold;
      color: #00FF00;
      background: rgba(0, 15, 0, 0.9);
      padding: 2px 6px;
      border: 1px solid #00FF00;
      white-space: nowrap;
    }
  </style>
</head>
<body>
  <div id="map-container">
    <div id="map"></div>
    <div id="scanlines"></div>
    <div id="vignette"></div>
  </div>

  <div id="ui-overlay">
    <div class="hud-title">TECTONIC WORLDVIEW [OSM]</div>
    <div class="status">SUBSTRATE: OPENSTREETMAP</div>
    <div class="status">ACTIVE KERNELS: <span id="kernel-count">0</span></div>
    <div class="status">TOTAL LOAD: <span id="total-load">0.0%</span></div>
    <div class="status">COORDS: <span id="coords">0.00, 0.00</span></div>
    <div id="kernel-list"></div>
  </div>

  <script type="module">
    // WorldView OSM initialization
    // Will be implemented in subsequent tasks
    console.log('🌍 WorldView OSM Initializing...');
  </script>
</body>
</html>
```

**Step 2: Verify HTML renders**

Run: Open `systems/visual_shell/web/demo_worldview_osm.html` in browser
Expected: Dark screen with HUD overlay, scanlines, and vignette effect visible

**Step 3: Commit**

```bash
git add systems/visual_shell/web/demo_worldview_osm.html
git commit -m "feat(worldview): create base OSM WorldView HTML with Geometry OS aesthetic"
```

---

### Task 2: Initialize Leaflet Map with OSM Tiles

**Files:**
- Modify: `systems/visual_shell/web/demo_worldview_osm.html`

**Step 1: Add Leaflet initialization script**

Replace the empty script block with:

```html
<script type="module">
  import { WorldViewOrchestrator } from './WorldViewOrchestrator.js';

  // Initialize Leaflet map
  const map = L.map('map', {
    center: [30.2747, -97.7403], // Texas State Capitol (Geometry OS HQ)
    zoom: 4,
    zoomControl: false,
    attributionControl: false
  });

  // Add OSM tile layer
  const osmLayer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    subdomains: ['a', 'b', 'c']
  });
  osmLayer.addTo(map);

  // Update coordinates display
  map.on('mousemove', (e) => {
    document.getElementById('coords').textContent =
      `${e.latlng.lat.toFixed(4)}, ${e.latlng.lng.toFixed(4)}`;
  });

  // Expose map globally for orchestrator
  window.worldViewMap = map;

  console.log('🗺️ Leaflet map initialized with OSM tiles');
</script>
```

**Step 2: Verify map loads**

Run: Refresh `demo_worldview_osm.html`
Expected: OpenStreetMap tiles load with green phosphor filter applied

**Step 3: Commit**

```bash
git add systems/visual_shell/web/demo_worldview_osm.html
git commit -m "feat(worldview): add Leaflet map with OSM tiles and coordinate tracking"
```

---

### Task 3: Create Tectonic Node Marker System

**Files:**
- Modify: `systems/visual_shell/web/demo_worldview_osm.html`

**Step 1: Add marker creation function**

Add after the map initialization:

```javascript
// --- TECTONIC NODE MARKER SYSTEM ---
const tectonicMarkers = new Map();

window.addTectonicNode = (node) => {
  // Create custom icon
  const icon = L.divIcon({
    className: 'tectonic-marker-container',
    html: `
      <div class="tectonic-marker"></div>
      <div class="tectonic-marker-pulse" style="width:16px;height:16px;"></div>
      <div class="tectonic-label">${node.name}</div>
    `,
    iconSize: [16, 16],
    iconAnchor: [8, 8]
  });

  // Create marker
  const marker = L.marker([node.lat, node.lon], { icon }).addTo(map);

  // Add click handler for memory tapestry zoom
  marker.on('click', () => {
    if (window.orchestrator) {
      window.orchestrator.zoomInto(node.id);
    }
  });

  // Store reference
  tectonicMarkers.set(node.id, {
    node,
    marker,
    pulseIntensity: 0
  });

  updateHUD();
  console.log(`📍 Tectonic node placed: ${node.name} at (${node.lat}, ${node.lon})`);
};

window.updateTectonicNode = (id, load) => {
  const entry = tectonicMarkers.get(id);
  if (entry) {
    entry.node.load = load;
    // Update pulse intensity based on load
    const pulseEl = entry.marker.getElement()?.querySelector('.tectonic-marker-pulse');
    if (pulseEl) {
      pulseEl.style.animationDuration = `${2 - load * 1.5}s`; // Faster pulse = higher load
    }
  }
};

function updateHUD() {
  document.getElementById('kernel-count').textContent = tectonicMarkers.size;

  const loads = Array.from(tectonicMarkers.values()).map(e => e.node.load || 0);
  const avgLoad = loads.length > 0
    ? (loads.reduce((a, b) => a + b, 0) / loads.length * 100).toFixed(1)
    : '0.0';
  document.getElementById('total-load').textContent = `${avgLoad}%`;

  const list = document.getElementById('kernel-list');
  list.innerHTML = Array.from(tectonicMarkers.values()).map(e => `
    <div class="node-item">
      ${e.node.name}:
      <span class="${(e.node.load || 0) > 0.7 ? 'pulse-high' : 'pulse-low'}">
        ${((e.node.load || 0) * 100).toFixed(0)}% LOAD
      </span>
    </div>
  `).join('');
}
```

**Step 2: Verify markers work**

Run: Refresh page, check console
Expected: No errors, marker functions available globally

**Step 3: Commit**

```bash
git add systems/visual_shell/web/demo_worldview_osm.html
git commit -m "feat(worldview): add Tectonic Node marker system with pulse animation"
```

---

### Task 4: Connect WorldViewOrchestrator

**Files:**
- Modify: `systems/visual_shell/web/demo_worldview_osm.html`

**Step 1: Add orchestrator initialization and mock GPU system**

Add after the marker system:

```javascript
// --- ORCHESTRATOR BRIDGE ---
const mockGPUSystem = {
  readState: async (id) => ({
    halted: false,
    cycleCount: Date.now()
  }),
  readMemory: async (id, addr, size) => {
    const buf = new Uint32Array(size / 4);
    for (let i = 0; i < buf.length; i++) {
      buf[i] = Math.random() > 0.95 ? 0xFFFFFFFF : (Math.random() * 0x00FFFFFF);
    }
    return buf;
  }
};

const orchestrator = new WorldViewOrchestrator(mockGPUSystem, null);
window.orchestrator = orchestrator;

// Register initial kernels (same as synthetic version)
orchestrator.registerKernel('linux_alpine_sf', {
  name: 'ALPINE-X86-SF',
  lat: 37.7749,
  lon: -122.4194
});
orchestrator.registerKernel('linux_ubuntu_lon', {
  name: 'UBUNTU-ARM-LDN',
  lat: 51.5074,
  lon: -0.1278
});
orchestrator.registerKernel('hypervisor_core_tok', {
  name: 'GOS-CORE-TYO',
  lat: 35.6762,
  lon: 139.6503
});

// Sync loop (10Hz)
setInterval(() => {
  if (orchestrator) orchestrator.sync();
}, 100);
```

**Step 2: Verify nodes appear on map**

Run: Refresh page
Expected: Three markers appear at San Francisco, London, and Tokyo with pulsing animations

**Step 3: Commit**

```bash
git add systems/visual_shell/web/demo_worldview_osm.html
git commit -m "feat(worldview): connect WorldViewOrchestrator with mock GPU system"
```

---

### Task 5: Add Memory Tapestry Overlay

**Files:**
- Modify: `systems/visual_shell/web/demo_worldview_osm.html`

**Step 1: Add tapestry container and rendering**

Add CSS for tapestry:

```css
/* Memory Tapestry Overlay */
#tapestry-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 5, 0, 0.95);
  z-index: 2000;
  display: none;
}

#tapestry-canvas {
  display: block;
  margin: 80px auto;
  border: 2px solid #00FF00;
  box-shadow: 0 0 30px rgba(0, 255, 0, 0.5);
}

#tapestry-title {
  position: absolute;
  top: 20px;
  left: 40px;
  font-size: 24px;
  font-weight: bold;
  color: #00FF00;
  text-shadow: 0 0 10px #00FF00;
}

#tapestry-close {
  position: absolute;
  top: 20px;
  right: 40px;
  font-size: 18px;
  color: #00FF00;
  cursor: pointer;
  padding: 10px;
  border: 1px solid #00FF00;
}

#tapestry-close:hover {
  background: rgba(0, 255, 0, 0.2);
}
```

Add HTML for tapestry:

```html
<div id="tapestry-overlay">
  <div id="tapestry-title">MEMORY TAPESTRY</div>
  <div id="tapestry-close">[ CLOSE ]</div>
  <canvas id="tapestry-canvas" width="512" height="512"></canvas>
</div>
```

Add JavaScript for tapestry rendering:

```javascript
// --- MEMORY TAPESTRY RENDERER ---
const tapestryOverlay = document.getElementById('tapestry-overlay');
const tapestryCanvas = document.getElementById('tapestry-canvas');
const tapestryTitle = document.getElementById('tapestry-title');
const tapestryClose = document.getElementById('tapestry-close');
const tapestryCtx = tapestryCanvas.getContext('2d');

tapestryClose.addEventListener('click', () => {
  tapestryOverlay.style.display = 'none';
});

window.showMemoryTapestry = (id, buffer) => {
  const entry = tectonicMarkers.get(id);
  if (entry) {
    tapestryTitle.textContent = `MEMORY TAPESTRY: ${entry.node.name}`;
  }

  const size = 512;
  const imgData = tapestryCtx.createImageData(size, size);
  const view = new Uint32Array(buffer.buffer);

  for (let i = 0; i < Math.min(view.length, size * size); i++) {
    const val = view[i];
    const r = (val & 0xFF);
    const g = ((val >> 8) & 0xFF) || 128; // Green tint
    const b = ((val >> 16) & 0xFF);

    const x = i % size;
    const y = Math.floor(i / size);
    const idx = (y * size + x) * 4;

    imgData.data[idx] = r;
    imgData.data[idx + 1] = g;
    imgData.data[idx + 2] = b;
    imgData.data[idx + 3] = 255;
  }

  tapestryCtx.putImageData(imgData, 0, 0);
  tapestryOverlay.style.display = 'block';
};
```

**Step 2: Verify tapestry zoom works**

Run: Refresh page, click on a marker
Expected: Memory tapestry overlay appears with colorful memory visualization

**Step 3: Commit**

```bash
git add systems/visual_shell/web/demo_worldview_osm.html
git commit -m "feat(worldview): add Memory Tapestry overlay for zoom-to-memory"
```

---

### Task 6: Add Offline Tile Cache Support

**Files:**
- Create: `systems/visual_shell/web/osm_tile_cache.py`
- Modify: `systems/visual_shell/web/demo_worldview_osm.html`

**Step 1: Create Python tile cache script**

```python
#!/usr/bin/env python3
"""
Geometry OS - OSM Tile Cache
Downloads and caches OpenStreetMap tiles for offline use.
"""

import os
import requests
import time
from pathlib import Path

TILE_DIR = Path(__file__).parent / "tiles"
BASE_URL = "https://tile.openstreetmap.org"

# Default coverage: World overview + US detail
TILE_RANGES = {
    # Zoom 0-4: Full world
    0: [(0, 0, 1, 1)],
    1: [(0, 0, 2, 2)],
    2: [(0, 0, 4, 4)],
    3: [(0, 0, 8, 8)],
    4: [(0, 0, 16, 16)],
    # Zoom 5-8: North America
    5: [(0, 2, 8, 8)],
    6: [(2, 4, 16, 16)],
    7: [(4, 9, 32, 28)],
    8: [(8, 18, 64, 56)],
}

def download_tile(z, x, y, retry=3):
    """Download a single tile."""
    url = f"{BASE_URL}/{z}/{x}/{y}.png"
    tile_path = TILE_DIR / str(z) / str(x) / f"{y}.png"

    if tile_path.exists():
        return True

    tile_path.parent.mkdir(parents=True, exist_ok=True)

    for attempt in range(retry):
        try:
            resp = requests.get(url, headers={'User-Agent': 'GeometryOS-WorldView/1.0'}, timeout=10)
            if resp.status_code == 200:
                tile_path.write_bytes(resp.content)
                print(f"✓ {z}/{x}/{y}")
                return True
        except Exception as e:
            print(f"✗ {z}/{x}/{y}: {e}")
            time.sleep(1)

    return False

def cache_tiles():
    """Download all tiles in configured ranges."""
    TILE_DIR.mkdir(exist_ok=True)

    total = 0
    success = 0

    for z, ranges in TILE_RANGES.items():
        for x1, y1, x2, y2 in ranges:
            for x in range(x1, x2):
                for y in range(y1, y2):
                    total += 1
                    if download_tile(z, x, y):
                        success += 1
                    time.sleep(0.1)  # Rate limit

    print(f"\nCached {success}/{total} tiles")

if __name__ == "__main__":
    print("🌍 Geometry OS - Caching OSM tiles...")
    cache_tiles()
```

**Step 2: Make script executable and run**

Run: `chmod +x systems/visual_shell/web/osm_tile_cache.py && python3 systems/visual_shell/web/osm_tile_cache.py`
Expected: Tiles download to `systems/visual_shell/web/tiles/`

**Step 3: Add local tile server option in HTML**

Add to the map initialization, before the OSM layer:

```javascript
// Try local tiles first, fallback to online
const localTileUrl = './tiles/{z}/{x}/{y}.png';
let tileLayer;

// Check if local tiles exist
fetch('./tiles/0/0/0.png').then(r => {
  if (r.ok) {
    console.log('📁 Using local tile cache');
    tileLayer = L.tileLayer(localTileUrl, { maxZoom: 8 });
  } else {
    console.log('🌐 Using online OSM tiles');
    tileLayer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      subdomains: ['a', 'b', 'c']
    });
  }
  tileLayer.addTo(map);
}).catch(() => {
  // Offline mode - use online tiles
  tileLayer = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    subdomains: ['a', 'b', 'c']
  });
  tileLayer.addTo(map);
});
```

**Step 4: Commit**

```bash
git add systems/visual_shell/web/osm_tile_cache.py systems/visual_shell/web/demo_worldview_osm.html
git commit -m "feat(worldview): add offline tile cache support for sovereign operation"
```

---

## Verification Checklist

After completing all tasks:

- [ ] `demo_worldview_osm.html` loads with green phosphor aesthetic
- [ ] Leaflet map displays OpenStreetMap tiles
- [ ] Three Tectonic Nodes appear at SF, London, Tokyo
- [ ] Nodes pulse with animation tied to load
- [ ] Clicking a node opens Memory Tapestry overlay
- [ ] HUD shows kernel count and load percentages
- [ ] Tile cache script can download tiles for offline use
- [ ] Map falls back to local tiles when available

## Future Enhancements

- **Phase 2:** Connect to real GPUExecutionSystem instead of mock
- **Phase 3:** Add Hilbert-curve memory visualization in tapestry
- **Phase 4:** Add satellite imagery layer with same aesthetic filter
- **Phase 5:** Real-time process spawning creates new markers

---

*Plan created: 2026-02-25*
*Related: `docs/plans/2026-02-25-spatial-mmu-dual-path-design.md`*
