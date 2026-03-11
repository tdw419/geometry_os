# Headless GUI Vision System

> **Operating Linux GUI applications through AI vision without a physical display**

## Overview

This system allows AI agents to "see" and "control" a Linux desktop environment running in a headless virtual machine. Instead of displaying the GUI on a monitor, the system captures screenshots, analyzes them with a vision model (Qwen3-VL-8B), and generates text-based representations that agents can understand and act upon.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    HEADLESS GUI OPERATION FLOW                          │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   ┌──────────┐    ┌──────────┐    ┌──────────────┐    ┌────────────┐   │
│   │  Linux   │    │   VNC    │    │   Vision     │    │   AI       │   │
│   │  VM      │───►│ Capture  │───►│   Model      │───►│   Agent    │   │
│   │ (QEMU)   │    │          │    │ (Qwen3-VL)   │    │            │   │
│   └──────────┘    └──────────┘    └──────────────┘    └────────────┘   │
│         ▲                                                     │         │
│         │                                                     │         │
│         └───────────────── Mouse/Keyboard ────────────────────┘         │
│                            Commands                                     │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

## Architecture

### Components

| Component | Purpose | Technology |
|-----------|---------|------------|
| **QEMU VM** | Runs Linux desktop | `qemu-system-x86_64` with VNC |
| **VNC Server** | Provides screen capture | Built into QEMU (`-vnc :0`) |
| **Vision Model** | Analyzes screenshots | Qwen3-VL-8B via LM Studio |
| **Controller** | Orchestrates actions | Python (`headless_gui.py`) |

### Data Flow

```
1. Boot Phase
   Ubuntu qcow2 → QEMU with VNC → Headless display

2. Capture Phase
   VNC :5900 → Screenshot (PNG) → Base64 encoding

3. Vision Phase
   Screenshot → Qwen3-VL-8B → UI description + coordinates

4. Action Phase
   Agent decision → Mouse/keyboard commands → VNC input
```

## Setup

### Prerequisites

```bash
# Install QEMU
sudo apt install qemu-system-x86

# Install vncdotool for VNC control
pip install vncdotool

# Install Python dependencies
pip install pillow requests

# Run LM Studio with Qwen3-VL-8B loaded
# LM Studio should be running on localhost:1234
```

### Files

```
geometry_os/
├── headless_gui.py          # Main controller script
├── apps/linux/
│   └── ubuntu-24.04-desktop.qcow2  # Ubuntu desktop image
└── systems/vision/
    └── florence_model.py    # Alternative vision model (Florence-2)
```

## Usage

### Starting the VM

```bash
# Boot Ubuntu with VNC on :0 (port 5900)
python3 headless_gui.py boot ./apps/linux/ubuntu-24.04-desktop.qcow2

# Check status
python3 headless_gui.py status
```

### Capturing and Analyzing

```bash
# Capture screenshot
python3 headless_gui.py capture

# Generate ASCII layout of the desktop
python3 headless_gui.py ascii
```

### Interacting

```bash
# Click at specific coordinates
python3 headless_gui.py click 640,400

# Click by description (uses vision to find element)
python3 headless_gui.py click "Firefox"

# Type text
python3 headless_gui.py type "hello world"
```

## Vision Model Integration

### Why Qwen3-VL-8B?

| Feature | Florence-2 | Qwen3-VL-8B |
|---------|------------|-------------|
| General objects | ✅ COCO classes | ✅ Better |
| Desktop UI elements | ❌ Not trained | ✅ Excellent |
| Reading error messages | ❌ Poor | ✅ Accurate |
| Providing coordinates | ❌ Full image bbox | ✅ Precise |
| Understanding context | ❌ Limited | ✅ Rich descriptions |

### API Example

```python
import base64
import requests
from pathlib import Path

def analyze_screenshot(image_path: str, question: str) -> str:
    """Analyze a screenshot using Qwen3-VL-8B."""

    with open(image_path, 'rb') as f:
        img_b64 = base64.b64encode(f.read()).decode()

    response = requests.post(
        'http://localhost:1234/v1/chat/completions',
        json={
            'model': 'qwen/qwen3-vl-8b',
            'messages': [{
                'role': 'user',
                'content': [
                    {
                        'type': 'image_url',
                        'image_url': {'url': f'data:image/png;base64,{img_b64}'}
                    },
                    {'type': 'text', 'text': question}
                ]
            }],
            'max_tokens': 600
        },
        timeout=60
    )

    return response.json()['choices'][0]['message']['content']

# Example usage
description = analyze_screenshot(
    '/tmp/screenshot.png',
    'Describe the desktop. What applications are visible? '
    'Give me click coordinates for the Terminal icon.'
)
```

### Sample Output

When analyzing Shotcut video editor:

```
This is the Shotcut video editor. The interface is clearly identifiable:

**Top Menu Bar:**
- File, Edit, View, Player, Settings, Help
- Toolbar: Open File, Save, Undo, Redo, Export, etc.

**Left Sidebar:**
- Playlist Panel with drag-drop instructions
- Media Bin icon
- Project Panel icon

**Central Area:**
- New Project Panel with Project name field
- Recent Projects panel

**Bottom Timeline:**
- Empty timeline ready for editing
- Playback controls

Coordinates for key elements:
- file_menu: [65, 84]
- open_file: [87, 130]
- export: [887, 130]
- start_button: [611, 475]
- timeline: [54, 745]
```

## Controller Script

### HeadlessGUI Class

```python
from headless_gui import HeadlessGUI, VMConfig

# Configure the VM
config = VMConfig(
    qcow2_path="./apps/linux/ubuntu-24.04-desktop.qcow2",
    memory="4G",
    cpus=2,
    vnc_port=5900,
    snapshot=True  # Don't persist changes
)

gui = HeadlessGUI(config)

# Boot the VM
gui.boot()

# Capture screenshot
screenshot_path = gui.capture_screenshot()

# Render as ASCII
ascii_layout = gui.render_ascii()
print(ascii_layout)

# Click on an element
gui.send_mouse_click(640, 400)

# Send keyboard input
gui.type_text("Hello World")

# Stop the VM
gui.stop()
```

### VNC Interaction Methods

```python
# Method 1: vncdotool
import subprocess
subprocess.run(["vncdo", "-s", ":0", "move", "100", "200", "click", "1"])
subprocess.run(["vncdo", "-s", ":0", "type", "Hello"])

# Method 2: QEMU Monitor (TCP socket)
import socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(('127.0.0.1', 4444))
sock.send(b'mouse_move 100 200\n')
sock.send(b'mouse_button 1\n')
sock.send(b'sendkey a\n')  # Single key
sock.close()
```

## Agent Integration Pattern

### Vision-First Agent Loop

```python
class VisionAgent:
    """AI agent that operates GUI through vision."""

    def __init__(self, gui: HeadlessGUI):
        self.gui = gui
        self.vision = VisionModel()

    async def operate(self, goal: str):
        """Execute a goal through GUI interaction."""

        while not self.is_complete(goal):
            # 1. See current state
            screenshot = self.gui.capture_screenshot()
            description = self.vision.describe(screenshot)

            # 2. Decide next action
            action = await self.plan_action(goal, description)

            # 3. Execute action
            if action.type == "click":
                coords = self.vision.get_coordinates(
                    screenshot, action.target
                )
                self.gui.send_mouse_click(*coords)
            elif action.type == "type":
                self.gui.type_text(action.text)

            # 4. Wait for UI update
            await asyncio.sleep(1)

    async def plan_action(self, goal: str, description: str) -> Action:
        """Use LLM to decide next action based on visual state."""
        # Implementation depends on your LLM setup
        pass
```

### Example: Opening Firefox

```python
async def open_firefox(agent: VisionAgent):
    # Agent sees desktop
    state = await agent.see()

    # Agent identifies Firefox icon
    if "Firefox" in state.icons:
        coords = agent.vision.locate(state.screenshot, "Firefox")
        await agent.click(*coords)
        return True

    return False
```

## Limitations

### Current Issues

1. **Text Input**: VNC text input can be unreliable
   - Workaround: Use clipboard paste when possible

2. **Latency**: Screenshot → Vision → Action loop takes 2-5 seconds
   - Not suitable for real-time interaction

3. **Complex UIs**: Dense interfaces may confuse vision model
   - Provide specific questions about what you need

4. **Animations**: UI animations during capture cause blur
   - Wait for animations to complete before capturing

### Known Working Scenarios

| Application | Status | Notes |
|-------------|--------|-------|
| GNOME Desktop | ✅ Works | Login, dock, file manager |
| Shotcut | ✅ Works | Menu identification, panel detection |
| Firefox | ⚠️ Partial | Complex UI, many elements |
| Terminal | ✅ Works | Simple interface |

## Future Improvements

1. **AT-SPI Integration**: Use accessibility APIs for native UI structure
2. **Faster Vision**: Optimize model inference for <500ms latency
3. **Batch Actions**: Queue multiple actions for efficiency
4. **State Tracking**: Maintain UI state across interactions

## Related Documentation

- [Vision-Based UI Understanding Design](./plans/2026-02-17-vision-based-ui-understanding-design.md)
- [PixelRTS Boot Improvement Roadmap](../.planning/ROADMAP.md)
- [Florence Model Wrapper](../systems/vision/florence_model.py)

---

**Created**: 2026-02-17
**Author**: Geometry OS
**Status**: Proof of Concept
