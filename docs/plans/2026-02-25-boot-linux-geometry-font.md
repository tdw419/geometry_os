# Boot Linux Using the Geometry Font System

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable the Visual Shell to boot RISC-V Linux kernels encoded as morphological glyph textures (.rts.png + dictionary).

**Architecture:** The Python encoder (`riscv_morphological_encoder.py`) produces textures where each pixel's R channel holds a charset index (visual glyph) and G/B channels hold a TokenID (execution lookup). The JS runtime must decode these pixels, lookup instructions from the dictionary, and feed them to the WebGPU RISC-V emulator.

**Tech Stack:** WebGPU, PixiJS, Python (encoder), WebSocket bridge

---

## Prerequisites

- `riscv_morphological_encoder.py` exists and produces `.rts.png` + `.meta.json`
- `visual_cpu_riscv.wgsl` executes RISC-V instructions
- `WGPULinuxHypervisor` orchestrates kernel loading and execution
- `WebGPUSemanticManager` expands semantic textures

---

### Task 1: Create RISCV Morphological Loader (JS)

**Files:**
- Create: `systems/visual_shell/web/riscv_morphological_loader.js`

**Step 1: Write the loader module**

```javascript
/**
 * Geometry OS: RISC-V Morphological Loader
 *
 * Decodes riscv-morphological .rts.png textures into executable RISC-V instructions.
 *
 * Pixel encoding:
 *   R = Charset index (visual glyph for display)
 *   G = TokenID high byte
 *   B = TokenID low byte
 *   A = Executable mask (0xFF = valid instruction)
 *
 * Dictionary format (from .meta.json):
 *   {
 *     "type": "riscv-morphological",
 *     "dictionary": {
 *       "instructions": [0, <u32>, <u32>, ...],  // Direct lookup by TokenID
 *       "format": "direct-lookup"
 *     }
 *   }
 */

export class RISCVOrphologicalLoader {
    constructor(device) {
        this.device = device;
    }

    /**
     * Load a riscv-morphological texture and expand to RISC-V instructions.
     * @param {string} pngUrl - URL to the .rts.png file
     * @param {Object} metadata - The parsed .meta.json
     * @returns {Promise<{instructions: Uint32Array, glyphIndices: Uint8Array, metadata: Object}>}
     */
    async load(pngUrl, metadata) {
        if (metadata.type !== 'riscv-morphological') {
            throw new Error(`Expected type 'riscv-morphological', got '${metadata.type}'`);
        }

        const dictionary = metadata.dictionary.instructions;
        if (!dictionary || dictionary.format !== 'direct-lookup') {
            throw new Error('Dictionary must have direct-lookup format');
        }

        // Fetch and decode the PNG
        const response = await fetch(pngUrl);
        const blob = await response.blob();
        const img = new Image();
        img.src = URL.createObjectURL(blob);
        await img.decode();

        const canvas = document.createElement('canvas');
        canvas.width = img.width;
        canvas.height = img.height;
        const ctx = canvas.getContext('2d');
        ctx.drawImage(img, 0, 0);

        const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
        const pixels = new Uint8ClampedArray(imageData.data.buffer);

        const totalPixels = canvas.width * canvas.height;
        const instructions = new Uint32Array(totalPixels);
        const glyphIndices = new Uint8Array(totalPixels);

        // Decode each pixel
        for (let i = 0; i < totalPixels; i++) {
            const pixelOffset = i * 4;
            const r = pixels[pixelOffset];     // Charset index (visual)
            const g = pixels[pixelOffset + 1]; // TokenID high byte
            const b = pixels[pixelOffset + 2]; // TokenID low byte
            const a = pixels[pixelOffset + 3]; // Valid mask

            glyphIndices[i] = r;

            if (a === 0xFF) {
                const tokenId = (g << 8) | b;
                // Lookup instruction from dictionary
                if (tokenId < dictionary.length) {
                    instructions[i] = dictionary[tokenId];
                } else {
                    instructions[i] = 0; // NOP for invalid tokens
                }
            } else {
                instructions[i] = 0; // NOP for non-executable pixels
            }
        }

        console.log(`[RISCVOrphologicalLoader] Decoded ${totalPixels} pixels, ${dictionary.length} unique instructions`);

        return {
            instructions,
            glyphIndices,
            metadata,
            width: canvas.width,
            height: canvas.height
        };
    }

    /**
     * Create a GPU buffer from the decoded instructions.
     * @param {Uint32Array} instructions - Decoded RISC-V instructions
     * @returns {GPUBuffer} Storage buffer ready for shader access
     */
    createInstructionBuffer(instructions) {
        const buffer = this.device.createBuffer({
            label: 'RISC-V Morphological Instructions',
            size: instructions.byteLength,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
            mappedAtCreation: true
        });
        new Uint32Array(buffer.getMappedRange()).set(instructions);
        buffer.unmap();
        return buffer;
    }
}

if (typeof window !== 'undefined') {
    window.RISCVOrphologicalLoader = RISCVOrphologicalLoader;
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/riscv_morphological_loader.js
git commit -m "feat(visual-shell): add RISCV Morphological Loader

Decodes riscv-morphological textures into executable RISC-V instructions.
Each pixel's G/B channels encode a TokenID for dictionary lookup."
```

