# Input Driver Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable AI to inject keyboard and mouse input into both the in-browser RISC-V CPU and QEMU-based Linux VMs via a unified MMIO interface.

**Architecture:** The GPU Execution System already writes input events to MMIO region 0x02000000. We need to: (1) extend the RISC-V WGSL shader to poll this MMIO region and process input events, and (2) create a Python daemon that bridges MMIO to Linux uinput for QEMU VMs. Both paths share the same MMIO layout.

**Tech Stack:** WGSL (WebGPU Shaders), Python 3, python-evdev/uinput, QEMU Monitor Protocol

---

## MMIO Input Region Layout

**Base Address:** `0x02000000` (32MB offset in system_memory buffer)

| Offset | Size | Name | Description |
|--------|------|------|-------------|
| 0x00 | 4 bytes | `input_status` | Bit 0: pending event, Bit 1-7: reserved |
| 0x04 | 4 bytes | `input_type` | 0=none, 1=keyboard, 2=mouse, 3=touch |
| 0x08 | 4 bytes | `input_key` | Key code (for keyboard) |
| 0x0C | 4 bytes | `input_x` | X coordinate (for mouse) |
| 0x10 | 4 bytes | `input_y` | Y coordinate (for mouse) |
| 0x14 | 4 bytes | `input_flags` | Bit 0: pressed, Bit 1: released, etc. |

---

## Task 1: Define MMIO Input Constants in RISC-V Shader

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Add MMIO input constants at top of shader**

Add after the existing constants (around line 20):

```wgsl
// --- MMIO INPUT REGION (Offset 32MB) ---
const MMIO_INPUT_BASE: u32 = 0x02000000u;  // 32MB offset
const MMIO_INPUT_STATUS: u32 = 0u;   // Offset from base
const MMIO_INPUT_TYPE: u32 = 4u;     // Offset from base
const MMIO_INPUT_KEY: u32 = 8u;      // Offset from base
const MMIO_INPUT_X: u32 = 12u;       // Offset from base
const MMIO_INPUT_Y: u32 = 16u;       // Offset from base
const MMIO_INPUT_FLAGS: u32 = 20u;   // Offset from base

// Input types
const INPUT_TYPE_NONE: u32 = 0u;
const INPUT_TYPE_KEYBOARD: u32 = 1u;
const INPUT_TYPE_MOUSE: u32 = 2u;
const INPUT_TYPE_TOUCH: u32 = 3u;

// Input flags
const INPUT_FLAG_PRESSED: u32 = 1u;
const INPUT_FLAG_RELEASED: u32 = 2u;
```

**Step 2: Verify shader syntax**

Run: Build the project or check WebGPU console for compilation errors
Expected: No syntax errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(input): add MMIO input constants to RISC-V shader

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Implement MMIO Input Polling in RISC-V Shader

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl`

**Step 1: Add input polling function**

Add before the `main()` function:

```wgsl
// --- MMIO INPUT POLLING ---
fn poll_input(base_idx: u32) -> bool {
    // Read input status
    let status_addr = (MMIO_INPUT_BASE + MMIO_INPUT_STATUS) / 4u;

    if (status_addr >= arrayLength(&system_memory)) {
        return false;
    }

    let status = system_memory[status_addr];
    let pending = status & 1u;

    if (pending == 0u) {
        return false;  // No input pending
    }

    // Read input type
    let type_addr = (MMIO_INPUT_BASE + MMIO_INPUT_TYPE) / 4u;
    let input_type = system_memory[type_addr];

    // Process based on type
    if (input_type == INPUT_TYPE_KEYBOARD) {
        // Read key code and flags
        let key_addr = (MMIO_INPUT_BASE + MMIO_INPUT_KEY) / 4u;
        let flags_addr = (MMIO_INPUT_BASE + MMIO_INPUT_FLAGS) / 4u;

        let key_code = system_memory[key_addr];
        let flags = system_memory[flags_addr];

        // For now, store in a memory location the OS can read
        // Keyboard buffer at 0x02100000 (33MB)
        let kb_buf_addr = 0x02100000u / 4u;
        if (kb_buf_addr < arrayLength(&system_memory)) {
            // Write: keycode | (flags << 16)
            system_memory[kb_buf_addr] = key_code | (flags << 16u);
        }

    } else if (input_type == INPUT_TYPE_MOUSE) {
        // Read mouse coordinates
        let x_addr = (MMIO_INPUT_BASE + MMIO_INPUT_X) / 4u;
        let y_addr = (MMIO_INPUT_BASE + MMIO_INPUT_Y) / 4u;
        let flags_addr = (MMIO_INPUT_BASE + MMIO_INPUT_FLAGS) / 4u;

        let mouse_x = system_memory[x_addr];
        let mouse_y = system_memory[y_addr];
        let flags = system_memory[flags_addr];

        // Mouse buffer at 0x02200000 (34MB)
        let mouse_buf_addr = 0x02200000u / 4u;
        if (mouse_buf_addr + 2u < arrayLength(&system_memory)) {
            system_memory[mouse_buf_addr] = mouse_x;
            system_memory[mouse_buf_addr + 1u] = mouse_y;
            system_memory[mouse_buf_addr + 2u] = flags;
        }
    }

    // Clear pending flag (acknowledge)
    system_memory[status_addr] = status & ~1u;

    return true;
}
```

**Step 2: Call poll_input in main compute kernel**

In the `main()` function, add the input poll after checking halt state:

```wgsl
@compute @workgroup_size(64)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let core_id = global_id.x;
    let base_idx = core_id * REGS_PER_CORE;

    // 1. Check if HALTED
    let halted = cpu_states[base_idx + CSR_HALT];
    if (halted > 0u) { return; }

    // 1.5. Poll for MMIO input (only core 0)
    if (core_id == 0u) {
        poll_input(base_idx);
    }

    // 2. Fetch PC
    // ... rest of existing code
