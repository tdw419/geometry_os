# WebMCP Bridge Verification Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Verify the WebMCP Bridge correctly exposes Geometry OS capabilities as structured WebMCP tools for AI agents.

**Architecture:** Event-Driven Bridge listens for `geometry-os-ready` event, registers 4 Core tools via `navigator.modelContext`, publishes OS context, and silently falls back if WebMCP unavailable.

**Tech Stack:** JavaScript (ES6+), WebMCP API (Chrome 146+), PixiJS v8

---

## Prerequisites

- Chrome 146+ (or Chromium with WebMCP flag enabled)
- Geometry OS Visual Shell running at `http://localhost:8080` or file server
- DevTools console access

---

### Task 1: Verify Script Loading

**Files:**
- Verify: `systems/visual_shell/web/index.html`
- Verify: `systems/visual_shell/web/webmcp_bridge.js`

**Step 1: Start a local server**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os/systems/visual_shell/web
python3 -m http.server 8080
```

Expected: Server running on port 8080

**Step 2: Open in Chrome 146+ and check console**

Navigate to: `http://localhost:8080/index.html`

Open DevTools (F12) → Console tab

Expected output:
```
📡 WebMCP Bridge loaded — "The Screen is the Hard Drive, and now the API surface."
🔌 WebMCP: API detected — waiting for Geometry OS initialization...
🚀 Initializing Geometry OS (Web Kernel)...
✅ Geometry OS initialized at Antigravity Prime
🔌 WebMCP: Registering Geometry OS tools...
🔌 WebMCP: ✅ 4 tools registered:
   • navigate_map
   • get_os_state
   • execute_pixel_program
   • load_rts_cartridge
🔌 WebMCP: Context published successfully
```

**Step 3: Verify fallback in non-WebMCP browser**

Open in Firefox or Chrome <146.

Expected output:
```
📡 WebMCP Bridge loaded — "The Screen is the Hard Drive, and now the API surface."
🔌 WebMCP: Not available (Chrome 146+ required). Visual Shell running in standard mode.
```

Verify: No errors, app loads normally.

---

### Task 2: Verify Bridge Status API

**Files:**
- Test: `systems/visual_shell/web/webmcp_bridge.js:726-735`

**Step 1: Check bridge status in DevTools console**

In Chrome 146+ DevTools console:

```javascript
window.webmcpBridge.getStatus()
```

Expected output:
```javascript
{
  available: true,
  registered: true,
  tools: ['navigate_map', 'get_os_state', 'execute_pixel_program', 'load_rts_cartridge'],
  totalCalls: 0,
  callBreakdown: {},
  appConnected: true
}
```

**Step 2: Verify in non-WebMCP browser**

```javascript
window.webmcpBridge.getStatus()
```

Expected output:
```javascript
{
  available: false,
  registered: false,
  tools: [],
  totalCalls: 0,
  callBreakdown: {},
  appConnected: false
}
```

---

### Task 3: Test navigate_map Tool

**Files:**
- Test: `systems/visual_shell/web/webmcp_bridge.js:114-216`

**Step 1: Navigate to named region**

In Chrome 146+ DevTools console:

```javascript
navigator.modelContext.callTool('navigate_map', { region: 'antigravity_prime' })
```

Expected output:
```javascript
{
  success: true,
  camera: { x: 819200, y: 819200, zoom: 0.5 },
  visibleBounds: { left: ..., top: ..., right: ..., bottom: ... },
  region: 'antigravity_prime'
}
```

Verify: The viewport pans to the cognitive layer (cyan circle at Antigravity Prime).

**Step 2: Navigate to custom coordinates**

```javascript
navigator.modelContext.callTool('navigate_map', { x: 100, y: 200, zoom: 2.0 })
```

Expected output:
```javascript
{
  success: true,
  camera: { x: 10000, y: 20000, zoom: 2.0 },
  visibleBounds: { ... },
  region: 'custom'
}
```

**Step 3: Verify call count incremented**

