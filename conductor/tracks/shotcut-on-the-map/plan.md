# Implementation Plan: Shotcut on the Map

This document outlines the implementation plan for running the Shotcut video editor inside a QEMU virtual machine and rendering its GUI on the PixiJS infinite map, allowing for AI-driven control.

## 1. Detailed Design

The core architecture consists of three main components: a QEMU VM running Shotcut, a bridge to stream the VM's display to the frontend, and a set of WebMCP tools for the AI to interact with the VM.

### 1.1. QEMU VM Setup

-   **Linux Distribution**: Alpine Linux (lightweight, fast boot).
-   **Core Packages**:
    -   `qemu-x86_64`: The emulator.
    -   `alpine-base`: The base system.
    -   `xorg-server`, `openbox` (or `i3`), `xterm`: A minimal X11 environment.
    -   `shotcut`: The target application.
-   **VM Image**: A `qcow2` disk image will be created. This image will be pre-configured with the necessary packages and a startup script to launch the graphical environment and Shotcut.
-   **Networking**: User-mode networking will be sufficient for installing packages within the VM during the image creation process.

### 1.2. Framebuffer-to-Texture Bridge

This bridge is critical for visualizing the VM on the PixiJS map.

1.  **Framebuffer Access**: QEMU's VNC or Spice protocol can be used to expose the VM's framebuffer. VNC is simpler to integrate. A process on the host will connect to the QEMU VNC server.
2.  **Data Streaming**: The host process will capture the framebuffer updates and stream them over a WebSocket to the `visual_shell` frontend.
3.  **PixiJS Texture**: The `visual_shell` will receive the image data (e.g., as PNG or JPEG frames) and update a `PIXI.Texture` in real-time. This texture will be applied to a sprite on the infinite map, representing the VM's screen.

### 1.3. AI Control Loop ("See -> Decide -> Act")

The AI will control Shotcut through a feedback loop:

-   **See**: The AI uses the `linux_screenshot` tool. This tool will trigger the host process to capture the current state of the VM's display (via VNC) and return it as an image. The AI's vision capabilities (VisionCortex OCR) will analyze this image to understand the GUI state (e.g., button locations, timeline status).
-   **Decide**: Based on the visual analysis, the AI model decides on the next action (e.g., "click the 'File' menu", "drag the clip to the timeline").
-   **Act**: The AI uses the `linux_input` tool. This tool sends structured commands (e.g., `{ "action": "click", "x": 50, "y": 25 }` or `{ "action": "type", "text": "my_video.mp4" }`) to the host process, which then injects the corresponding mouse and keyboard events into the VM via QEMU's input injection capabilities.

## 2. WebMCP Tools

The following WebMCP tools need to be implemented to provide the AI with control over the Linux VM.

-   **`linux_boot(vm_config)`**:
    -   **Description**: Starts a QEMU VM.
    -   **Parameters**: `vm_config` (object): Specifies the disk image, memory, and other QEMU parameters.
    -   **Returns**: `vm_id` (string): A unique identifier for the running VM instance.

-   **`linux_shutdown(vm_id)`**:
    -   **Description**: Shuts down a running VM.
    -   **Parameters**: `vm_id` (string): The ID of the VM to shut down.

-   **`linux_screenshot(vm_id)`**:
    -   **Description**: Captures the current screen of the VM.
    -   **Parameters**: `vm_id` (string): The ID of the VM.
    -   **Returns**: `image_base64` (string): A base64-encoded string of the screen capture (e.g., in PNG format).

-   **`linux_input(vm_id, events)`**:
    -   **Description**: Injects a sequence of input events into the VM.
    -   **Parameters**:
        -   `vm_id` (string): The ID of the VM.
        -   `events` (array): An array of input events, e.g., `[{ "action": "mousemove", "x": 100, "y": 150 }, { "action": "click", "button": "left" }]`.

-   **`linux_exec(vm_id, command)`**:
    -   **Description**: Executes a shell command inside the VM.
    -   **Parameters**:
        -   `vm_id` (string): The ID of the VM.
        -   `command` (string): The command to execute.
    -   **Returns**: `{ "stdout": "...", "stderr": "..." }`.