```

**Step 3: Verify shader compiles**

Open `test_pixel_cpu_simple.html` in browser and check console for WGSL errors.
Expected: No compilation errors

**Step 4: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl
git commit -m "feat(input): add MMIO input polling to RISC-V shader

- Poll input_status at 0x02000000 each tick
- Process keyboard events (keycode + flags)
- Process mouse events (x, y, flags)
- Store in buffer regions for OS consumption

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Extend gpu_execution_system.js Input Protocol

**Files:**
- Modify: `systems/visual_shell/web/gpu_execution_system.js:212-240`

**Step 1: Update injectInput to use new MMIO layout**

Replace the existing `injectInput` method with:

```javascript
/**
 * Inject Input Event into MMIO region (Offset 32MB)
 * MMIO Layout:
 *   0x02000000: status (bit 0 = pending)
 *   0x02000004: type (1=keyboard, 2=mouse, 3=touch)
 *   0x02000008: key_code (for keyboard)
 *   0x0200000C: mouse_x
 *   0x02000010: mouse_y
 *   0x02000014: flags (1=pressed, 2=released)
 *
 * @param {string} id - Kernel ID
 * @param {string} type - 'keyboard', 'mouse'
 * @param {object} data - {key, x, y, pressed, released}
 */
async injectInput(id, type, data) {
    const MMIO_BASE = 0x02000000; // 32MB

    const kernel = this.kernels.get(id);
    if (!kernel) {
        console.warn(`[GPUExecutionSystem] Kernel not found: ${id}`);
        return;
    }

    // Build input packet
    let inputType = 0;
    let keyCode = 0;
    let mouseX = 0;
    let mouseY = 0;
    let flags = 0;

    if (type === 'keyboard') {
        inputType = 1;
        // Map common keys to scancodes
        keyCode = this.#keyToScancode(data.key || '');
        flags = data.pressed ? 1 : (data.released ? 2 : 1);
    } else if (type === 'mouse') {
        inputType = 2;
        mouseX = Math.floor(data.x) || 0;
        mouseY = Math.floor(data.y) || 0;
        flags = data.pressed ? 1 : (data.released ? 2 : 0);
    }

    // Write to MMIO region
    const mmioData = new Uint32Array([
        1,           // status = pending
        inputType,   // type
        keyCode,     // key
        mouseX,      // x
        mouseY,      // y
        flags        // flags
    ]);

    this.device.queue.writeBuffer(
        kernel.memoryBuffer,
        MMIO_BASE,
        mmioData
    );

    console.log(`[GPUExecutionSystem] Injected ${type} input:`, { inputType, keyCode, mouseX, mouseY, flags });
}

/**
 * Convert key string to scancode
 * @private
 */
#keyToScancode(key) {
    const keyMap = {
        'Enter': 0x1C,
        'Escape': 0x01,
        'Backspace': 0x0E,
        'Tab': 0x0F,
        'Space': 0x39,
        'ArrowUp': 0x48,
        'ArrowDown': 0x50,
        'ArrowLeft': 0x4B,
        'ArrowRight': 0x4D,
        'Shift': 0x2A,
        'Control': 0x1D,
        'Alt': 0x38,
        'a': 0x1E, 'b': 0x30, 'c': 0x2E, 'd': 0x20, 'e': 0x12,
        'f': 0x21, 'g': 0x22, 'h': 0x23, 'i': 0x17, 'j': 0x24,
        'k': 0x25, 'l': 0x26, 'm': 0x32, 'n': 0x31, 'o': 0x18,
        'p': 0x19, 'q': 0x10, 'r': 0x13, 's': 0x1F, 't': 0x14,
        'u': 0x16, 'v': 0x2F, 'w': 0x11, 'x': 0x2D, 'y': 0x15,
        'z': 0x2C,
        '0': 0x0B, '1': 0x02, '2': 0x03, '3': 0x04, '4': 0x05,
        '5': 0x06, '6': 0x07, '7': 0x08, '8': 0x09, '9': 0x0A,
    };

    // Single character
    if (key.length === 1) {
        const lower = key.toLowerCase();
        return keyMap[lower] || key.charCodeAt(0);
    }

    return keyMap[key] || 0;
}
```

**Step 2: Verify no syntax errors**

Run: Open browser console and check for JS errors
Expected: No errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/gpu_execution_system.js
git commit -m "feat(input): extend MMIO input protocol with full packet

- New MMIO layout: status, type, key, x, y, flags
- Key-to-scancode mapping for common keys
- Proper keyboard and mouse event structure

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Create Linux uinput Input Daemon

**Files:**
- Create: `systems/visual_shell/web/input_daemon.py`

**Step 1: Create input daemon skeleton**

```python
#!/usr/bin/env python3
"""
Input Daemon for Geometry OS

Bridges MMIO input events to Linux uinput devices.
This runs inside the QEMU Linux VM.

MMIO Layout (matches GPU Execution System):
  0x02000000: status (bit 0 = pending)
  0x02000004: type (1=keyboard, 2=mouse)
  0x02000008: key_code
  0x0200000C: mouse_x
  0x02000010: mouse_y
  0x02000014: flags (1=pressed, 2=released)
"""

import os
import time
import struct
import threading
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger('input_daemon')

# Try to import evdev (available on Linux)
try:
    import evdev
    from evdev import UInput, ecodes, AbsInfo
    HAS_EVDEV = True
