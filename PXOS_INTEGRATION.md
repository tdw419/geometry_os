# pxOS + Memory Palace Integration Guide

## Can pxOS help? YES.

pxOS (Pixel Operating System) is a reactive formula engine that can render circles, text, bars, and more from data cells. It's perfect for visualizing the Memory Palace.

## What pxOS Gives Us

### Built-in Drawing Primitives
```
CIRCLE(col, row, radius, color, filled)  → Draw circles (rings, dots)
TEXT(col, row, value)                     → Draw text labels
BOX(col, row, w, h)                       → Draw boxes
LINE(col, row, len, dir, color)          → Draw lines
GAUGE(col, row, val, r, color)           → Draw gauges
```

### Reactive System
- When you POST new cells, pxOS auto-renders
- No manual refresh needed
- Perfect for watch mode

### Outputs
- PNG images (shareable)
- Browser viewer (live dashboard)
- HTTP API (integration)

### No Assembly Needed
- Features like labels, animations, click inspection
- Just change formulas, not assembly code

---

## Integration Architecture

```
You
  ↓
memory_palace.py (add facts)
  ↓
memory_palace_facts.json
  ↓
pxos_palace_bridge.py (read facts → post cells)
  ↓
pxOS server (reactive rendering)
  ↓
  • PNG output (memory_palace_pxos.png)
  • Browser viewer (http://localhost:3839/viewer)
  • HTTP API (curl http://localhost:3839/api/v1/render)
```

---

## Implementation Options

### Option 1: Full pxOS Server (Recommended)

**Pros:**
- Reactive auto-updates
- Browser viewer for live dashboard
- HTTP API for integration
- Multi-client support

**Cons:**
- Need to run pxOS server
- More moving parts

**Steps:**

1. Start pxOS server:
   ```bash
   cd /home/jericho/zion/projects/ascii_world/ascii_world
   node bin/pxos-server.js
   ```

2. Use the bridge script:
   ```bash
   python3 pxos_palace_bridge.py              # One-time render
   python3 pxos_palace_bridge.py watch        # Auto-reload on changes
   ```

3. View results:
   ```bash
   # PNG
   xdg-open memory_palace_pxos.png

   # Browser
   open http://localhost:3839/viewer/viewer.html

   # API
   curl http://localhost:3839/api/v1/render -o palace.png
   ```

---

### Option 2: Direct Node.js Rendering

**Pros:**
- No server needed
- Simpler, standalone
- Direct PNG output

**Cons:**
- No reactive updates
- No browser viewer
- Must re-run to see changes

**Steps:**

```bash
python3 pxos_palace_render.py    # Direct render to PNG
xdg-open memory_palace_pxos.png
```

---

## Files Created

### pxos_palace_bridge.py
Full pxOS server integration with:
- Reactive cell updates
- Template setup (formulas for rings, dots, text)
- PNG export
- Watch mode (auto-reload on file changes)

### pxos_palace_render.py
Direct Node.js rendering with:
- No server needed
- Standalone PNG generation
- Simpler setup

---

## Comparison: GeOS Assembly vs pxOS

| Feature | GeOS Assembly | pxOS Formulas |
|---------|---------------|---------------|
| **Rendering** | Write assembly opcodes | Use CIRCLE(), TEXT() |
| **Labels** | Need DRAWTEXT opcode | TEXT() built-in |
| **Animation** | Write ASM loops | Formula updates |
| **Click detection** | MOUSECLICK opcode | Not built-in |
| **Auto-reload** | Poll RAM every 500 frames | Reactive cells |
| **PNG export** | Screenshot framebuffer | toPNG() API |
| **Browser viewer** | No | Yes (HTML viewer) |
| **HTTP API** | Socket commands only | REST API |
| **Multi-user** | Single VM | Multiple clients |
| **Iteration speed** | Slow (compile + run) | Fast (POST cells) |

---

## When to Use Each

### Use GeOS Assembly When:
- You need pixel-perfect control
- You're already deep in GeOS ecosystem
- You want to program "inside" the palace
- You need custom rendering algorithms
- Click inspection inside GeOS window

### Use pxOS When:
- You want quick iteration
- You need browser viewer
- You want PNG export for sharing
- You need HTTP API for integration
- You don't want to write assembly
- You want reactive auto-updates

---

## Future: Hybrid Approach

You could use BOTH:

1. **GeOS** for the core palace (spatial computing environment)
2. **pxOS** for external viewers (PNG exports, browser dashboard)

```
memory_palace_facts.json
  ↓
  ├─→ GeOS VM (assembly, autonomous)
  │    └─→ 256×256 framebuffer
  │
  └─→ pxOS Bridge (reactive rendering)
       └─→ PNG, browser viewer, API
```

**Benefits:**
- Palace runs autonomously in GeOS
- Export views via pxOS for sharing
- Best of both worlds

---

## Quick Start

### Try pxOS Now:

```bash
# Option 1: Full server
cd /home/jericho/zion/projects/ascii_world/ascii_world
node bin/pxos-server.js &  # Start server
cd ~/projects/zion/projects/geometry_os/geometry_os
python3 pxos_palace_bridge.py watch

# Option 2: Direct render (no server)
python3 pxos_palace_render.py
```

### Add a Fact:

```bash
./memory_palace.py add critical "New Insight" "Important discovery"
python3 pxos_palace_bridge.py  # Re-render
```

---

## What This Enables

With pxOS, you can:

1. **Add labels instantly** - No DRAWTEXT opcode needed
2. **Animate rings** - Update angle cells, pxOS auto-renders
3. **Export as PNG** - Share your palace
4. **View in browser** - Live dashboard
5. **Integrate with other tools** - HTTP API
6. **Prototype fast** - Change formulas, see results immediately

The palace becomes a reactive, shareable visual environment - not just a GeOS VM window.

---

## Decision Point

**Do you want:**
- A. Try pxOS integration now (reactive, browser viewer)
- B. Stick with GeOS assembly (spatial computing purity)
- C. Hybrid approach (both, for different use cases)

Either way, the files are ready. Your move.