```javascript
window.webmcpBridge.getStatus().callBreakdown
```

Expected:
```javascript
{ navigate_map: 2 }
```

---

### Task 4: Test get_os_state Tool

**Files:**
- Test: `systems/visual_shell/web/webmcp_bridge.js:222-350`

**Step 1: Get full OS state**

```javascript
navigator.modelContext.callTool('get_os_state', { include: ['all'] })
```

Expected output includes:
```javascript
{
  os: 'Geometry OS',
  paradigm: 'The Screen is the Hard Drive',
  timestamp: '2026-02-12T...',
  webmcp: { toolsRegistered: 4, totalCalls: ..., callBreakdown: {...} },
  camera: { x: ..., y: ..., zoom: ..., gridX: ..., gridY: ... },
  windows: { count: 1, list: [...] },
  subsystems: {
    viewport: true,
    infiniteMap: true/false,
    computeSystem: true/false,
    windowManager: true,
    ...
  },
  performance: { fps: 60, renderer: 'WebGL', ... }
}
```

**Step 2: Get camera state only**

```javascript
navigator.modelContext.callTool('get_os_state', { include: ['camera'] })
```

Expected: Only `os`, `timestamp`, `webmcp`, and `camera` fields present.

---

### Task 5: Test load_rts_cartridge Tool

**Files:**
- Test: `systems/visual_shell/web/webmcp_bridge.js:522-663`

**Step 1: Create a minimal test RTS PNG**

Create a small test image or use an existing `.rts.png` file.

**Step 2: Load the cartridge**

```javascript
navigator.modelContext.callTool('load_rts_cartridge', {
  url: '/builder/test.rts.png',
  position: { x: 5, y: 5 },
  autoNavigate: true
})
```

Expected output:
```javascript
{
  success: true,
  url: '/builder/test.rts.png',
  dimensions: '100x100',
  pixelCount: 10000,
  byteCount: 40000,
  sha256: 'a1b2c3...',
  uniqueColors: 1500,
  position: { x: 500, y: 500 },
  gridPosition: { x: 5, y: 5 },
  scale: ...
}
```

Verify:
- Sprite appears on the infinite map at grid position (5, 5)
- Viewport auto-navigated to show the loaded cartridge

**Step 3: Test error handling**

```javascript
navigator.modelContext.callTool('load_rts_cartridge', {
  url: '/nonexistent.rts.png'
})
```

Expected:
```javascript
{
  success: false,
  error: 'Failed to fetch /nonexistent.rts.png: 404 Not Found',
  url: '/nonexistent.rts.png'
}
```

---

### Task 6: Test execute_pixel_program Tool

**Files:**
- Test: `systems/visual_shell/web/webmcp_bridge.js:356-516`

**Step 1: Execute with missing execution system (graceful failure)**

```javascript
navigator.modelContext.callTool('execute_pixel_program', {
  program: 'addi x1, x0, 42',
  mode: 'cpu',
  trace: true
})
```

Expected (if PixelCPU not available):
```javascript
{
  success: false,
  error: 'CPU execution failed: PixelCPU is not defined',
  target: 'cpu'
}
```

Or (if GPU computeSystem available):
```javascript
{
  success: true,
  target: 'gpu',
  output: 'executeInline not yet implemented',
  trace: [],
  instructions: 0
}
```

This is expected behavior - the execution backends are optional subsystems.

---

### Task 7: Integration Test — Complete Workflow

**Step 1: Simulate AI agent workflow**

In DevTools console, run the complete agent workflow:

```javascript
// 1. Get current state
const state = await navigator.modelContext.callTool('get_os_state', { include: ['camera'] });
console.log('Starting at:', state.camera);

// 2. Navigate to neural nursery
await navigator.modelContext.callTool('navigate_map', { region: 'neural_nursery', zoom: 1.5 });

// 3. Load a cartridge there
const loadResult = await navigator.modelContext.callTool('load_rts_cartridge', {
  url: '/alpine.rts.png',
  position: { x: 1024, y: 1024 },
  autoNavigate: false
});
console.log('Loaded:', loadResult.sha256);

// 4. Verify final state
const finalState = await navigator.modelContext.callTool('get_os_state', { include: ['all'] });
console.log('Final state:', finalState);
```