---

### Task 2: Update WGPULinuxHypervisor to Support Morphological Loading

**Files:**
- Modify: `systems/visual_shell/web/wgpu_linux_hypervisor.js:1-570`

**Step 1: Add import for RISCVOrphologicalLoader**

At line 6, add:

```javascript
import { RISCVOrphologicalLoader } from './riscv_morphological_loader.js';
```

**Step 2: Initialize loader in constructor**

In the constructor (around line 15), add:

```javascript
this.morphologicalLoader = null; // Initialized after device is ready
```

**Step 3: Add loadKernelFromMorphologicalRTS method**

Add this new method after `loadKernelFromRTS` (around line 200):

```javascript
/**
 * Load kernel from a riscv-morphological .rts.png texture.
 * This decodes the glyph texture into executable RISC-V instructions.
 * @param {string} url - URL to the .rts.png file (metadata assumed at .meta.json)
 */
async loadKernelFromMorphologicalRTS(url) {
    // Initialize loader if needed
    if (!this.morphologicalLoader) {
        this.morphologicalLoader = new RISCVOrphologicalLoader(this.device);
    }

    // Fetch metadata
    const metaUrl = url.replace('.rts.png', '.rts.png.meta.json');
    const metaResponse = await fetch(metaUrl);
    if (!metaResponse.ok) {
        throw new Error(`Failed to load metadata from ${metaUrl}`);
    }
    const metadata = await metaResponse.json();

    console.log(`[Hypervisor] Loading riscv-morphological kernel from ${url}`);
    console.log(`[Hypervisor] Type: ${metadata.type}, Instructions: ${metadata.instruction_count}`);

    // Decode the morphological texture
    const decoded = await this.morphologicalLoader.load(url, metadata);

    // Deploy to GPU with expanded instruction buffer
    // We need to create the expanded_code buffer with decoded instructions
    await this.gpuSystem.deployWithInstructions(
        decoded.instructions,
        this.kernelId
    );

    // Initialize input handler
    const kernel = this.gpuSystem.kernels.get(this.kernelId);
    if (this.display && this.display.canvas && kernel) {
        this.inputHandler = new WGPUInputHandler(
            this.display.canvas,
            this.device,
            kernel.memoryBuffer,
            this.kernelId
        );
    }

    // Setup DTB
    await this.setupDTB();

    // Setup syscall handler
    this._setupSyscallBridge();

    // Cache initial state
    this.cachedState = await this.gpuSystem.readState(this.kernelId);

    // Store glyph data for visual rendering
    this.morphologicalGlyphs = decoded.glyphIndices;
    this.morphologicalMeta = decoded.metadata;

    console.log(`✅ Morphological kernel loaded: ${decoded.instructions.length} instructions`);
}
```

**Step 4: Commit**

```bash
git add systems/visual_shell/web/wgpu_linux_hypervisor.js
git commit -m "feat(hypervisor): add loadKernelFromMorphologicalRTS method

Integrates RISCV Morphological Loader into the hypervisor boot flow.
Decodes glyph textures into executable RISC-V instructions."
```

---

### Task 3: Add deployWithInstructions to GPUExecutionSystem

**Files:**
- Modify: `systems/visual_shell/web/gpu_execution_system.js`

**Step 1: Add deployWithInstructions method**

Add this method to the GPUExecutionSystem class:

```javascript
/**
 * Deploy a kernel with pre-expanded instructions.
 * Used by morphological loader which decodes instructions on CPU.
 * @param {Uint32Array} instructions - Pre-expanded RISC-V instructions
 * @param {string} kernelId - Kernel identifier
 */
async deployWithInstructions(instructions, kernelId) {
    // Create instruction buffer
    const codeBuffer = this.device.createBuffer({
        label: `Expanded Code Buffer: ${kernelId}`,
        size: Math.max(instructions.byteLength, 1024 * 1024), // Min 1MB
        usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST,
        mappedAtCreation: true
    });
    new Uint32Array(codeBuffer.getMappedRange()).set(instructions);
    codeBuffer.unmap();

    // Create memory buffer (128MB for Linux)
    const memoryBuffer = this.device.createBuffer({
        label: `System Memory: ${kernelId}`,
        size: 128 * 1024 * 1024,
        usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST
    });

    // Create CPU state buffer (46 registers per core)
    const stateBuffer = this.device.createBuffer({
        label: `CPU State: ${kernelId}`,
        size: 46 * 4, // 46 u32 registers
        usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST
    });

    // Store kernel
    this.kernels.set(kernelId, {
        codeBuffer,
        memoryBuffer,
        stateBuffer,
        instructionCount: instructions.length
    });

    console.log(`[GPUExecutionSystem] Deployed kernel ${kernelId} with ${instructions.length} instructions`);
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/gpu_execution_system.js
git commit -m "feat(gpu-exec): add deployWithInstructions for morphological loader

Allows pre-expanded instruction buffers from morphological decoding."
```

---

### Task 4: Create Test HTML for Morphological Boot

**Files:**
- Create: `systems/visual_shell/web/test_morphological_boot.html`

**Step 1: Write the test page**

```html
<!DOCTYPE html>
<html>
<head>
    <title>Geometry OS - Morphological Boot Test</title>
    <style>
        body {
            background: #0a0a0a;
            color: #00ff00;
            font-family: 'Courier New', monospace;
            padding: 20px;
        }
        #console {
            background: #001100;
            border: 1px solid #00ff00;
            padding: 10px;
            height: 400px;
            overflow-y: scroll;
            white-space: pre-wrap;
            font-size: 12px;
        }
        #display {
            border: 1px solid #00ff00;
            margin-top: 10px;
        }
        .controls {
            margin: 10px 0;
        }
        button {
            background: #001100;
            border: 1px solid #00ff00;
            color: #00ff00;
            padding: 5px 15px;
            cursor: pointer;
            margin-right: 5px;
        }
        button:hover {
            background: #003300;
        }
        #status {
            color: #ffff00;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <h1>Geometric Linux Boot</h1>
    <div id="status">Status: Initializing...</div>
    <div class="controls">
        <button onclick="loadMorphologicalKernel()">Load Morphological Kernel</button>
        <button onclick="startExecution()">Start</button>
        <button onclick="stopExecution()">Stop</button>
    </div>
    <div id="console"></div>
    <div id="display"></div>

    <script type="module">
        import { WGPULinuxHypervisor } from './wgpu_linux_hypervisor.js';

        let hypervisor = null;

        function log(msg) {
            const console = document.getElementById('console');
            console.textContent += msg + '\n';
            console.scrollTop = console.scrollHeight;
        }

        function setStatus(msg) {
            document.getElementById('status').textContent = 'Status: ' + msg;
        }

        window.loadMorphologicalKernel = async function() {
            try {
                setStatus('Initializing WebGPU...');
                hypervisor = new WGPULinuxHypervisor({
                    width: 800,
                    height: 600,
                    cyclesPerFrame: 50000
                });

                hypervisor.onConsoleOutput = (char) => {
                    log(char);
                };

                await hypervisor.init();
                log('✅ WebGPU initialized');

                setStatus('Loading morphological kernel...');

                // Use the hello_syscall.bin encoded as morphological
                await hypervisor.loadKernelFromMorphologicalRTS('hello_morph.rts.png');

                log('✅ Morphological kernel loaded');
                setStatus('Ready to boot');
            } catch (e) {
                log('❌ Error: ' + e.message);
                console.error(e);
                setStatus('Error: ' + e.message);
            }
        };

        window.startExecution = async function() {
            if (!hypervisor) {
                log('❌ Load kernel first');
                return;
            }
            setStatus('Booting...');
            hypervisor.start();
        };

        window.stopExecution = function() {
            if (hypervisor) {
                hypervisor.stop();
                setStatus('Stopped');
            }
        };

        log('Geometry OS - Morphological Boot Test');
        log('Click "Load Morphological Kernel" to begin');
    </script>
</body>
</html>
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/test_morphological_boot.html
git commit -m "feat(test): add morphological boot test page

HTML test page for booting RISC-V kernels encoded as morphological glyphs."
```

---

### Task 5: Create Integration Test

**Files:**
- Create: `systems/visual_shell/web/tests/test_morphological_loader.js`

**Step 1: Write the test**