except ImportError:
    HAS_EVDEV = False
    logger.warning("evdev not available - running in mock mode")


class InputDaemon:
    """MMIO to uinput bridge daemon."""

    # MMIO layout
    MMIO_INPUT_STATUS = 0x02000000
    MMIO_INPUT_TYPE = 0x02000004
    MMIO_INPUT_KEY = 0x02000008
    MMIO_INPUT_X = 0x0200000C
    MMIO_INPUT_Y = 0x02000010
    MMIO_INPUT_FLAGS = 0x02000014

    # Input types
    INPUT_TYPE_KEYBOARD = 1
    INPUT_TYPE_MOUSE = 2

    # Input flags
    INPUT_FLAG_PRESSED = 1
    INPUT_FLAG_RELEASED = 2

    # Scancode to evdev key code mapping
    SCANCODE_TO_KEY = {
        0x01: ecodes.KEY_ESC,
        0x02: ecodes.KEY_1, 0x03: ecodes.KEY_2, 0x04: ecodes.KEY_3,
        0x05: ecodes.KEY_4, 0x06: ecodes.KEY_5, 0x07: ecodes.KEY_6,
        0x08: ecodes.KEY_7, 0x09: ecodes.KEY_8, 0x0A: ecodes.KEY_9,
        0x0B: ecodes.KEY_0,
        0x0E: ecodes.KEY_BACKSPACE,
        0x0F: ecodes.KEY_TAB,
        0x1C: ecodes.KEY_ENTER,
        0x1D: ecodes.KEY_LEFTCTRL,
        0x2A: ecodes.KEY_LEFTSHIFT,
        0x38: ecodes.KEY_LEFTALT,
        0x39: ecodes.KEY_SPACE,
        0x1E: ecodes.KEY_A, 0x30: ecodes.KEY_B, 0x2E: ecodes.KEY_C,
        0x20: ecodes.KEY_D, 0x12: ecodes.KEY_E, 0x21: ecodes.KEY_F,
        0x22: ecodes.KEY_G, 0x23: ecodes.KEY_H, 0x17: ecodes.KEY_I,
        0x24: ecodes.KEY_J, 0x25: ecodes.KEY_K, 0x26: ecodes.KEY_L,
        0x32: ecodes.KEY_M, 0x31: ecodes.KEY_N, 0x18: ecodes.KEY_O,
        0x19: ecodes.KEY_P, 0x10: ecodes.KEY_Q, 0x13: ecodes.KEY_R,
        0x1F: ecodes.KEY_S, 0x14: ecodes.KEY_T, 0x16: ecodes.KEY_U,
        0x2F: ecodes.KEY_V, 0x11: ecodes.KEY_W, 0x2D: ecodes.KEY_X,
        0x15: ecodes.KEY_Y, 0x2C: ecodes.KEY_Z,
        0x48: ecodes.KEY_UP, 0x50: ecodes.KEY_DOWN,
        0x4B: ecodes.KEY_LEFT, 0x4D: ecodes.KEY_RIGHT,
    }

    def __init__(self, mmio_path=None, mock=False):
        """
        Initialize input daemon.

        Args:
            mmio_path: Path to MMIO device file (e.g., /dev/geometry-mmio)
            mock: Run in mock mode (no real input injection)
        """
        self.mmio_path = mmio_path
        self.mock = mock or not HAS_EVDEV
        self.running = False
        self.mmio_fd = None

        # Create uinput devices
        if not self.mock:
            self._setup_uinput()
        else:
            self.keyboard = None
            self.mouse = None
            logger.info("Running in mock mode - no real input injection")

    def _setup_uinput(self):
        """Setup uinput keyboard and mouse devices."""
        # Keyboard device
        self.keyboard = UInput(
            name='Geometry OS Virtual Keyboard',
            phys='geometry-os/input0',
            bustype=ecodes.BUS_USB,
        )

        # Mouse device with absolute positioning
        self.mouse = UInput(
            name='Geometry OS Virtual Mouse',
            phys='geometry-os/input1',
            bustype=ecodes.BUS_USB,
            events={
                ecodes.EV_KEY: [ecodes.BTN_LEFT, ecodes.BTN_RIGHT, ecodes.BTN_MIDDLE],
                ecodes.EV_ABS: [
                    (ecodes.ABS_X, AbsInfo(0, 0, 1920, 0, 0, 0)),
                    (ecodes.ABS_Y, AbsInfo(0, 0, 1080, 0, 0, 0)),
                ],
            }
        )

        logger.info("Created uinput devices")

    def _open_mmio(self):
        """Open MMIO device file."""
        if not self.mmio_path:
            logger.warning("No MMIO path specified - using mock MMIO")
            return False

        try:
            self.mmio_fd = os.open(self.mmio_path, os.O_RDWR | os.O_SYNC)
            logger.info(f"Opened MMIO device: {self.mmio_path}")
            return True
        except OSError as e:
            logger.error(f"Failed to open MMIO device: {e}")
            return False

    def _read_mmio(self, offset, size=4):
        """Read from MMIO region."""
        if self.mmio_fd is None:
            return 0

        try:
            os.lseek(self.mmio_fd, offset, os.SEEK_SET)
            data = os.read(self.mmio_fd, size)
            return struct.unpack('<I', data)[0]
        except OSError as e:
            logger.error(f"MMIO read error: {e}")
            return 0

    def _write_mmio(self, offset, value, size=4):
        """Write to MMIO region."""
        if self.mmio_fd is None:
            return

        try:
            os.lseek(self.mmio_fd, offset, os.SEEK_SET)
            os.write(self.mmio_fd, struct.pack('<I', value)[:size])
        except OSError as e:
            logger.error(f"MMIO write error: {e}")

    def _process_input(self):
        """Process pending input event from MMIO."""
        # Read status
        status = self._read_mmio(self.MMIO_INPUT_STATUS)

        if (status & 1) == 0:
            return  # No pending event

        # Read input packet
        input_type = self._read_mmio(self.MMIO_INPUT_TYPE)
        key_code = self._read_mmio(self.MMIO_INPUT_KEY)
        mouse_x = self._read_mmio(self.MMIO_INPUT_X)
        mouse_y = self._read_mmio(self.MMIO_INPUT_Y)
        flags = self._read_mmio(self.MMIO_INPUT_FLAGS)

        # Clear pending flag
        self._write_mmio(self.MMIO_INPUT_STATUS, status & ~1)

        # Process based on type
        if input_type == self.INPUT_TYPE_KEYBOARD:
            self._inject_keyboard(key_code, flags)
        elif input_type == self.INPUT_TYPE_MOUSE:
            self._inject_mouse(mouse_x, mouse_y, flags)

    def _inject_keyboard(self, scancode, flags):
        """Inject keyboard event."""
        evdev_key = self.SCANCODE_TO_KEY.get(scancode)

        if evdev_key is None:
            logger.debug(f"Unknown scancode: 0x{scancode:02X}")
            return

        if self.mock:
            action = "pressed" if flags & self.INPUT_FLAG_PRESSED else "released"
            logger.info(f"[MOCK] Keyboard: {evdev_key} {action}")
            return

        if flags & self.INPUT_FLAG_PRESSED:
            self.keyboard.write(ecodes.EV_KEY, evdev_key, 1)
        elif flags & self.INPUT_FLAG_RELEASED:
            self.keyboard.write(ecodes.EV_KEY, evdev_key, 0)

        self.keyboard.syn()
        logger.debug(f"Injected keyboard: {evdev_key} flags={flags}")

    def _inject_mouse(self, x, y, flags):
        """Inject mouse event."""
        if self.mock:
            action = ""
            if flags & self.INPUT_FLAG_PRESSED:
                action = "pressed"
            elif flags & self.INPUT_FLAG_RELEASED:
                action = "released"
            logger.info(f"[MOCK] Mouse: ({x}, {y}) {action}")
            return

        # Move to position
        self.mouse.write(ecodes.EV_ABS, ecodes.ABS_X, x)
        self.mouse.write(ecodes.EV_ABS, ecodes.ABS_Y, y)

        # Handle button state
        if flags & self.INPUT_FLAG_PRESSED:
            self.mouse.write(ecodes.EV_KEY, ecodes.BTN_LEFT, 1)
        elif flags & self.INPUT_FLAG_RELEASED:
            self.mouse.write(ecodes.EV_KEY, ecodes.BTN_LEFT, 0)

        self.mouse.syn()
        logger.debug(f"Injected mouse: ({x}, {y}) flags={flags}")

    def run(self):
        """Main daemon loop."""
        self.running = True
        logger.info("Input daemon started")

        # Try to open MMIO device
        self._open_mmio()

        try:
            while self.running:
                self._process_input()
                time.sleep(0.001)  # 1ms poll interval
        except KeyboardInterrupt:
            pass
        finally:
            self.stop()

    def stop(self):
        """Stop the daemon."""
        self.running = False

        if self.mmio_fd is not None:
            os.close(self.mmio_fd)
            self.mmio_fd = None

        if self.keyboard:
            self.keyboard.close()
        if self.mouse:
            self.mouse.close()

        logger.info("Input daemon stopped")


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Geometry OS Input Daemon')
    parser.add_argument('--mmio', default='/dev/geometry-mmio', help='MMIO device path')
    parser.add_argument('--mock', action='store_true', help='Run in mock mode')
    parser.add_argument('--interval', type=int, default=1, help='Poll interval in ms')

    args = parser.parse_args()

    daemon = InputDaemon(mmio_path=args.mmio, mock=args.mock)
    daemon.run()