**Step 2: Verify metrics**

```javascript
window.webmcpBridge.getStatus()
```

Expected:
```javascript
{
  available: true,
  registered: true,
  tools: [...],
  totalCalls: 5,
  callBreakdown: {
    get_os_state: 2,
    navigate_map: 1,
    load_rts_cartridge: 1
  },
  appConnected: true
}
```

---

### Task 8: Document Results

**Files:**
- Create: `systems/visual_shell/web/test_webmcp_bridge.html`

**Step 1: Create verification test page**

Create a simple HTML test page that runs automated checks:

```html
<!DOCTYPE html>
<html>
<head>
    <title>WebMCP Bridge Verification</title>
    <style>
        body { font-family: monospace; background: #111; color: #0f0; padding: 20px; }
        .pass { color: #0f0; }
        .fail { color: #f00; }
        .pending { color: #ff0; }
        pre { background: #000; padding: 10px; overflow: auto; }
    </style>
</head>
<body>
    <h1>WebMCP Bridge Verification</h1>
    <div id="results"></div>
    <script src="webmcp_bridge.js"></script>
    <script>
        const results = document.getElementById('results');
        const checks = [
            { name: 'WebMCP available', test: () => 'modelContext' in navigator },
            { name: 'Bridge loaded', test: () => typeof WebMCPBridge !== 'undefined' },
            { name: 'Global instance', test: () => window.webmcpBridge instanceof WebMCPBridge },
        ];

        async function runChecks() {
            for (const check of checks) {
                const result = document.createElement('div');
                try {
                    const passed = check.test();
                    result.className = passed ? 'pass' : 'fail';
                    result.textContent = `${passed ? '✓' : '✗'} ${check.name}`;
                } catch (err) {
                    result.className = 'fail';
                    result.textContent = `✗ ${check.name}: ${err.message}`;
                }
                results.appendChild(result);
            }

            // Show bridge status
            const status = document.createElement('pre');
            status.textContent = JSON.stringify(window.webmcpBridge?.getStatus?.() || 'Bridge not loaded', null, 2);
            results.appendChild(status);
        }

        setTimeout(runChecks, 2000);
    </script>
</body>
</html>
```

**Step 2: Run verification page**

Navigate to: `http://localhost:8080/test_webmcp_bridge.html`

Expected: All checks pass with green checkmarks.

---

## Completion Checklist

- [ ] Script loads without errors in Chrome 146+
- [ ] Silent fallback works in non-WebMCP browsers
- [ ] `window.webmcpBridge.getStatus()` returns correct structure
- [ ] `navigate_map` pans viewport to coordinates/regions
- [ ] `get_os_state` returns comprehensive OS snapshot
- [ ] `load_rts_cartridge` mounts images with SHA256 verification
- [ ] `execute_pixel_program` handles missing backends gracefully
- [ ] Call tracking metrics are accurate
- [ ] Verification test page passes all checks

---

## Commit

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git add systems/visual_shell/web/index.html
git add docs/plans/2026-02-12-webmcp-bridge-design.md
git add docs/plans/2026-02-12-webmcp-bridge-verification-plan.md
git commit -m "feat(webmcp): add WebMCP Bridge for AI agent tool access

Implements Phase A of WebMCP integration with 4 Core tools:
- navigate_map: Pan/zoom infinite canvas
- get_os_state: Read-only OS state snapshot
- execute_pixel_program: Run code on Pixel CPU/GPU
- load_rts_cartridge: Mount .rts.png visual containers

Architecture: Event-Driven Bridge (Approach A)
- Zero modifications to application.js
- Silent fallback for non-WebMCP browsers
- DevTools observable via window.webmcpBridge.getStatus()

Completes: 'The Screen is the Hard Drive — and now the API surface.'"
```