## 3. VM Boot Sequence & Image Creation

A reproducible script (e.g., a shell script) will be created to build the `qcow2` disk image.

1.  **Download Base Image**: Fetch a minimal Alpine Linux cloud image.
2.  **Customize Image**: Use `guestfish` or a similar tool to script modifications to the image without booting it.
3.  **Installation Script**: Add a first-boot script (using cloud-init or a custom service) that will:
    -   Set up the Alpine community repository.
    -   Run `apk update && apk add shotcut openbox xterm`.
    -   Create a user account.
    -   Configure `.xinitrc` or an openbox autostart script to launch `shotcut`.
4.  **Finalize Image**: The script will output the final `shotcut-alpine.qcow2` image, ready to be used by the `linux_boot` tool.

---

## 4. Implementation Progress

### 4.1. VM Image Builder (🟡 Pivot to Interactive)

**Initial automated approach using `virt-customize` has been abandoned due to persistent, environment-specific network failures within the libguestfs appliance.**

We have pivoted to a more reliable, two-stage interactive installation process.

**Stage 1: Base Alpine Installation (Next Step)**
- **Status**: Interactive Install Pending
- **File**: `build_shotcut_vm.sh`
- **Action**: Run `sudo ./build_shotcut_vm.sh`. This will launch a QEMU VM with the Alpine installer. The script provides detailed on-screen instructions for the user to follow to complete the base OS installation.

**Stage 2: Shotcut Installation (Planned)**
- **Status**: Pending
- **Action**: After Stage 1 is complete, we will boot the newly created VM and run a script to install Shotcut, X11, Openbox, and configure the user environment.

**New Usage**:
```bash
# This will start the interactive base OS installation
sudo ./build_shotcut_vm.sh
```

### 4.2. WebMCP Tools (✅ Implemented)

**Status**: WebMCP tools have been added to `webmcp_bridge.js`

| Tool | Description | Status |
|------|-------------|--------|
| `shotcut_status` | Get VM status (running, VNC port, etc.) | ✅ |
| `shotcut_boot` | Start QEMU VM with Shotcut | ✅ |
| `shotcut_shutdown` | Stop the VM | ✅ |
| `shotcut_screenshot` | Capture screen for AI vision | ✅ |
| `shotcut_input` | Inject keyboard/mouse events | ✅ |
| `shotcut_type` | Type text into VM | ✅ |
| `shotcut_click` | Click at coordinates | ✅ |
| `shotcut_exec` | Run shell commands via SSH | ✅ |

**Backend**: `shotcut_vm_bridge.py` - WebSocket server on port 8768

**Usage for AI-Driven Installation**:
```javascript
// 1. Boot VM with Alpine ISO
await shotcut_boot({ iso: "images/alpine-virt-3.19.iso" });

// 2. See the screen
const screen = await shotcut_screenshot();

// 3. Analyze and act
if (screen shows "localhost login:") {
    await shotcut_type({ text: "root" });
}

// 4. Repeat until installation complete
```

### 4.3. Framebuffer Bridge (✅ Working)

- **Status**: VNC screenshot capture now functional
- **Fix Applied**: QEMU VNC binding changed from `-vnc :0` to `-vnc 127.0.0.1:0`
- **vncsnapshot**: Uses display number `:0` instead of raw port `:5900`
- **Result**: Real 1024x768 JPEG screenshots captured successfully (566KB)

### 4.4. Keyboard Input via QMP (✅ Working)

- **Status**: QMP-based keyboard injection working correctly
- **Fix Applied**: QMP `send-key` command handles both press AND release in a single call
- **Key Changes**:
  - Added QMP socket support (`-qmp unix:/tmp/qemu-qmp-{session}.sock,server,nowait`)
  - `_inject_key()` now sends single `send-key` command (not separate press/release)
  - `_inject_text()` calls `_inject_key()` once per character
