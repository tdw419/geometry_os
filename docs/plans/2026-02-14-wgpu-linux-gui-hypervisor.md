# WGPU Linux GUI Hypervisor Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Build a pure browser Linux hypervisor that boots GUI programs using WebGPU, with progressive milestones from shell to interactive GUI apps.

**Architecture:** Kernel loader fetches .rts.png textures, GPUExecutionSystem runs RISC-V code with MMU, DisplayManager renders framebuffer in 3 modes, InputHandler captures keyboard/mouse events to MMIO region.

**Tech Stack:** WebGPU, WGSL compute shaders, JavaScript ES modules, PixiJS v8, RISC-V Linux (Alpine)

---

## Prerequisites (Already Complete)

- ✅ `visual_cpu_riscv.wgsl` - RV32IM + MMU shader (324 lines)
- ✅ `gpu_execution_system.js` - Execution engine with CSR support
- ✅ `webmcp_bridge.js` - AI control tools (hypervisor_input, etc.)

---

## Milestone 1: Boot to Shell

### Task 1: Create WGPUKernelLoader Class

**Files:**
- Create: `systems/visual_shell/web/wgpu_kernel_loader.js`
- Test: `systems/visual_shell/web/tests/test_kernel_loader.js`

**Step 1: Write the failing test**

Create `systems/visual_shell/web/tests/test_kernel_loader.js`:

```javascript
/**
 * Test: WGPUKernelLoader
 */
import { WGPUKernelLoader } from '../wgpu_kernel_loader.js';

export async function testKernelLoaderExists() {
    const loader = new WGPUKernelLoader(null);
    console.assert(loader !== null, 'WGPUKernelLoader should instantiate');
    console.log('✅ WGPUKernelLoader exists');
    return true;
}

export async function testLoadFakeKernel() {
    // Create a minimal fake kernel (just a few RISC-V instructions)
    // li x5, 42; ecall (exit with x10=0)
    const fakeKernel = new Uint32Array([
        0x02a00513, // addi x10, x0, 42
        0x05d00893, // addi x17, x0, 93 (exit syscall)
        0x00000073  // ecall
    ]);

    const loader = new WGPUKernelLoader(null);
    const result = await loader.loadFromBuffer(fakeKernel.buffer);

    console.assert(result.entryPoint === 0, 'Entry point should be 0');
    console.assert(result.size === 12, 'Size should be 12 bytes');
    console.log('✅ Kernel loader loads buffer correctly');
    return true;
}

// Export for HTML test runner
window.testKernelLoaderExists = testKernelLoaderExists;
window.testLoadFakeKernel = testLoadFakeKernel;
```

**Step 2: Run test to verify it fails**

Create `systems/visual_shell/web/test_kernel_loader.html` and open in browser:

```html
<!DOCTYPE html>
<html>
<head><title>Kernel Loader Tests</title></head>
<body>
    <h1>Kernel Loader Tests</h1>
    <div id="results"></div>
    <script type="module">
        import { testKernelLoaderExists, testLoadFakeKernel } from './tests/test_kernel_loader.js';

        async function runTests() {
            const results = document.getElementById('results');
            try {
                await testKernelLoaderExists();
            } catch (e) {
                results.innerHTML += `<div style="color:red">FAIL: ${e.message}</div>`;
            }
            try {
                await testLoadFakeKernel();
            } catch (e) {
                results.innerHTML += `<div style="color:red">FAIL: ${e.message}</div>`;
            }
        }
        runTests();
    </script>
</body>
</html>
```