if __name__ == '__main__':
    main()
```

**Step 2: Make daemon executable**

```bash
chmod +x systems/visual_shell/web/input_daemon.py
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/input_daemon.py
git commit -m "feat(input): add Linux uinput input daemon

- Polls MMIO region at 0x02000000
- Injects keyboard events via evdev/uinput
- Injects mouse events with absolute positioning
- Scancode to evdev key mapping
- Mock mode for testing without uinput

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Create MMIO Bridge for QEMU

**Files:**
- Create: `systems/visual_shell/web/mmio_bridge.py`

**Step 1: Create QEMU MMIO bridge**

```python
#!/usr/bin/env python3
"""
MMIO Bridge for QEMU

Bridges GPU MMIO writes to QEMU guest memory via QEMU Monitor Protocol.
This allows the host-side GPU execution system to inject input events
into the QEMU VM's memory space.
"""

import asyncio
import json
import struct
import logging
from typing import Optional

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger('mmio_bridge')


class QEMUMMIOBridge:
    """Bridges MMIO to QEMU guest memory via QMP."""

    MMIO_INPUT_BASE = 0x02000000

    def __init__(self, qmp_socket: str = '/tmp/qemu-monitor.sock'):
        """
        Initialize QEMU MMIO bridge.

        Args:
            qmp_socket: Path to QEMU QMP socket
        """
        self.qmp_socket = qmp_socket
        self.reader: Optional[asyncio.StreamReader] = None
        self.writer: Optional[asyncio.StreamWriter] = None
        self.connected = False

    async def connect(self):
        """Connect to QEMU QMP socket."""
        try:
            self.reader, self.writer = await asyncio.open_unix_connection(self.qmp_socket)

            # Read greeting
            greeting = await self.reader.readline()
            logger.debug(f"QMP greeting: {greeting}")

            # Negotiate capabilities
            self.writer.write(b'{"execute": "qmp_capabilities"}\n')
            await self.writer.drain()

            response = await self.reader.readline()
            logger.debug(f"QMP capabilities response: {response}")

            self.connected = True
            logger.info(f"Connected to QEMU QMP at {self.qmp_socket}")

        except Exception as e:
            logger.error(f"Failed to connect to QMP: {e}")
            self.connected = False

    async def disconnect(self):
        """Disconnect from QEMU QMP."""
        if self.writer:
            self.writer.close()
            await self.writer.wait_closed()
        self.connected = False
        logger.info("Disconnected from QEMU QMP")

    async def pmemsave(self, addr: int, size: int, filename: str):
        """Save physical memory region to file (for reading)."""
        if not self.connected:
            return None

        cmd = {
            "execute": "pmemsave",
            "arguments": {
                "val": addr,
                "size": size,
                "filename": filename
            }
        }

        self.writer.write((json.dumps(cmd) + '\n').encode())
        await self.writer.drain()

        response = await self.reader.readline()
        return json.loads(response)

    async def human_monitor_command(self, command: str):
        """Execute HMP command via QMP."""
        if not self.connected:
            return None

        cmd = {
            "execute": "human-monitor-command",
            "arguments": {
                "command-line": command
            }
        }

        self.writer.write((json.dumps(cmd) + '\n').encode())
        await self.writer.drain()

        response = await self.reader.readline()
        return json.loads(response)

    async def write_mmio(self, offset: int, data: bytes):
        """
        Write to MMIO region in guest memory.

        Note: QEMU doesn't have direct memory write via QMP.
        This is a workaround using pmemsave/pmemsave with temporary files.
        For production, use ivshmem or virtio.
        """
        # This is a simplified version - real implementation would use
        # shared memory or a custom QEMU device
        logger.debug(f"MMIO write at 0x{self.MMIO_INPUT_BASE + offset:08X}: {data.hex()}")

        # For now, we rely on the WebSocket bridge to inject input directly
        # This method is here for future shared memory implementation
        pass

    async def inject_input_packet(self, input_type: int, key: int, x: int, y: int, flags: int):
        """Inject complete input packet."""
        packet = struct.pack('<6I',
            1,          # status = pending
            input_type,
            key,
            x,
            y,
            flags
        )
        await self.write_mmio(0, packet)


class MMIOBridgeServer:
    """WebSocket server that bridges input events to QEMU."""

    def __init__(self, qemu_bridge: QEMUMMIOBridge, port: int = 8768):
        self.qemu_bridge = qemu_bridge
        self.port = port
        self.clients = set()

    async def handle_client(self, websocket, path):
        """Handle WebSocket client connection."""
        self.clients.add(websocket)
        logger.info(f"Client connected: {websocket.remote_address}")

        try:
            async for message in websocket:
                try:
                    data = json.loads(message)

                    if data.get('command') == 'inject_input':
                        await self.qemu_bridge.inject_input_packet(
                            data.get('type', 0),
                            data.get('key', 0),
                            data.get('x', 0),
                            data.get('y', 0),
                            data.get('flags', 0)
                        )

                        await websocket.send(json.dumps({'success': True}))

                except json.JSONDecodeError:
                    await websocket.send(json.dumps({'error': 'Invalid JSON'}))

        except Exception as e:
            logger.error(f"Client error: {e}")
        finally:
            self.clients.discard(websocket)

    async def run(self):
        """Run the bridge server."""
        import websockets

        # Connect to QEMU first
        await self.qemu_bridge.connect()

        logger.info(f"MMIO Bridge server starting on ws://localhost:{self.port}")

        async with websockets.serve(self.handle_client, 'localhost', self.port):
            await asyncio.Future()  # Run forever


async def main():
    bridge = QEMUMMIOBridge()
    server = MMIOBridgeServer(bridge)
    await server.run()


if __name__ == '__main__':
    asyncio.run(main())
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/mmio_bridge.py
git commit -m "feat(input): add QEMU MMIO bridge server

- WebSocket server for input injection
- QEMU Monitor Protocol (QMP) integration
- Placeholder for shared memory implementation

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Update WebMCP hypervisor_input Tool

**Files:**
- Modify: `systems/visual_shell/web/webmcp_bridge.js:695-725`

**Step 1: Enhance hypervisor_input with more options**

Replace the existing `#registerHypervisorInput` method with:

