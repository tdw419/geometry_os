# Parallel Swarm Demo

Visual demonstration of multi-agent coordination in Geometry OS.

## Overview

The Parallel Swarm Demo showcases two AI agents working in parallel on separate VMs, coordinated through the A2A Router, with real-time visual monitoring through the Visual Shell.

### The Scenario

- **Researcher Agent** (VM1): Uses Firefox to search for and find information (slogans, assets, content)
- **Producer Agent** (VM2): Uses Shotcut video editor to create content using assets found by the Researcher

Agents communicate via the A2A Router using broadcast messaging. Their work is visible in real-time through VMMonitorTiles that display each VM's GUI with semantic overlays.

## Quick Start

### 1. Start the Infrastructure

```bash
./scripts/launch_swarm_demo.sh
```

This script verifies and starts:
- QEMU VMs (2x Ubuntu desktop)
- A2A Router (port 8766)
- Vision Bridges (ports 8765, 8768)

### 2. Open the Visual Demo

Navigate to `systems/visual_shell/web/` and open `test_swarm_demo.html` in a browser.

### 3. Run the CLI Demo

```bash
python3 systems/visual_shell/swarm_demo.py
```

## Architecture

```
+--------------------------------------------------------------------------+
|                     Visual Shell (PixiJS)                                |
|  +----------------------+    +----------------------+                     |
|  |   VMMonitorTile      |    |   VMMonitorTile      |                     |
|  |   (Researcher)       |    |   (Producer)         |                     |
|  |   Firefox Browser    |    |   Shotcut Editor     |                     |
|  +----------+-----------+    +-----------+----------+                     |
+-------------+-----------------------------+--------------------------------+
              | WS :8765                    | WS :8768
              |                             |
              v                             v
+--------------------------+    +--------------------------+
|     Vision Bridge        |    |     Vision Bridge        |
|     Port 8765            |    |     Port 8768            |
|     - Qwen3-VL-8B        |    |     - Qwen3-VL-8B        |
|     - GUI Element Extract|    |     - GUI Element Extract|
+-------+------------------+    +------------------+-------+
        | VNC :0                               | VNC :1
        |                                      |
        |      +-------------------------------+------------------+
        |      |  A2A Router (:8766)                             |
        |      |  - Agent Registry                               |
        |      |  - Broadcast Messaging                          |
        |      |  - Coordination Primitives (locks, barriers)    |
        |      +-----------------------------------------------+
        |                                              |
        v                                              v
+---------------------------+    +---------------------------+
|     QEMU VM 1             |    |     QEMU VM 2             |
|     Ubuntu 24.04 Desktop  |    |     Ubuntu 24.04 Desktop  |
|     VNC Display :0        |    |     VNC Display :1        |
|     - Firefox             |    |     - Shotcut             |
+---------------------------+    +---------------------------+
```

## Components

### A2A Router (`:8766`)

The Agent-to-Agent message routing backbone for horizontal agent communication.

**Location**: `systems/pixel_compiler/a2a_router.py`

**Features**:
- Agent registration and discovery
- Direct messaging between agents
- Broadcast messaging to agent types
- Distributed coordination primitives (locks, barriers)
- Task delegation and tracking
- Collaborative build session management

**Message Types**:
- `register` - Agent registration
- `unregister` - Agent unregistration
- `heartbeat` - Keep-alive signaling
- `discover` - Peer discovery
- `direct` - Point-to-point messaging
- `broadcast` - Fan-out messaging
- `lock_request` / `lock_release` - Distributed locking
- `barrier_enter` / `barrier_release` - Synchronization barriers

### Vision Bridge (`:8765`, `:8768`)

Real-time GUI state capture and semantic element extraction using vision models.

**Location**: `vision_bridge.py`

**Features**:
- VNC screen capture from QEMU VMs
- Vision-based GUI element detection (Qwen3-VL-8B)
- WebSocket push of screenshots and element annotations
- Text-based API for AI agent interaction