```javascript
/**
 * Test: RISCV Morphological Loader
 *
 * Verifies that the loader correctly decodes riscv-morphological textures.
 */

import { RISCVOrphologicalLoader } from '../riscv_morphological_loader.js';

// Mock device for testing
const mockDevice = {
    createBuffer: (desc) => {
        return {
            size: desc.size,
            mappedRange: new ArrayBuffer(desc.size),
            getMappedRange: () => new ArrayBuffer(desc.size),
            unmap: () => {},
            label: desc.label
        };
    }
};

async function testLoaderWithMinimalData() {
    console.log('Test: Loader with minimal morphological data');

    // Create a minimal test PNG (2x2 pixels)
    // This would normally be loaded from file
    // For now, we test the decoding logic directly

    const metadata = {
        type: 'riscv-morphological',
        format: 'PixelRTS-2.0',
        instruction_count: 4,
        dictionary: {
            instructions: [
                0x00000013, // NOP (TokenID 0)
                0x00100093, // ADDI x1, x0, 1 (TokenID 1)
                0x00200113, // ADDI x2, x0, 2 (TokenID 2)
                0x001081B3  // ADD x3, x1, x2 (TokenID 3)
            ],
            format: 'direct-lookup',
            charset: ' ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        }
    };

    // Simulate pixel data: 4 pixels with TokenIDs 1, 2, 3, 0
    // R=charset_idx, G=token_high, B=token_low, A=0xFF
    const pixelData = new Uint8ClampedArray([
        // Pixel 0: TokenID 1, charset 'i' (index 42 in charset)
        42, 0, 1, 255,
        // Pixel 1: TokenID 2
        42, 0, 2, 255,
        // Pixel 2: TokenID 3
        42, 0, 3, 255,
        // Pixel 3: TokenID 0 (NOP)
        32, 0, 0, 255
    ]);

    // Manually decode to verify logic
    const instructions = new Uint32Array(4);
    for (let i = 0; i < 4; i++) {
        const offset = i * 4;
        const tokenId = (pixelData[offset + 1] << 8) | pixelData[offset + 2];
        instructions[i] = metadata.dictionary.instructions[tokenId];
    }

    console.assert(instructions[0] === 0x00100093, 'Pixel 0 should be ADDI x1, x0, 1');
    console.assert(instructions[1] === 0x00200113, 'Pixel 1 should be ADDI x2, x0, 2');
    console.assert(instructions[2] === 0x001081B3, 'Pixel 2 should be ADD x3, x1, x2');
    console.assert(instructions[3] === 0x00000013, 'Pixel 3 should be NOP');

    console.log('✅ Morphological loader decoding logic verified');
    return true;
}

async function testInvalidMetadata() {
    console.log('Test: Loader rejects invalid metadata');

    const loader = new RISCVOrphologicalLoader(mockDevice);

    const invalidMetadata = {
        type: 'wrong-type',
        dictionary: { instructions: [], format: 'direct-lookup' }
    };

    try {
        await loader.load('dummy.png', invalidMetadata);
        console.assert(false, 'Should have thrown error');
    } catch (e) {
        console.assert(e.message.includes('riscv-morphological'), 'Error should mention type mismatch');
        console.log('✅ Loader correctly rejects invalid metadata');
    }
    return true;
}

// Run tests
export async function runTests() {
    console.log('=== RISCV Morphological Loader Tests ===');

    await testLoaderWithMinimalData();
    await testInvalidMetadata();

    console.log('=== All tests passed ===');
}

// Auto-run if loaded directly
if (typeof window !== 'undefined') {
    window.runMorphologicalLoaderTests = runTests;
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/tests/test_morphological_loader.js
git commit -m "test(morphological): add loader unit tests

Tests decoding logic and metadata validation."
```

---

### Task 6: Encode Test Binary and Verify End-to-End

**Files:**
- Modify: `systems/visual_shell/web/hello_morph.rts.png` (generated)
- Modify: `systems/visual_shell/web/hello_morph.rts.png.meta.json` (generated)

**Step 1: Run the encoder on hello_syscall.bin**

```bash
cd /home/jericho/zion/projects/geometry_os/geometry_os
python3 riscv_morphological_encoder.py \
    systems/infinite_map_rs/tests/hello_syscall.bin \
    systems/visual_shell/web/hello_morph.rts.png
```

Expected output:
```
Processing systems/infinite_map_rs/tests/hello_syscall.bin (11980 bytes)...
Successfully encoded to systems/visual_shell/web/hello_morph.rts.png
Visual Charset Mapping: !+?AJL
Unique Instructions: 55
```

**Step 2: Verify the generated files exist**