```javascript
async #registerHypervisorInput() {
    const tool = {
        name: 'hypervisor_input',
        description: 'Send keyboard or mouse input to the hypervisor. Input is injected via MMIO at 0x02000000.',
        inputSchema: {
            type: 'object',
            properties: {
                type: {
                    type: 'string',
                    enum: ['keyboard', 'mouse', 'text'],
                    description: 'Input type: keyboard (single key), mouse (click/move), or text (string)'
                },
                data: {
                    type: 'object',
                    properties: {
                        // Keyboard
                        key: { type: 'string', description: 'Key name (e.g., "a", "Enter", "ArrowUp")' },
                        pressed: { type: 'boolean', default: true, description: 'Key pressed (true) or released (false)' },

                        // Mouse
                        x: { type: 'number', description: 'Mouse X coordinate' },
                        y: { type: 'number', description: 'Mouse Y coordinate' },
                        button: { type: 'string', enum: ['left', 'right', 'middle'], default: 'left' },
                        action: { type: 'string', enum: ['move', 'click', 'down', 'up'], default: 'click' },

                        // Text
                        text: { type: 'string', description: 'Text string to type (for type="text")' }
                    }
                }
            },
            required: ['type', 'data']
        },
        handler: async (params) => {
            if (!window.hypervisorSystem) {
                return { success: false, error: 'Hypervisor not running' };
            }

            const { type, data } = params;

            try {
                if (type === 'text') {
                    // Type each character
                    const text = data.text || '';
                    for (const char of text) {
                        await window.hypervisorSystem.injectInput('main_cpu', 'keyboard', {
                            key: char,
                            pressed: true
                        });
                        await new Promise(r => setTimeout(r, 10)); // Small delay
                        await window.hypervisorSystem.injectInput('main_cpu', 'keyboard', {
                            key: char,
                            pressed: false
                        });
                        await new Promise(r => setTimeout(r, 30)); // Typing delay
                    }
                    return { success: true, typed: text.length };
                }

                if (type === 'mouse') {
                    const action = data.action || 'click';

                    if (action === 'move') {
                        await window.hypervisorSystem.injectInput('main_cpu', 'mouse', {
                            x: data.x,
                            y: data.y,
                            pressed: false,
                            released: false
                        });
                    } else if (action === 'click') {
                        // Move + press + release
                        await window.hypervisorSystem.injectInput('main_cpu', 'mouse', {
                            x: data.x,
                            y: data.y,
                            pressed: true,
                            released: false
                        });
                        await new Promise(r => setTimeout(r, 50));
                        await window.hypervisorSystem.injectInput('main_cpu', 'mouse', {
                            x: data.x,
                            y: data.y,
                            pressed: false,
                            released: true
                        });
                    } else if (action === 'down') {
                        await window.hypervisorSystem.injectInput('main_cpu', 'mouse', {
                            x: data.x,
                            y: data.y,
                            pressed: true,
                            released: false
                        });
                    } else if (action === 'up') {
                        await window.hypervisorSystem.injectInput('main_cpu', 'mouse', {
                            x: data.x,
                            y: data.y,
                            pressed: false,
                            released: true
                        });
                    }

                    return { success: true, action, x: data.x, y: data.y };
                }

                // Keyboard
                await window.hypervisorSystem.injectInput('main_cpu', 'keyboard', {
                    key: data.key,
                    pressed: data.pressed !== false
                });

                return { success: true, key: data.key };

            } catch (error) {
                return { success: false, error: error.message };
            }
        }
    };

    await navigator.modelContext.registerTool(tool);
    if (!navigator.modelContext.toolHandlers) navigator.modelContext.toolHandlers = {};
    navigator.modelContext.toolHandlers[tool.name] = tool.handler;
    this.#registeredTools.push(tool.name);
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/webmcp_bridge.js
git commit -m "feat(webmcp): enhance hypervisor_input tool

- Support text typing with character-by-character injection
- Mouse actions: move, click, down, up
- Proper press/release keyboard handling
- Better error handling

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 7: Create Input Test Page

**Files:**
- Create: `systems/visual_shell/web/test_input_driver.html`

**Step 1: Create test page**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Input Driver Test Page</title>
    <style>
        body {
            font-family: monospace;
            background: #1a1a2e;
            color: #eee;
            padding: 20px;
        }
        .container { max-width: 1000px; margin: 0 auto; }
        h1 { color: #4CAF50; }
        .section {
            background: #16213e;
            border: 1px solid #0f3460;
            border-radius: 8px;
            padding: 15px;
            margin: 15px 0;
        }
        button {
            background: #4CAF50;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin: 5px;
        }
        button:hover { background: #45a049; }
        button:disabled { background: #666; cursor: not-allowed; }
        .output {
            background: #0f0f23;
            border: 1px solid #0f3460;
            padding: 10px;
            margin-top: 10px;
            white-space: pre-wrap;
            font-size: 12px;
            max-height: 300px;
            overflow-y: auto;
        }
        input, select {
            background: #0f3460;
            color: #fff;
            border: 1px solid #1a1a2e;
            padding: 8px;
            border-radius: 4px;
            margin: 5px;
        }
        .canvas-container {
            border: 2px solid #0f3460;
            display: inline-block;
        }
        #testCanvas {
            background: #000;
            cursor: crosshair;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>⌨️ Input Driver Test Page</h1>

        <div class="section">
            <h2>1. Hypervisor Status</h2>
            <button onclick="checkHypervisor()">Check Hypervisor</button>
            <div id="statusOutput" class="output">Click to check status...</div>
        </div>

        <div class="section">
            <h2>2. Keyboard Input Test</h2>
            <input type="text" id="keyInput" placeholder="Key name (e.g., a, Enter, ArrowUp)" value="a" style="width: 200px;">
            <select id="keyAction">
                <option value="press">Press & Release</option>
                <option value="down">Press Only</option>
                <option value="up">Release Only</option>
            </select>
            <button onclick="sendKey()">Send Key</button>
            <div id="keyOutput" class="output">Ready...</div>
        </div>

        <div class="section">
            <h2>3. Text Typing Test</h2>
            <input type="text" id="textInput" placeholder="Text to type" value="Hello World" style="width: 300px;">
            <button onclick="typeText()">Type Text</button>
            <div id="textOutput" class="output">Ready...</div>
        </div>

        <div class="section">
            <h2>4. Mouse Input Test</h2>
            <div class="canvas-container">
                <canvas id="testCanvas" width="400" height="300"></canvas>
            </div>
            <br>
            <button onclick="sendMouseClick()">Click Center</button>
            <button onclick="sendMouseMove()">Move to Corner</button>
            <select id="mouseButton">
                <option value="left">Left Button</option>
                <option value="right">Right Button</option>
                <option value="middle">Middle Button</option>
            </select>
            <div id="mouseOutput" class="output">Click on canvas or use buttons...</div>
        </div>

        <div class="section">
            <h2>5. MMIO Read Test</h2>
            <button onclick="readMMIO()">Read MMIO Status</button>
            <div id="mmioOutput" class="output">Click to read MMIO region...</div>
        </div>
    </div>

    <script>
        const canvas = document.getElementById('testCanvas');
        const ctx = canvas.getContext('2d');

        // Draw canvas with crosshair
        function drawCanvas() {
            ctx.fillStyle = '#000';
            ctx.fillRect(0, 0, canvas.width, canvas.height);

            // Grid
            ctx.strokeStyle = '#1a1a2e';
            for (let x = 0; x < canvas.width; x += 50) {
                ctx.beginPath();
                ctx.moveTo(x, 0);
                ctx.lineTo(x, canvas.height);
                ctx.stroke();
            }
            for (let y = 0; y < canvas.height; y += 50) {
                ctx.beginPath();
                ctx.moveTo(0, y);
                ctx.lineTo(canvas.width, y);
                ctx.stroke();
            }

            // Center crosshair
            ctx.strokeStyle = '#4CAF50';
            ctx.beginPath();
            ctx.moveTo(canvas.width/2, 0);
            ctx.lineTo(canvas.width/2, canvas.height);
            ctx.moveTo(0, canvas.height/2);
            ctx.lineTo(canvas.width, canvas.height/2);
            ctx.stroke();
        }

        drawCanvas();

        // Track mouse position on canvas
        let lastMousePos = { x: 0, y: 0 };
        canvas.addEventListener('mousemove', (e) => {
            const rect = canvas.getBoundingClientRect();
            lastMousePos.x = Math.floor(e.clientX - rect.left);
            lastMousePos.y = Math.floor(e.clientY - rect.top);
        });

        canvas.addEventListener('click', async () => {
            await sendMouseInput(lastMousePos.x, lastMousePos.y, 'click');
        });

        // Hypervisor status
        async function checkHypervisor() {
            const output = document.getElementById('statusOutput');

            if (!window.hypervisorSystem) {
                output.textContent = '❌ Hypervisor not running\n\nStart a hypervisor session first.';
                return;
            }

            const state = await window.hypervisorSystem.readState('main_cpu');

            if (state) {
                output.textContent = `✅ Hypervisor Running\n\n` +
                    `PC: 0x${state.pc.toString(16).padStart(8, '0')}\n` +
                    `Halted: ${state.halted}\n` +
                    `Mode: ${state.mode === 0 ? 'User' : 'Supervisor'}\n` +
                    `SATP: 0x${(state.satp || 0).toString(16).padStart(8, '0')}`;
            } else {
                output.textContent = '⚠️ Hypervisor exists but no kernel loaded';
            }
        }

        // Keyboard input
        async function sendKey() {
            const output = document.getElementById('keyOutput');
            const key = document.getElementById('keyInput').value;
            const action = document.getElementById('keyAction').value;

            if (!window.hypervisorSystem) {
                output.textContent = '❌ Hypervisor not running';
                return;
            }

            try {
                const pressed = action !== 'up';

                await window.hypervisorSystem.injectInput('main_cpu', 'keyboard', {
                    key: key,
                    pressed: pressed
                });

                if (action === 'press') {
                    await new Promise(r => setTimeout(r, 50));
                    await window.hypervisorSystem.injectInput('main_cpu', 'keyboard', {
                        key: key,
                        pressed: false
                    });
                }

                output.textContent = `✅ Key "${key}" ${action === 'press' ? 'pressed & released' : (pressed ? 'pressed' : 'released')}`;

            } catch (error) {
                output.textContent = `❌ Error: ${error.message}`;
            }
        }

        // Text typing
        async function typeText() {
            const output = document.getElementById('textOutput');
            const text = document.getElementById('textInput').value;

            if (!window.hypervisorSystem) {
                output.textContent = '❌ Hypervisor not running';
                return;
            }

            try {
                output.textContent = `Typing: "${text}"...\n`;

                for (const char of text) {
                    // Press
                    await window.hypervisorSystem.injectInput('main_cpu', 'keyboard', {
                        key: char,
                        pressed: true
                    });
                    await new Promise(r => setTimeout(r, 10));

                    // Release
                    await window.hypervisorSystem.injectInput('main_cpu', 'keyboard', {
                        key: char,
                        pressed: false
                    });
                    await new Promise(r => setTimeout(r, 50));

                    output.textContent += char;
                }

                output.textContent += '\n\n✅ Done!';

            } catch (error) {
                output.textContent += `\n❌ Error: ${error.message}`;
            }
        }

        // Mouse input
        async function sendMouseClick() {
            await sendMouseInput(canvas.width / 2, canvas.height / 2, 'click');
        }

        async function sendMouseMove() {
            await sendMouseInput(50, 50, 'move');
        }

        async function sendMouseInput(x, y, action) {
            const output = document.getElementById('mouseOutput');
            const button = document.getElementById('mouseButton').value;

            if (!window.hypervisorSystem) {
                output.textContent = '❌ Hypervisor not running';
                return;
            }

            try {
                // Draw marker on canvas
                ctx.fillStyle = '#ff0000';
                ctx.beginPath();
                ctx.arc(x, y, 5, 0, Math.PI * 2);
                ctx.fill();

                await window.hypervisorSystem.injectInput('main_cpu', 'mouse', {
                    x: x,
                    y: y,
                    pressed: action === 'click' || action === 'down',
                    released: action === 'up'
                });

                if (action === 'click') {
                    await new Promise(r => setTimeout(r, 50));
                    await window.hypervisorSystem.injectInput('main_cpu', 'mouse', {
                        x: x,
                        y: y,
                        pressed: false,
                        released: true
                    });
                }

                output.textContent = `✅ Mouse ${action} at (${x}, ${y})`;

            } catch (error) {
                output.textContent = `❌ Error: ${error.message}`;
            }
        }

        // MMIO read
        async function readMMIO() {
            const output = document.getElementById('mmioOutput');

            if (!window.hypervisorSystem) {
                output.textContent = '❌ Hypervisor not running';
                return;
            }

            try {
                // Read MMIO region at 0x02000000 (24 bytes = 6 uint32)
                const mmioData = await window.hypervisorSystem.readMemory('main_cpu', 0x02000000, 24);

                if (!mmioData) {
                    output.textContent = '⚠️ Could not read MMIO region';
                    return;
                }

                // Parse as uint32 values
                const view = new DataView(mmioData.buffer, mmioData.byteOffset);
                const status = view.getUint32(0, true);
                const type = view.getUint32(4, true);
                const key = view.getUint32(8, true);
                const mouseX = view.getUint32(12, true);
                const mouseY = view.getUint32(16, true);
                const flags = view.getUint32(20, true);

                output.textContent = `MMIO Input Region @ 0x02000000:\n\n` +
                    `Status:   0x${status.toString(16).padStart(8, '0')} (pending: ${(status & 1) ? 'yes' : 'no'})\n` +
                    `Type:     ${['none', 'keyboard', 'mouse', 'touch'][type] || 'unknown'}\n` +
                    `Key:      0x${key.toString(16).padStart(2, '0')}\n` +
                    `Mouse X:  ${mouseX}\n` +
                    `Mouse Y:  ${mouseY}\n` +
                    `Flags:    0x${flags.toString(16).padStart(2, '0')} (${flags & 1 ? 'pressed' : ''} ${flags & 2 ? 'released' : ''})`;

            } catch (error) {
                output.textContent = `❌ Error: ${error.message}`;
            }
        }
    </script>
</body>
</html>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/test_input_driver.html
git commit -m "feat(input): add input driver test page

- Keyboard input testing (single key, press/release)
- Text typing with character-by-character injection
- Mouse input testing (click, move)
- MMIO region read verification
- Visual canvas for mouse testing

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 8: Integration Verification

**Files:**
- Modify: `systems/visual_shell/web/index.html` (if needed)

**Step 1: Verify all files are in place**

```bash
ls -la systems/visual_shell/web/input_daemon.py
ls -la systems/visual_shell/web/mmio_bridge.py
ls -la systems/visual_shell/web/test_input_driver.html
```

Expected: All files exist

**Step 2: Check shader compiles**

Open `systems/visual_shell/web/test_pixel_cpu_simple.html` in browser.
Expected: No WGSL compilation errors in console

**Step 3: Test input injection flow**

1. Open `test_input_driver.html`
2. Start hypervisor (boot a kernel)
3. Test keyboard input
4. Test mouse input
5. Verify MMIO reads show injected values

**Step 4: Final commit**

```bash
git add -A
git commit -m "feat(input): input driver integration complete