**Capabilities**:
- Button detection and labeling
- Text field identification
- Menu and icon recognition
- Focused element tracking
- Suggested actions generation

### VMMonitorTile

PixiJS-based draggable window component for displaying live VM feeds.

**Location**: `systems/visual_shell/web/vm_monitor_tile.js`

**Features**:
- Live VM screenshot display
- Draggable/resizable window
- Semantic overlay with bounding boxes
- Status indicator (connected/disconnected)
- Console text overlay for TTY output
- MMU/Trap HUD for debugging

**Integration**:
```javascript
const vmTile = new VMMonitorTile(
    "Researcher (Firefox)",
    50,   // x
    50,   // y
    580,  // width
    420,  // height
    { wsUrl: "ws://localhost:8765" }
);
app.stage.addChild(vmTile);
```

### SwarmAgent

Python async agent class that combines A2A protocol with GUI actions.

**Location**: `systems/visual_shell/swarm_demo.py`

**Features**:
- A2A Router registration and communication
- Vision Bridge polling for GUI state
- GUI Protocol for executing actions
- Element finding with timeout/retry

**Methods**:
- `run_firefox_mission()` - Research workflow
- `run_shotcut_mission()` - Production workflow
- `poll_vision_state()` - Get current GUI state
- `find_element(label)` - Locate GUI element by label

## Message Protocol

### Registration

Agents register with the A2A Router to join the swarm.

```json
{
  "type": "register",
  "agent_id": "agent-001",
  "agent_type": "researcher",
  "capabilities": ["web_browsing", "content_extraction"],
  "topics": ["slogans", "assets"]
}
```

**Response**:
```json
{
  "type": "ack",
  "agent_id": "agent-001",
  "status": "registered",
  "timestamp": 1739870400.0
}
```

### Broadcast

Agents broadcast messages to all other agents (or filtered by type).

```json
{
  "type": "broadcast",
  "from_agent": "agent-001",
  "agent_type": "producer",
  "message_type": "asset_found",
  "payload": {
    "slogan": "The Screen is the Hard Drive",
    "source": "geometry-os.org"
  },
  "exclude_self": true
}
```

**Response**:
```json
{
  "type": "ack",
  "recipients": 3,
  "delivered_count": 3
}
```

### GUI State Update (Vision Bridge -> Client)

The Vision Bridge pushes GUI state updates to connected clients.

```json
{
  "type": "GUI_STATE_UPDATE",
  "timestamp": "2026-02-18T12:00:00Z",
  "window_title": "Firefox - Geometry OS",
  "screenshot": "data:image/png;base64,iVBORw0KGgo...",
  "elements": [
    {
      "type": "button",
      "label": "Search",
      "x": 450,
      "y": 80,
      "width": 80,
      "height": 30,
      "enabled": true,
      "focused": false
    },
    {
      "type": "textfield",
      "label": "Search input",
      "x": 150,
      "y": 82,
      "width": 280,
      "height": 24,
      "enabled": true,
      "focused": true
    }
  ],
  "suggested_actions": [
    "click: Search button",
    "type: <search query> in Search input"
  ]
}
```

### Direct Message (Agent-to-Agent)

Point-to-point messaging for specific coordination.

```json
{
  "type": "direct",
  "from_agent": "agent-001",
  "to_agent": "agent-002",
  "message_type": "task_assignment",
  "payload": {
    "task": "process_asset",
    "asset_url": "https://...",
    "deadline": 1739871000.0
  },
  "correlation_id": "corr-abc123",
  "timestamp": 1739870410.0
}
```

## Demo Workflow

### Researcher Agent (Firefox)

1. **Register** with A2A Router as "researcher" type
2. **Launch** Firefox and navigate to target URL
3. **Search** for content using vision-based element detection
4. **Extract** slogan/asset from page
5. **Broadcast** `asset_found` message with payload

### Producer Agent (Shotcut)