- **Test Results**:
  - "root" = 4 keystrokes ✅ (not "rroooott")
  - "setup-alpine" = 11 keystrokes ✅
- **Uppercase Support**: Shift+key sent together in single QMP call

---

## 5. Geometry OS Integration (✅ Complete)

### 5.1. PixelRTS Cartridge System

**Status**: Cartridge created for Shotcut VM

| Component | File | Description |
|-----------|------|-------------|
| Cartridge Creator | `shotcut_cartridge.py` | Converts qcow2 to visual cartridge |
| Visual Fingerprint | `ubuntu-24.04-desktop.cartridge.rts.png` | 512x512 Hilbert-mapped thumbnail |
| Metadata | `ubuntu-24.04-desktop.cartridge.rts.meta.json` | VM config, hashes, bridge info |

**Cartridge Features**:
- Visual fingerprint using Hilbert space-filling curve
- RGBA encoding: R=Entropy, G=AvgByte, B=Variance, A=255
- SHA256 hash of disk for integrity
- Embedded VM configuration (memory, CPUs, ports)
- Bridge connection info

### 5.2. Shotcut Agent

**Status**: High-level AI agent implemented

| Component | File | Description |
|-----------|------|-------------|
| Agent | `shotcut_agent.py` | Python async agent class |
| Methods | `boot()`, `see()`, `click()`, `type_text()`, `press_key()` | Core operations |
| High-Level | `launch_shotcut()`, `create_title()`, `open_file()`, `export_video()` | Workflows |

**Agent Capabilities**:
- VM lifecycle management (boot, shutdown, status)
- Vision via screenshot + OCR
- Keyboard/mouse input via QMP
- High-level video editing operations
- Screenshot analysis for AI decision support

### 5.3. Complete "See → Decide → Act" Loop

**Demonstrated Workflow**: Creating a text title clip

```
Step 1: SEE
  screenshot = agent.see() → 460KB PNG + OCR text

Step 2: DECIDE
  Analyze screenshot → Find "Open Other" button at (80, 50)

Step 3: ACT
  agent.click(80, 50)       → Opens dropdown
  agent.click(80, 150)      → Selects "Text"
  agent.click(400, 320)     → Focuses text field
  agent.type_text("Hello!") → Types title text
  agent.press_key("ret")    → Confirms

Step 4: VERIFY
  agent.see() → Confirm text clip created
```

**Result**: ✅ "Hello, World!" text clip successfully created in Shotcut

---

## 6. Files Structure

```
conductor/tracks/shotcut-on-the-map/
├── plan.md                               # This document
├── shotcut_vm_bridge.py                  # WebSocket backend for AI control
├── shotcut_agent.py                      # High-level AI agent (NEW)
├── shotcut_cartridge.py                  # PixelRTS cartridge creator (NEW)
├── screenshot_vm.py                      # Screenshot capture with OCR
├── boot_ubuntu.sh                        # Ubuntu boot script
├── manual_install.sh                     # Manual Alpine install helper
├── ubuntu-24.04-desktop.cartridge.rts.png # Shotcut VM cartridge (NEW)
├── ubuntu-24.04-desktop.cartridge.rts.meta.json # Cartridge metadata (NEW)
└── images/
    ├── shotcut-alpine.qcow2              # Alpine VM image (in progress)
    ├── alpine-virt-3.19.0-x86_64.iso     # Alpine installer ISO
    └── ...

apps/linux/
└── ubuntu-24.04-desktop.qcow2            # Working Ubuntu + Shotcut image (16GB)
```

---

## 6. Dependencies

### Build Dependencies
- `qemu-utils` (qemu-img)
- `libguestfs-tools` (virt-customize, guestfish)
- `wget` or `curl`
- `genisoimage` or `mkisofs` (for cloud-init ISO)

### Runtime Dependencies
- `qemu-system-x86_64`
- VNC client (for direct access)
- `vncviewer` or `remmina`

Install on Ubuntu/Debian:
```bash
sudo apt install qemu-system-x86 qemu-utils libguestfs-tools \
    genisoimage wget remmina
```
# Test modification