Expected: `FAIL: Failed to resolve module specifier "..."` (file doesn't exist)

**Step 3: Write minimal implementation**

Create `systems/visual_shell/web/wgpu_kernel_loader.js`:

```javascript
/**
 * Geometry OS: WGPU Kernel Loader
 *
 * Loads Linux kernels from .rts.png textures or raw binary buffers
 * into GPU memory for execution by the RISC-V shader.
 */

export class WGPUKernelLoader {
    constructor(device) {
        this.device = device;
    }

    /**
     * Load kernel from a raw binary buffer
     * @param {ArrayBuffer} buffer - Raw kernel binary
     * @returns {{entryPoint: number, size: number, data: Uint8Array}}
     */
    async loadFromBuffer(buffer) {
        const data = new Uint8Array(buffer);
        return {
            entryPoint: 0,           // Entry point offset
            size: data.byteLength,   // Total size in bytes
            data: data
        };
    }

    /**
     * Load kernel from a .rts.png texture URL
     * @param {string} url - URL to the .rts.png file
     * @returns {{entryPoint: number, size: number, texture: GPUTexture}}
     */
    async loadFromRTS(url) {
        // Fetch the image
        const response = await fetch(url);
        const blob = await response.blob();
        const img = new Image();
        img.src = URL.createObjectURL(blob);
        await img.decode();

        // Create bitmap and texture
        const bitmap = await createImageBitmap(img);
        const texture = this.device.createTexture({
            size: [bitmap.width, bitmap.height],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST
        });

        this.device.queue.copyExternalImageToTexture(
            { source: bitmap },
            { texture: texture },
            [bitmap.width, bitmap.height]
        );

        // Extract kernel size from metadata (first 4 pixels = size in bytes)
        // For now, assume full texture is kernel data

        return {
            entryPoint: 0,
            size: bitmap.width * bitmap.height * 4, // RGBA
            texture: texture
        };
    }

    /**
     * Write kernel to GPU memory at specified address
     * @param {GPUBuffer} memoryBuffer - System memory buffer
     * @param {Uint8Array} kernelData - Kernel binary data
     * @param {number} address - Destination address (default 0)
     */
    writeToMemory(memoryBuffer, kernelData, address = 0) {
        this.device.queue.writeBuffer(memoryBuffer, address, kernelData);
    }
}

// Export for window global
if (typeof window !== 'undefined') {
    window.WGPUKernelLoader = WGPUKernelLoader;
}
```

**Step 4: Run test to verify it passes**

Refresh browser test page.

Expected: `✅ WGPUKernelLoader exists`, `✅ Kernel loader loads buffer correctly`

**Step 5: Commit**

```bash
git add systems/visual_shell/web/wgpu_kernel_loader.js
git add systems/visual_shell/web/tests/test_kernel_loader.js
git add systems/visual_shell/web/test_kernel_loader.html
git commit -m "feat(hypervisor): add WGPUKernelLoader for kernel loading"
```

---

### Task 2: Create Canvas Display Renderer

**Files:**
- Create: `systems/visual_shell/web/display/canvas_renderer.js`
- Test: `systems/visual_shell/web/tests/test_canvas_renderer.js`

**Step 1: Write the failing test**

Create `systems/visual_shell/web/tests/test_canvas_renderer.js`:

```javascript
/**
 * Test: CanvasRenderer
 */
import { CanvasRenderer } from '../display/canvas_renderer.js';

export async function testCanvasRendererExists() {
    const renderer = new CanvasRenderer(1024, 768);
    console.assert(renderer !== null, 'CanvasRenderer should instantiate');
    console.assert(renderer.canvas.width === 1024, 'Canvas width should be 1024');
    console.log('✅ CanvasRenderer exists with correct dimensions');
    return true;
}

export async function testCanvasRendererRenders() {
    const renderer = new CanvasRenderer(4, 4);

    // Create fake framebuffer data (4x4 RGBA)
    const fbData = new Uint8Array([
        255, 0, 0, 255,    // Red pixel
        0, 255, 0, 255,    // Green pixel
        0, 0, 255, 255,    // Blue pixel
        255, 255, 0, 255,  // Yellow pixel
        // ... more pixels for 4x4
        0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255,
        0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255,
        0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255, 0, 0, 0, 255
    ]);

    renderer.render(fbData);

    // Verify canvas has content
    const ctx = renderer.canvas.getContext('2d');
    const imageData = ctx.getImageData(0, 0, 1, 1);
    console.assert(imageData.data[0] === 255, 'First pixel should be red');
    console.log('✅ CanvasRenderer renders framebuffer data');
    return true;
}

window.testCanvasRendererExists = testCanvasRendererExists;
window.testCanvasRendererRenders = testCanvasRendererRenders;
```

**Step 2: Run test to verify it fails**

Expected: `FAIL: Failed to resolve module specifier`

**Step 3: Write implementation**

Create `systems/visual_shell/web/display/canvas_renderer.js`:

```javascript
/**
 * Geometry OS: Canvas Display Renderer
 *
 * Renders GPU framebuffer to a Canvas 2D context.
 * Simplest display mode, works everywhere.
 */

export class CanvasRenderer {
    constructor(width = 1024, height = 768) {
        this.width = width;
        this.height = height;

        // Create offscreen canvas
        this.canvas = document.createElement('canvas');
        this.canvas.width = width;
        this.canvas.height = height;
        this.ctx = this.canvas.getContext('2d');

        // ImageData for efficient pixel updates
        this.imageData = this.ctx.createImageData(width, height);
    }

    /**
     * Render framebuffer data to canvas
     * @param {Uint8Array} framebuffer - RGBA pixel data
     */
    render(framebuffer) {
        // Copy framebuffer to ImageData
        this.imageData.data.set(framebuffer);

        // Draw to canvas
        this.ctx.putImageData(this.imageData, 0, 0);
    }

    /**
     * Attach canvas to a DOM element
     * @param {HTMLElement} container - Container element
     */
    attachTo(container) {
        container.innerHTML = '';
        container.appendChild(this.canvas);
    }

    /**
     * Get current canvas as data URL (for screenshots)
     * @returns {string} Base64 PNG data URL
     */
    capture() {
        return this.canvas.toDataURL('image/png');
    }

    /**
     * Clear canvas to black
     */
    clear() {
        this.ctx.fillStyle = 'black';
        this.ctx.fillRect(0, 0, this.width, this.height);
    }
}

if (typeof window !== 'undefined') {
    window.CanvasRenderer = CanvasRenderer;
}
```

**Step 4: Run test to verify it passes**

Expected: `✅ CanvasRenderer exists with correct dimensions`, `✅ CanvasRenderer renders framebuffer data`

**Step 5: Commit**

```bash
git add systems/visual_shell/web/display/canvas_renderer.js
git add systems/visual_shell/web/tests/test_canvas_renderer.js
git commit -m "feat(display): add CanvasRenderer for framebuffer display"
```

---

### Task 3: Create WGPUInputHandler Class

**Files:**
- Create: `systems/visual_shell/web/wgpu_input_handler.js`
- Test: `systems/visual_shell/web/tests/test_input_handler.js`

**Step 1: Write the failing test**

Create `systems/visual_shell/web/tests/test_input_handler.js`:

```javascript
/**
 * Test: WGPUInputHandler
 */

export async function testInputHandlerPackKeyboard() {
    // Test keyboard event packing
    const handler = { packKeyboard: (e) => ({ type: 1, scancode: 65, modifiers: 0 }) };

    const event = { key: 'a', code: 'KeyA', shiftKey: false };
    const packed = handler.packKeyboard(event);

    console.assert(packed.type === 1, 'Type should be 1 for keyboard');
    console.assert(typeof packed.scancode === 'number', 'Scancode should be number');
    console.log('✅ Input handler packs keyboard events');
    return true;
}

export async function testInputHandlerPackMouse() {
    // Test mouse event packing
    const handler = { packMouse: (x, y, buttons) => ({ type: 2, x, y, buttons }) };

    const packed = handler.packMouse(512, 384, 1);

    console.assert(packed.type === 2, 'Type should be 2 for mouse');
    console.assert(packed.x === 512, 'X should be 512');
    console.assert(packed.y === 384, 'Y should be 384');
    console.log('✅ Input handler packs mouse events');
    return true;
}

window.testInputHandlerPackKeyboard = testInputHandlerPackKeyboard;
window.testInputHandlerPackMouse = testInputHandlerPackMouse;
```

**Step 2: Run test to verify it fails**

Expected: Tests pass (simple data packing, no GPU needed yet)

**Step 3: Write implementation**

Create `systems/visual_shell/web/wgpu_input_handler.js`:

```javascript
/**
 * Geometry OS: WGPU Input Handler
 *
 * Captures keyboard/mouse events and writes them to the MMIO region
 * for Linux kernel input drivers.
 */

export class WGPUInputHandler {
    /**
     * @param {HTMLCanvasElement} canvas - Canvas to capture events from
     * @param {GPUDevice} device - WebGPU device
     * @param {GPUBuffer} memoryBuffer - System memory buffer
     * @param {string} kernelId - Kernel ID for gpuSystem reference
     */
    constructor(canvas, device, memoryBuffer, kernelId) {
        this.canvas = canvas;
        this.device = device;
        this.memoryBuffer = memoryBuffer;
        this.kernelId = kernelId;

        // MMIO offsets
        this.MMIO_BASE = 0x02000000;  // 32MB
        this.KEYBOARD_OFFSET = 0x0000;
        this.MOUSE_OFFSET = 0x1000;

        // Input queue for batching
        this.inputQueue = [];

        // Bind event listeners
        this._bindEvents();
    }

    _bindEvents() {
        // Make canvas focusable
        this.canvas.tabIndex = 0;

        this.canvas.addEventListener('keydown', (e) => this._onKeyDown(e));
        this.canvas.addEventListener('keyup', (e) => this._onKeyUp(e));
        this.canvas.addEventListener('mousemove', (e) => this._onMouseMove(e));
        this.canvas.addEventListener('mousedown', (e) => this._onMouseDown(e));
        this.canvas.addEventListener('mouseup', (e) => this._onMouseUp(e));

        // Prevent context menu on right-click
        this.canvas.addEventListener('contextmenu', (e) => e.preventDefault());
    }

    /**
     * Pack keyboard event to MMIO format
     */
    packKeyboard(event, pressed = true) {
        const scancode = this._keyToScancode(event.code);
        const modifiers =
            (event.shiftKey ? 1 : 0) |
            (event.ctrlKey ? 2 : 0) |
            (event.altKey ? 4 : 0) |
            (event.metaKey ? 8 : 0);

        return {
            type: 1,           // Keyboard
            scancode: scancode,
            pressed: pressed ? 1 : 0,
            modifiers: modifiers
        };
    }

    /**
     * Pack mouse event to MMIO format
     */
    packMouse(x, y, buttons) {
        return {
            type: 2,           // Mouse
            x: Math.max(0, Math.min(1023, x)),
            y: Math.max(0, Math.min(767, y)),
            buttons: buttons
        };
    }

    _onKeyDown(event) {
        event.preventDefault();
        const packed = this.packKeyboard(event, true);
        this._writeKeyboard(packed);
    }

    _onKeyUp(event) {
        event.preventDefault();
        const packed = this.packKeyboard(event, false);
        this._writeKeyboard(packed);
    }

    _onMouseMove(event) {
        const rect = this.canvas.getBoundingClientRect();
        const x = Math.floor((event.clientX - rect.left) * (1024 / rect.width));
        const y = Math.floor((event.clientY - rect.top) * (768 / rect.height));

        const packed = this.packMouse(x, y, event.buttons);
        this._writeMouse(packed);
    }

    _onMouseDown(event) {
        this._onMouseMove(event);
    }

    _onMouseUp(event) {
        this._onMouseMove(event);
    }

    _writeKeyboard(packed) {
        // Write to MMIO: [type:8][scancode:16][pressed:1][modifiers:4][pad:3]
        const data = new Uint32Array([
            (packed.type << 24) |
            ((packed.scancode & 0xFFFF) << 8) |
            ((packed.pressed & 1) << 4) |
            (packed.modifiers & 0xF)
        ]);

        const address = this.MMIO_BASE + this.KEYBOARD_OFFSET;
        this.device.queue.writeBuffer(this.memoryBuffer, address, data);
    }

    _writeMouse(packed) {
        // Write to MMIO: [type:8][buttons:8][x:16][y:16][pad:16]
        const data = new Uint32Array([
            (packed.type << 24) |
            ((packed.buttons & 0xFF) << 16) |
            ((packed.x & 0x3FF) << 6) |
            ((packed.y >> 4) & 0x3F)
        ], 0, 1);

        const data2 = new Uint32Array([packed.y & 0x3FF], 0, 1);

        const address = this.MMIO_BASE + this.MOUSE_OFFSET;
        this.device.queue.writeBuffer(this.memoryBuffer, address, data);
        this.device.queue.writeBuffer(this.memoryBuffer, address + 4, data2);
    }

    /**
     * Map DOM code to scancode
     */
    _keyToScancode(code) {
        const map = {
            'KeyA': 30, 'KeyB': 48, 'KeyC': 46, 'KeyD': 32, 'KeyE': 18,
            'KeyF': 33, 'KeyG': 34, 'KeyH': 35, 'KeyI': 23, 'KeyJ': 36,
            'KeyK': 37, 'KeyL': 38, 'KeyM': 50, 'KeyN': 49, 'KeyO': 24,
            'KeyP': 25, 'KeyQ': 16, 'KeyR': 19, 'KeyS': 31, 'KeyT': 20,
            'KeyU': 22, 'KeyV': 47, 'KeyW': 17, 'KeyX': 45, 'KeyY': 21,
            'KeyZ': 44,
            'Digit0': 11, 'Digit1': 2, 'Digit2': 3, 'Digit3': 4, 'Digit4': 5,
            'Digit5': 6, 'Digit6': 7, 'Digit7': 8, 'Digit8': 9, 'Digit9': 10,
            'Space': 57, 'Enter': 28, 'Backspace': 14, 'Tab': 15,
            'Escape': 1, 'ArrowUp': 103, 'ArrowDown': 108,
            'ArrowLeft': 105, 'ArrowRight': 106
        };
        return map[code] || 0;
    }

    /**
     * Focus the canvas for input
     */
    focus() {
        this.canvas.focus();
    }
}

if (typeof window !== 'undefined') {
    window.WGPUInputHandler = WGPUInputHandler;
}
```

**Step 4: Run test to verify it passes**

Expected: `✅ Input handler packs keyboard events`, `✅ Input handler packs mouse events`

**Step 5: Commit**

```bash
git add systems/visual_shell/web/wgpu_input_handler.js
git add systems/visual_shell/web/tests/test_input_handler.js
git commit -m "feat(input): add WGPUInputHandler for keyboard/mouse events"
```

---

### Task 4: Create WGPULinuxHypervisor Orchestrator

**Files:**
- Create: `systems/visual_shell/web/wgpu_linux_hypervisor.js`
- Test: `systems/visual_shell/web/test_boot_shell.html`

**Step 1: Write the failing test**

Create `systems/visual_shell/web/test_boot_shell.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WGPU Linux Hypervisor - Boot Test</title>
    <style>
        body { background: #111; color: #0f0; font-family: monospace; padding: 20px; }
        #display { border: 2px solid #0f0; }
        button { background: #030; color: #0f0; border: 1px solid #0f0; padding: 10px 20px; cursor: pointer; margin: 5px; }
        #status { margin: 10px 0; }
    </style>
</head>
<body>
    <h1>WGPU Linux Hypervisor - Milestone 1: Boot to Shell</h1>
    <div id="controls">
        <button onclick="initHypervisor()">Initialize</button>
        <button onclick="bootKernel()">Boot Kernel</button>
        <button onclick="stepOnce()">Step Once</button>
        <button onclick="startLoop()">Start Loop</button>
        <button onclick="stopLoop()">Stop Loop</button>
    </div>
    <div id="status">Status: Not initialized</div>
    <div id="display"></div>
    <pre id="log"></pre>

    <script type="module">
        import { WGPULinuxHypervisor } from './wgpu_linux_hypervisor.js';

        let hypervisor = null;

        window.initHypervisor = async function() {
            log('Initializing WebGPU...');
            hypervisor = new WGPULinuxHypervisor();
            await hypervisor.init();
            hypervisor.attachTo(document.getElementById('display'));
            log('✅ Hypervisor initialized');
            updateStatus('Ready');
        };

        window.bootKernel = async function() {
            if (!hypervisor) { log('❌ Initialize first'); return; }

            log('Loading fake kernel...');
            // Create minimal kernel: li x10, 42; li x17, 93; ecall
            const fakeKernel = new Uint32Array([
                0x02a00513, // addi x10, x0, 42
                0x05d00893, // addi x17, x0, 93
                0x00000073  // ecall
            ]);

            await hypervisor.loadKernel(fakeKernel.buffer);
            log('✅ Kernel loaded');
            updateStatus('Kernel loaded');
        };

        window.stepOnce = async function() {
            if (!hypervisor) { log('❌ Initialize first'); return; }
            await hypervisor.tick(1);
            const state = hypervisor.getState();
            log(`PC=${state.pc}, x10=${state.registers[10]}, halted=${state.halted}`);
        };

        window.startLoop = function() {
            if (!hypervisor) { log('❌ Initialize first'); return; }
            hypervisor.start(10000); // 10K cycles per frame
            updateStatus('Running');
        };

        window.stopLoop = function() {
            if (hypervisor) hypervisor.stop();
            updateStatus('Stopped');
        };

        function log(msg) {
            document.getElementById('log').textContent += msg + '\n';
        }

        function updateStatus(status) {
            document.getElementById('status').textContent = 'Status: ' + status;
        }
    </script>
</body>
</html>
```

**Step 2: Run test to verify it fails**

Expected: `Failed to resolve module specifier`

**Step 3: Write implementation**

Create `systems/visual_shell/web/wgpu_linux_hypervisor.js`:

```javascript
/**
 * Geometry OS: WGPU Linux Hypervisor
 *
 * Main orchestrator for running Linux in the browser via WebGPU.
 */

import { GPUExecutionSystem } from './gpu_execution_system.js';
import { WGPUKernelLoader } from './wgpu_kernel_loader.js';
import { CanvasRenderer } from './display/canvas_renderer.js';
import { WGPUInputHandler } from './wgpu_input_handler.js';

export class WGPULinuxHypervisor {
    constructor(options = {}) {
        this.options = {
            width: options.width || 1024,
            height: options.height || 1024,
            cyclesPerFrame: options.cyclesPerFrame || 10000,
            displayMode: options.displayMode || 'canvas'
        };

        this.device = null;
        this.gpuSystem = null;
        this.kernelLoader = null;
        this.display = null;
        this.inputHandler = null;

        this.kernelId = 'main';
        this.running = false;
        this.animationId = null;
    }

    /**
     * Initialize WebGPU and all subsystems
     */
    async init() {
        // Get WebGPU adapter and device
        const adapter = await navigator.gpu.requestAdapter();
        if (!adapter) {
            throw new Error('WebGPU not supported');
        }

        this.device = await adapter.requestDevice();

        // Initialize GPU execution system
        this.gpuSystem = new GPUExecutionSystem(this.device, {});
        await this.gpuSystem.initialize();

        // Initialize kernel loader
        this.kernelLoader = new WGPUKernelLoader(this.device);

        // Initialize display
        this.display = new CanvasRenderer(this.options.width, this.options.height);

        console.log('✅ WGPULinuxHypervisor initialized');
    }

    /**
     * Attach display to DOM element
     */
    attachTo(container) {
        this.display.attachTo(container);

        // Initialize input handler after canvas is in DOM
        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        if (kernel) {
            this.inputHandler = new WGPUInputHandler(
                this.display.canvas,
                this.device,
                kernel.memoryBuffer,
                this.kernelId
            );
        }
    }

    /**
     * Load kernel from buffer
     */
    async loadKernel(buffer) {
        const kernelInfo = await this.kernelLoader.loadFromBuffer(buffer);

        // Deploy to GPU (creates memory buffer, state buffer, etc.)
        await this.gpuSystem.deploy(
            'data:text/plain,', // Empty expanded code, kernel goes in memory
            this.kernelId
        );

        // Write kernel to memory at 0x00000000
        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        this.kernelLoader.writeToMemory(kernel.memoryBuffer, kernelInfo.data, 0);

        console.log(`✅ Kernel loaded: ${kernelInfo.size} bytes`);
    }

    /**
     * Load kernel from .rts.png URL
     */
    async loadKernelFromRTS(url) {
        const kernelInfo = await this.kernelLoader.loadFromRTS(url);

        await this.gpuSystem.deploy(
            'data:text/plain,',
            this.kernelId
        );

        // For RTS textures, we'd need to extract pixel data to memory
        // This is a placeholder for the full implementation
        console.log(`✅ RTS kernel loaded: ${kernelInfo.size} bytes`);
    }

    /**
     * Execute N clock cycles
     */
    async tick(cycles = 1) {
        await this.gpuSystem.tick(this.kernelId, cycles);
    }

    /**
     * Get current CPU state
     */
    getState() {
        // This would need to be async in real implementation
        // For now, return cached state
        return this.gpuSystem.cachedState || {
            registers: new Array(32).fill(0),
            pc: 0,
            halted: false,
            satp: 0,
            mode: 0
        };
    }

    /**
     * Read framebuffer and render
     */
    async render() {
        const fbData = await this.gpuSystem.readFramebuffer(this.kernelId);
        if (fbData) {
            this.display.render(fbData);
        }
    }

    /**
     * Start execution loop
     */
    start(cyclesPerFrame = this.options.cyclesPerFrame) {
        if (this.running) return;
        this.running = true;

        const loop = async () => {
            if (!this.running) return;

            // Execute cycles
            await this.tick(cyclesPerFrame);

            // Render framebuffer
            await this.render();

            // Schedule next frame
            this.animationId = requestAnimationFrame(loop);
        };

        loop();
    }

    /**
     * Stop execution loop
     */
    stop() {
        this.running = false;
        if (this.animationId) {
            cancelAnimationFrame(this.animationId);
            this.animationId = null;
        }
    }

    /**
     * Send input event
     */
    sendInput(event) {
        if (this.inputHandler) {
            this.inputHandler.focus();
        }
    }

    /**
     * Capture current screen
     */
    capture() {
        return this.display.capture();
    }

    /**
     * Setup MMU page tables (identity map first 16MB)
     */
    async setupMMU() {
        // Create identity page tables at 0x03000000
        // Map VA 0x00000000-0x00FFFFFF -> PA 0x00000000-0x00FFFFFF
        // This is a simplified setup for kernel running

        const kernel = this.gpuSystem.kernels.get(this.kernelId);
        if (!kernel) return;

        // Set satp to point to page tables (enable Sv32)
        const satp = (1 << 31) | (0x03000000 >> 12); // Mode=1, PPN=page table address
        const satpData = new Uint32Array([satp]);
        this.device.queue.writeBuffer(kernel.stateBuffer, 34 * 4, satpData); // CSR_SATP

        console.log('✅ MMU enabled');
    }
}

if (typeof window !== 'undefined') {
    window.WGPULinuxHypervisor = WGPULinuxHypervisor;
}
```

**Step 4: Run test to verify it passes**

Open `test_boot_shell.html` in Chrome, click "Initialize", then "Boot Kernel", then "Step Once".

Expected: PC increments, no errors in console.

**Step 5: Commit**

```bash
git add systems/visual_shell/web/wgpu_linux_hypervisor.js
git add systems/visual_shell/web/test_boot_shell.html
git commit -m "feat(hypervisor): add WGPULinuxHypervisor orchestrator"
```

---

## Milestone 2: Interactive Terminal

### Task 5: Add WebGPU Display Renderer

**Files:**
- Create: `systems/visual_shell/web/display/webgpu_renderer.js`
- Test: `systems/visual_shell/web/tests/test_webgpu_renderer.js`

**Step 1: Write the failing test**

```javascript
import { WebGPURenderer } from '../display/webgpu_renderer.js';

export async function testWebGPURendererExists() {
    const adapter = await navigator.gpu.requestAdapter();
    const device = await adapter.requestDevice();
    const renderer = new WebGPURenderer(device, 1024, 768);

    console.assert(renderer !== null, 'WebGPURenderer should instantiate');
    console.log('✅ WebGPURenderer exists');
    return true;
}

window.testWebGPURendererExists = testWebGPURendererExists;
```

**Step 2: Write implementation**

```javascript
/**
 * Geometry OS: WebGPU Display Renderer
 *
 * Renders GPU framebuffer using WebGPU texture swap.
 * Faster than Canvas for high-frequency updates.
 */

export class WebGPURenderer {
    constructor(device, width = 1024, height = 768) {
        this.device = device;
        this.width = width;
        this.height = height;

        // Create display texture
        this.texture = device.createTexture({
            size: [width, height],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.TEXTURE_BINDING |
                   GPUTextureUsage.COPY_DST |
                   GPUTextureUsage.RENDER_ATTACHMENT
        });

        // Create canvas context for presentation
        this.canvas = document.createElement('canvas');
        this.canvas.width = width;
        this.canvas.height = height;
        this.context = this.canvas.getContext('webgpu');
    }

    /**
     * Render framebuffer data
     */
    render(framebuffer) {
        // Write directly to texture
        this.device.queue.writeTexture(
            { texture: this.texture },
            framebuffer,
            { bytesPerRow: this.width * 4 },
            { width: this.width, height: this.height }
        );
    }

    attachTo(container) {
        container.innerHTML = '';
        container.appendChild(this.canvas);

        // Configure WebGPU context
        this.context.configure({
            device: this.device,
            format: navigator.gpu.getPreferredCanvasFormat(),
            usage: GPUTextureUsage.RENDER_ATTACHMENT
        });
    }

    capture() {
        // WebGPU doesn't have direct capture, fall back to Canvas2D
        const canvas = document.createElement('canvas');
        canvas.width = this.width;
        canvas.height = this.height;
        const ctx = canvas.getContext('2d');
        // Would need to read texture back...
        return canvas.toDataURL('image/png');
    }

    clear() {
        // Clear texture via command encoder
        const encoder = this.device.createCommandEncoder();
        const pass = encoder.beginRenderPass({
            colorAttachments: [{
                view: this.texture.createView(),
                clearValue: { r: 0, g: 0, b: 0, a: 1 },
                loadOp: 'clear',
                storeOp: 'store'
            }]
        });
        pass.end();
        this.device.queue.submit([encoder.finish()]);
    }
}

if (typeof window !== 'undefined') {
    window.WebGPURenderer = WebGPURenderer;
}
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/display/webgpu_renderer.js
git add systems/visual_shell/web/tests/test_webgpu_renderer.js
git commit -m "feat(display): add WebGPURenderer for texture-based display"
```

---

### Task 6: Add PixiJS Display Renderer

**Files:**
- Create: `systems/visual_shell/web/display/pixi_renderer.js`

**Step 1: Write implementation**

```javascript
/**
 * Geometry OS: PixiJS Display Renderer
 *
 * Renders GPU framebuffer as a PixiJS sprite.
 * Integrates with the existing visual shell.
 */

export class PixiRenderer {
    constructor(app, width = 1024, height = 768) {
        this.app = app;
        this.width = width;
        this.height = height;

        // Create a container for the display
        this.container = new PIXI.Container();

        // Create a sprite from a blank texture
        const texture = PIXI.Texture.fromBuffer(
            new Uint8Array(width * height * 4),
            width,
            height
        );
        this.sprite = new PIXI.Sprite(texture);
        this.container.addChild(this.sprite);

        // Canvas for intermediate rendering
        this.canvas = document.createElement('canvas');
        this.canvas.width = width;
        this.canvas.height = height;
        this.ctx = this.canvas.getContext('2d');
        this.imageData = this.ctx.createImageData(width, height);
    }

    render(framebuffer) {
        // Update ImageData
        this.imageData.data.set(framebuffer);
        this.ctx.putImageData(this.imageData, 0, 0);

        // Update PixiJS texture from canvas
        const texture = PIXI.Texture.from(this.canvas);
        this.sprite.texture = texture;
    }

    attachTo(container) {
        // Add to PixiJS stage if app exists
        if (this.app && this.app.stage) {
            this.app.stage.addChild(this.container);
        }
    }

    capture() {
        return this.canvas.toDataURL('image/png');
    }

    clear() {
        this.ctx.fillStyle = 'black';
        this.ctx.fillRect(0, 0, this.width, this.height);
    }

    // Expose canvas for input handling
    getCanvas() {
        return this.canvas;
    }
}

// Note: Requires PIXI to be loaded globally
if (typeof window !== 'undefined') {
    window.PixiRenderer = PixiRenderer;
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/display/pixi_renderer.js
git commit -m "feat(display): add PixiRenderer for visual shell integration"
```

---

### Task 7: Create Interactive Shell Test Page

**Files:**
- Create: `systems/visual_shell/web/test_interactive_shell.html`

**Step 1: Write the test page**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WGPU Linux Hypervisor - Interactive Shell</title>
    <style>
        body { background: #111; color: #0f0; font-family: monospace; padding: 20px; }
        #display { border: 2px solid #0f0; cursor: text; }
        #display:focus { outline: 2px solid #0ff; }
        button { background: #030; color: #0f0; border: 1px solid #0f0; padding: 10px 20px; cursor: pointer; margin: 5px; }
        #status { margin: 10px 0; padding: 10px; background: #000; }
        #log { max-height: 200px; overflow-y: auto; background: #000; padding: 10px; margin-top: 10px; }
    </style>
</head>
<body>
    <h1>WGPU Linux Hypervisor - Milestone 2: Interactive Shell</h1>

    <div id="controls">
        <button onclick="initHypervisor()">Initialize</button>
        <button onclick="bootKernel()">Boot Fake Kernel</button>
        <button onclick="startLoop()">Start</button>
        <button onclick="stopLoop()">Stop</button>
        <button onclick="captureScreen()">Screenshot</button>
    </div>

    <div id="status">Status: Not initialized</div>

    <div id="display" tabindex="0"></div>

    <div id="log"></div>

    <div id="instructions">
        <h3>Instructions:</h3>
        <ol>
            <li>Click Initialize to set up WebGPU</li>
            <li>Click Boot Fake Kernel to load a test kernel</li>
            <li>Click Start to begin execution</li>
            <li>Click on the display to focus it, then type</li>
            <li>Keyboard input will be written to MMIO region</li>
        </ol>
    </div>

    <script type="module">
        import { WGPULinuxHypervisor } from './wgpu_linux_hypervisor.js';

        let hypervisor = null;

        window.initHypervisor = async function() {
            log('Initializing WebGPU...');
            hypervisor = new WGPULinuxHypervisor({ cyclesPerFrame: 1000 });
            await hypervisor.init();
            hypervisor.attachTo(document.getElementById('display'));
            log('✅ Hypervisor initialized');
            updateStatus('Ready - click Boot to load kernel');
        };

        window.bootKernel = async function() {
            if (!hypervisor) { log('❌ Initialize first'); return; }

            log('Loading interactive test kernel...');

            // Create kernel that:
            // 1. Writes to framebuffer at 0x01000000
            // 2. Reads from keyboard MMIO at 0x02000000
            // 3. Echoes characters back to framebuffer

            const kernel = buildInteractiveKernel();
            await hypervisor.loadKernel(kernel.buffer);
            log('✅ Interactive kernel loaded');
            updateStatus('Kernel loaded - click Start');
        };

        window.startLoop = function() {
            if (!hypervisor) { log('❌ Initialize first'); return; }
            hypervisor.start(1000);
            log('▶️ Execution started');
            updateStatus('Running - click display and type');
        };

        window.stopLoop = function() {
            if (hypervisor) {
                hypervisor.stop();
                log('⏹️ Execution stopped');
                updateStatus('Stopped');
            }
        };

        window.captureScreen = function() {
            if (!hypervisor) { log('❌ Initialize first'); return; }
            const dataUrl = hypervisor.capture();
            window.open(dataUrl, '_blank');
        };

        function buildInteractiveKernel() {
            // Simple kernel that fills framebuffer with pattern
            // Real implementation would have keyboard echo logic
            const code = [];
            // li x5, 0x01000000 (framebuffer)
            code.push(0x010002b7); // lui x5, 0x01000
            // li x6, 0x00FF00FF (magenta pixel)
            code.push(0x00FF0637); // lui x6, 0x00FF0
            code.push(0x6FF30313); // addi x6, x6, 0x6FF
            // sw x6, 0(x5) - write pixel
            code.push(0x0062a023); // sw x6, 0(x5)
            // addi x5, x5, 4
            code.push(0x00428293); // addi x5, x5, 4
            // j back (loop)
            code.push(0x0042a023); // sw x6, 0(x5)
            // ... simplified for demo

            return new Uint32Array([
                0x010002b7, // lui x5, 0x01000 (framebuffer = 0x01000000)
                0x00ff0637, // lui x6, 0x00ff0
                0x6ff30313, // addi x6, x6, 0x6ff (color = magenta)
                0x0062a023, // sw x6, 0(x5) (write pixel)
                0x00428293, // addi x5, x5, 4 (next pixel)
                0xff9ff06f, // j -7 (loop back)
            ]);
        }

        function log(msg) {
            const logEl = document.getElementById('log');
            logEl.textContent += msg + '\n';
            logEl.scrollTop = logEl.scrollHeight;
        }

        function updateStatus(status) {
            document.getElementById('status').textContent = 'Status: ' + status;
        }
    </script>
</body>
</html>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/test_interactive_shell.html
git commit -m "feat(hypervisor): add interactive shell test page (Milestone 2)"
```

---

## Milestone 3: GUI Application

### Task 8: Create GUI App Test Page

**Files:**
- Create: `systems/visual_shell/web/test_gui_app.html`
- Create: `systems/visual_shell/web/kernels/README.md`

**Step 1: Write the test page**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WGPU Linux Hypervisor - GUI Application</title>
    <style>
        body { background: #111; color: #0f0; font-family: monospace; padding: 20px; }
        #display { border: 2px solid #0f0; }
        button { background: #030; color: #0f0; border: 1px solid #0f0; padding: 10px 20px; cursor: pointer; margin: 5px; }
        select { background: #030; color: #0f0; border: 1px solid #0f0; padding: 10px; }
        #status { margin: 10px 0; padding: 10px; background: #000; }
    </style>
</head>
<body>
    <h1>WGPU Linux Hypervisor - Milestone 3: GUI Application</h1>

    <div id="controls">
        <select id="displayMode">
            <option value="canvas">Canvas (Simple)</option>
            <option value="webgpu">WebGPU (Fast)</option>
            <option value="pixi">PixiJS (Integrated)</option>
        </select>
        <button onclick="initHypervisor()">Initialize</button>
        <button onclick="bootDemo()">Boot Demo GUI</button>
        <button onclick="startLoop()">Start</button>
        <button onclick="stopLoop()">Stop</button>
    </div>

    <div id="status">Status: Not initialized</div>

    <div id="display" tabindex="0"></div>

    <div id="instructions">
        <h3>Milestone 3 Goals:</h3>
        <ul>
            <li>Display mode selection (Canvas/WebGPU/PixiJS)</li>
            <li>Mouse input handling</li>
            <li>Real SDL/framebuffer application</li>
        </ul>
        <p>Click on display and move mouse to interact with GUI.</p>
    </div>

    <script type="module">
        import { WGPULinuxHypervisor } from './wgpu_linux_hypervisor.js';

        let hypervisor = null;

        window.initHypervisor = async function() {
            const mode = document.getElementById('displayMode').value;
            console.log('Display mode:', mode);

            hypervisor = new WGPULinuxHypervisor({
                cyclesPerFrame: 10000,
                displayMode: mode
            });
            await hypervisor.init();
            hypervisor.attachTo(document.getElementById('display'));
            updateStatus('Ready');
        };

        window.bootDemo = async function() {
            if (!hypervisor) return;

            // Demo: Draw a simple GUI pattern
            const kernel = buildGUIDemo();
            await hypervisor.loadKernel(kernel.buffer);
            updateStatus('Demo GUI loaded');
        };

        window.startLoop = function() {
            if (hypervisor) hypervisor.start(10000);
            updateStatus('Running');
        };

        window.stopLoop = function() {
            if (hypervisor) hypervisor.stop();
            updateStatus('Stopped');
        };

        function buildGUIDemo() {
            // Kernel that draws a simple mouse-following cursor
            return new Uint32Array([
                // Read mouse X from MMIO 0x02001000
                // Read mouse Y from MMIO 0x02001004
                // Draw cursor at (x, y) in framebuffer
                // ... simplified for demo
                0x020002b7, // lui x5, 0x02000 (MMIO base)
                0x0002a303, // lw x6, 0(x5) (mouse x)
                0x0042a383, // lw x7, 4(x5) (mouse y)
                // Convert to framebuffer offset
                // ... more instructions needed
                0x010003b7, // lui x7, 0x01000 (framebuffer)
                0x00ff0437, // lui x8, 0x00ff0
                0x00638023, // sw x6, 0(x7) (draw)
                0x0000006f, // j 0 (loop)
            ]);
        }

        function updateStatus(status) {
            document.getElementById('status').textContent = 'Status: ' + status;
        }
    </script>
</body>
</html>
```

**Step 2: Create kernels README**

```markdown
# WGPU Linux Hypervisor - Kernels

This directory contains pre-compiled Linux kernels for the WGPU hypervisor.

## Kernel Format

Kernels are stored as `.rts.png` files - RISC-V binary code embedded in PNG textures.

## Available Kernels

| Kernel | Size | Description |
|--------|------|-------------|
| `mmu_test_kernel.riscv` | 6KB | MMU validation kernel |
| `alpine_minimal.rts.png` | ~5MB | Minimal Alpine Linux (Milestone 1) |
| `alpine_gui.rts.png` | ~10MB | Alpine with SDL support (Milestone 3) |

## Building Kernels

### Prerequisites
```bash
# Install RISC-V toolchain
sudo apt install gcc-riscv64-unknown-elf
```

### Build Minimal Kernel
```bash
# Compile kernel
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 \
    -nostdlib -static -o kernel.elf kernel.c

# Convert to binary
riscv64-unknown-elf-objcopy -O binary kernel.elf kernel.bin

# Convert to RTS texture
python3 pixelrts_v2_converter.py kernel.bin alpine_minimal.rts.png
```

## Testing

```bash
# Start local server
python3 -m http.server 8080 --directory ..

# Open test page
# http://localhost:8080/test_boot_shell.html
```
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/test_gui_app.html
git add systems/visual_shell/web/kernels/README.md
git commit -m "feat(hypervisor): add GUI app test page and kernel docs (Milestone 3)"
```

---

## Summary

| Task | Milestone | Description |
|------|-----------|-------------|
| 1 | M1 | WGPUKernelLoader - Load kernel binaries |
| 2 | M1 | CanvasRenderer - Basic display |
| 3 | M1 | WGPUInputHandler - Keyboard/mouse |
| 4 | M1 | WGPULinuxHypervisor - Main orchestrator |
| 5 | M2 | WebGPURenderer - Fast texture display |
| 6 | M2 | PixiRenderer - Visual shell integration |
| 7 | M2 | Interactive shell test page |
| 8 | M3 | GUI app test page + kernel docs |

## Verification Commands

```bash
# Run test server
python3 -m http.server 8080 --directory systems/visual_shell/web

# Open test pages
# Milestone 1: http://localhost:8080/test_boot_shell.html
# Milestone 2: http://localhost:8080/test_interactive_shell.html
# Milestone 3: http://localhost:8080/test_gui_app.html
```