1. **Register** with A2A Router as "producer" type
2. **Listen** for `asset_found` broadcast messages
3. **Receive** slogan from Researcher
4. **Launch** Shotcut via GUI Protocol
5. **Type** slogan into project field using vision-guided clicks

### Visual Monitoring

- **VMMonitorTile 1**: Shows Firefox with detected elements (search bars, buttons, links)
- **VMMonitorTile 2**: Shows Shotcut with detected elements (text fields, timeline, export button)
- **Log Panel**: Shows real-time agent communication

## File Structure

```
geometry_os/
├── docs/
│   └── PARALLEL_SWARM_DEMO.md          # This file
├── systems/
│   ├── pixel_compiler/
│   │   └── a2a_router.py               # Agent-to-Agent Router
│   └── visual_shell/
│       ├── swarm_demo.py               # SwarmAgent implementation
│       ├── gui_protocol.py             # GUI action protocol
│       └── web/
│           ├── test_swarm_demo.html    # Demo web interface
│           ├── swarm_visual_demo.js    # Demo controller
│           ├── vm_monitor_tile.js      # VM display component
│           └── application.js          # Base PixiJS application
├── vision_bridge.py                    # Vision capture service
└── scripts/
    └── launch_swarm_demo.sh            # Infrastructure launcher
```

## Requirements

### System

- QEMU/KVM for VM virtualization
- Python 3.10+
- Modern browser with WebSocket support

### Python Packages

```
websockets
pillow
requests
pixijs (loaded via CDN)
```

### VM Images

- Ubuntu 24.04 Desktop qcow2 image at `apps/linux/ubuntu-24.04-desktop.qcow2`
- Firefox installed on VM1
- Shotcut installed on VM2

## Troubleshooting

### Vision Bridge Connection Failed

```bash
# Check if Vision Bridge is running
pgrep -f "vision_bridge.*8765"

# Restart Vision Bridge
python3 vision_bridge.py start --port 8765 --vnc 127.0.0.1:0 --monitor 4444
```

### A2A Router Not Responding

```bash
# Check if A2A Router is running
pgrep -f a2a_router.py

# Check if port is listening
ss -tulpn | grep 8766

# Restart A2A Router
python3 systems/pixel_compiler/a2a_router.py --port 8766
```

### VM Not Displaying

```bash
# Check QEMU processes
pgrep -fl qemu-system-x86

# Check VNC ports
ss -tulpn | grep -E "5900|5901"

# Start VMs manually if needed
qemu-system-x86_64 -enable-kvm \
  -drive file=./apps/linux/ubuntu-24.04-desktop.qcow2,format=qcow2 \
  -m 4096 -smp 2 -vnc :0 \
  -monitor telnet:127.0.0.1:4444,server,nowait &
```

### Element Detection Not Working

1. Check vision model is loaded (logs show model initialization)
2. Verify VNC connection is active
3. Try increasing vision polling timeout
4. Check GUI state file: `/tmp/vision_bridge_X/gui_state.txt`

## Extension Ideas

### Additional Agents

- **Reviewer Agent**: Uses VLC to preview rendered videos
- **Publisher Agent**: Uses YouTube uploader web interface
- **Archivist Agent**: Organizes assets into folders

### Enhanced Coordination

- Use distributed locks for shared resource access
- Implement barriers for synchronized multi-VM actions
- Add task delegation with progress tracking

### Vision Enhancements

- Multi-window tracking per VM
- OCR for text extraction from any region
- Motion detection for video content analysis

## References

- **A2A Router**: See `systems/pixel_compiler/a2a_router.py` for protocol details
- **Vision Bridge**: See `vision_bridge.py` for GUI state format
- **GUI Protocol**: See `systems/visual_shell/gui_protocol.py` for action commands
- **VMMonitorTile**: See `systems/visual_shell/web/vm_monitor_tile.js` for display API

---

*Geometry OS - Parallel Swarm Demo v1.0*
*Last Updated: 2026-02-18*