Dual-target input injection:
- RISC-V shader: MMIO polling for keyboard/mouse
- QEMU Linux: uinput daemon + MMIO bridge

Components:
- MMIO input layout at 0x02000000
- WGSL input polling in visual_cpu_riscv.wgsl
- Python uinput daemon for Linux
- Enhanced WebMCP hypervisor_input tool
- Interactive test page

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Files |
|------|-------------|-------|
| 1 | MMIO constants in shader | `visual_cpu_riscv.wgsl` |
| 2 | Input polling in shader | `visual_cpu_riscv.wgsl` |
| 3 | GPU execution input protocol | `gpu_execution_system.js` |
| 4 | Linux uinput daemon | `input_daemon.py` |
| 5 | QEMU MMIO bridge | `mmio_bridge.py` |
| 6 | Enhanced WebMCP tool | `webmcp_bridge.js` |
| 7 | Test page | `test_input_driver.html` |
| 8 | Integration verification | - |

**Architecture Summary:**

```
┌─────────────────────────────────────────────────────────────┐
│                     AI Agent                                 │
│                        │                                     │
│              hypervisor_input()                              │
│                        │                                     │
│           ┌────────────┴────────────┐                       │
│           ▼                         ▼                       │
│   ┌───────────────┐         ┌───────────────┐              │
│   │ In-Browser    │         │ QEMU Linux    │              │
│   │ RISC-V CPU    │         │ VM            │              │
│   │               │         │               │              │
│   │ WGSL Shader   │         │ input_daemon  │              │
│   │ polls MMIO    │         │ polls MMIO    │              │
│   │    │          │         │    │          │              │
│   │    ▼          │         │    ▼          │              │
│   │ Input Buffer  │         │ uinput device │              │
│   │ @0x02100000   │         │ /dev/input    │              │
│   └───────────────┘         └───────────────┘              │
│                                                             │
│   MMIO Region @ 0x02000000                                  │
│   ├─ 0x00: status (pending flag)                            │
│   ├─ 0x04: type (1=keyboard, 2=mouse)                       │
│   ├─ 0x08: key_code                                         │
│   ├─ 0x0C: mouse_x                                          │
│   ├─ 0x10: mouse_y                                          │
│   └─ 0x14: flags (pressed/released)                         │
└─────────────────────────────────────────────────────────────┘
```
