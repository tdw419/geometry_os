---
name: visual-shell-debug
description: Diagnoses and troubleshoots the Visual Shell WebSocket bridge and browser HUD. Use this skill when you need to debug the connection between AI agents and the PixiJS visual interface, or when troubleshooting HUD display issues.
category: debugging
---

# Visual Shell Debug

This skill provides diagnostic workflows for the Visual Bridge (WebSocket hub) and Visual Debug Overlay (browser HUD).

## Architecture Overview

```
AI Agents (Evolution Daemon, RISC-V, etc.)
         |
         v
  Visual Bridge (port 8768)  <-- WebSocket Hub
         |
         v
  Browser (PixiJS + HUD)
```

## Quick Diagnostics

### 1. Check WebSocket Bridge Status

```bash
# Check if visual_bridge is running
ps aux | grep visual_bridge

# Check PID lock file
cat /tmp/visual_bridge.pid

# Test WebSocket connection
python3 -c "
import asyncio
import websockets
import json

async def test():
    async with websockets.connect('ws://localhost:8768') as ws:
        await ws.send(json.dumps({'type': 'ping'}))
        response = await ws.recv()
        print(f'Response: {response}')

asyncio.run(test())
"
```

### 2. Start Visual Bridge

```bash
cd systems/visual_shell/api
python3 visual_bridge.py
```

Expected output:
```
Visual Bridge starting...
   WebSocket: ws://localhost:8768
   Memory Daemon: /tmp/vector_memory_daemon.sock
   PID Lock: /tmp/visual_bridge.pid
```

### 3. Browser Console Commands

Open browser console (F12) and run:

```javascript
// Check if VisualDebugOverlay is available
window.visualDebugOverlay

// Toggle HUD visibility
window.visualDebugOverlay.toggle()

// Check current state
window.visualDebugOverlay.config

// Test with mock data
window.geometryOSApp.memoryBeams.debugTest()
```

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| Ctrl+Shift+V | Toggle Visual Debug Overlay |
| Ctrl+Shift+B | Toggle bounding boxes |
| Ctrl+Shift+H | Toggle Verification HUD |
| Ctrl+Shift+S | Toggle Shotcut Visual HUD |
| Ctrl+Shift+G | Toggle Memory Ghost overlay |

## Common Issues

### Issue: WebSocket Connection Fails

**Symptoms**: Browser console shows "WebSocket connection failed"

**Diagnosis**:
```bash
# Check port 8768 is listening
netstat -tlnp | grep 8768

# Check firewall
sudo ufw status
```

**Resolution**:
1. Start visual_bridge.py if not running
2. Check for port conflicts: `lsof -i :8768`
3. Verify browser allows WebSocket connections

### Issue: HUD Not Displaying

**Symptoms**: Ctrl+Shift+V does not show overlay

**Diagnosis**:
```javascript
// In browser console
window.visualDebugOverlay  // Should return object, not undefined
window.visualDebugOverlay.config.enabled  // Check if enabled
```

**Resolution**:
1. Verify visual_debug_overlay.js is loaded (check Network tab)
2. Check for JavaScript errors in console
3. Ensure z-index is not being overridden

### Issue: No Mirror Validation Results

**Symptoms**: HUD shows no validation updates

**Diagnosis**:
```bash
# Check if Evolution Daemon is connected
# In visual_bridge.py output, look for:
# "Connection established: ..."
```

**Resolution**:
1. Verify Evolution Daemon is running
2. Check visual_bridge.py logs for connection messages
3. Ensure daemon is sending `mirror_validation_result` events

### Issue: Memory Beams Not Rendering

**Symptoms**: Shift+Middle-Click does not show cyan beams

**Diagnosis**:
```javascript
// In browser console
window.geometryOSApp.memoryBeams  // Check if initialized
window.geometryOSApp.memoryBeams.debugTest()  // Run test
```

**Resolution**:
1. Verify MemoryBeamRenderer.js is loaded
2. Check WebGL context is available
3. Ensure Vector Memory Daemon is running

### Issue: RISC-V UART Not Streaming

**Symptoms**: No "SILICON TERMINAL" output in HUD

**Diagnosis**:
```bash
# Check RISC-V executor output
cd systems/infinite_map_rs
cargo run --release --bin run_riscv -- --help
```

**Resolution**:
1. Verify run_riscv is running with WebSocket client enabled
2. Check visual_bridge.py for "RISC-V UART" log messages
3. Ensure correct .rts.png file is being executed

## Log Locations

| Component | Log Location |
|-----------|--------------|
| Visual Bridge | Console output (stdout) |
| Browser HUD | Browser console (F12) |
| Evolution Daemon | `logs/evolution/evolution_daemon.log` |
| RISC-V Executor | Console output |

## Debug Event Types

The Visual Bridge handles these event types:

| Type | Source | Description |
|------|--------|-------------|
| `ping` | Any | Health check |
| `mirror_validation_result` | Evolution Daemon | Validation results |
| `riscv_uart` | RISC-V Executor | UART output |
| `tectonic_pulse` | Neural City | Spatial realignment |
| `swarm_health` | Swarm Manager | Agent health status |
| `task_update` | Task Orchestrator | DAG updates |
| `daemon_heartbeat` | Evolution Daemon | Status updates |

## Manual Event Injection

For testing, inject events via Python:

```python
import asyncio
import websockets
import json

async def inject_event():
    async with websockets.connect('ws://localhost:8768') as ws:
        # Inject test mirror validation
        await ws.send(json.dumps({
            'type': 'mirror_validation_result',
            'task_id': 'test-123',
            'passed': True,
            'accuracy': 0.95
        }))
        print("Event injected")

asyncio.run(inject_event())
```

## Performance Monitoring

In browser console:

```javascript
// Check render performance
window.visualDebugOverlay.renderTime
window.visualDebugOverlay.frameCount

// Check memory usage
performance.memory
```