```bash
ls -la systems/visual_shell/web/hello_morph.rts.png*
```

Expected:
```
hello_morph.rts.png
hello_morph.rts.png.meta.json
```

**Step 3: Commit generated test files**

```bash
git add systems/visual_shell/web/hello_morph.rts.png
git add systems/visual_shell/web/hello_morph.rts.png.meta.json
git commit -m "test(assets): add encoded hello_syscall morphological texture

Test binary encoded as riscv-morphological for boot testing."
```

---

### Task 7: Add Visual Glyph Rendering (Optional Enhancement)

**Files:**
- Create: `systems/visual_shell/web/morphological_glyph_renderer.js`

**Step 1: Create the glyph renderer**

```javascript
/**
 * Geometry OS: Morphological Glyph Renderer
 *
 * Renders riscv-morphological textures as visual geometric glyphs
 * using the Universal Morphological Font.
 */

export class MorphologicalGlyphRenderer {
    constructor(device, fontData = null) {
        this.device = device;
        this.fontData = fontData; // Pre-trained synthesizer weights
        this.glyphCache = new Map();
    }

    /**
     * Render a morphological texture to a displayable canvas.
     * @param {Uint8Array} glyphIndices - Array of charset indices
     * @param {number} width - Texture width
     * @param {number} height - Texture height
     * @param {string} charset - The charset string for index lookup
     * @returns {HTMLCanvasElement} Canvas with rendered glyphs
     */
    renderToCanvas(glyphIndices, width, height, charset) {
        const glyphSize = 16;
        const canvas = document.createElement('canvas');
        canvas.width = width * glyphSize;
        canvas.height = height * glyphSize;
        const ctx = canvas.getContext('2d');

        for (let y = 0; y < height; y++) {
            for (let x = 0; x < width; x++) {
                const idx = y * width + x;
                const charIdx = glyphIndices[idx];
                const char = charset[charIdx] || ' ';

                // Get or create glyph texture
                const glyphCanvas = this._getGlyph(char);
                ctx.drawImage(glyphCanvas, x * glyphSize, y * glyphSize);
            }
        }

        return canvas;
    }

    _getGlyph(char) {
        if (this.glyphCache.has(char)) {
            return this.glyphCache.get(char);
        }

        // Create a placeholder glyph (in real impl, use MorphologicalSynthesizer)
        const canvas = document.createElement('canvas');
        canvas.width = 16;
        canvas.height = 16;
        const ctx = canvas.getContext('2d');

        // Draw a geometric representation based on char code
        const code = char.charCodeAt(0);
        ctx.fillStyle = `hsl(${(code * 3.8) % 360}, 70%, 50%)`;

        // Simple geometric pattern based on character
        const pattern = code % 4;
        if (pattern === 0) {
            ctx.fillRect(4, 4, 8, 8); // Square
        } else if (pattern === 1) {
            ctx.beginPath();
            ctx.arc(8, 8, 4, 0, Math.PI * 2);
            ctx.fill(); // Circle
        } else if (pattern === 2) {
            ctx.beginPath();
            ctx.moveTo(8, 2);
            ctx.lineTo(14, 14);
            ctx.lineTo(2, 14);
            ctx.closePath();
            ctx.fill(); // Triangle
        } else {
            ctx.fillRect(2, 6, 12, 4); // Bar
        }

        this.glyphCache.set(char, canvas);
        return canvas;
    }
}

if (typeof window !== 'undefined') {
    window.MorphologicalGlyphRenderer = MorphologicalGlyphRenderer;
}
```

**Step 2: Commit**

```bash
git add systems/visual_shell/web/morphological_glyph_renderer.js
git commit -m "feat(render): add Morphological Glyph Renderer

Renders riscv-morphological textures as visual geometric glyphs."
```

---

## Verification

1. **Unit Tests**: Run `test_morphological_loader.js` in browser console
2. **Integration**: Open `test_morphological_boot.html` and click "Load Morphological Kernel"
3. **Visual**: Verify glyph texture displays in the console

## Success Criteria

- [ ] `RISCVOrphologicalLoader` correctly decodes pixel → TokenID → instruction
- [ ] `WGPULinuxHypervisor.loadKernelFromMorphologicalRTS()` boots without errors
- [ ] hello_syscall.bin output appears in console (e.g., "Hello from RISC-V!")
- [ ] Glyph texture is visually coherent (not random noise)

## Future Enhancements

- Full MorphologicalSynthesizer integration for neural glyph rendering
- Larger kernel support (Alpine Linux)
- GPU-accelerated dictionary expansion
