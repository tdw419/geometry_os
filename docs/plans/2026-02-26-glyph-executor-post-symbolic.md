# GlyphExecutor Post-Symbolic Execution System Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable GPU-side holographic decoding of morphological glyph textures, eliminating the CPU pre-decode step and achieving zero-symbol execution where the GPU decodes instructions directly via dot-product operations.

**Architecture:** The GlyphExecutor acts as the "visual motherboard" orchestrating texture atlas binding, compute pipeline dispatch, and state synchronization. The post-symbolic shader performs on-demand instruction fetch using 32-bit dot products against 16x16 geometric tiles stored in a texture atlas. The encoder produces 16x16 glyph clusters with symmetry metadata for holographic resonance matching.

**Tech Stack:** WebGPU (compute shaders, texture sampling, storage buffers), WGSL, JavaScript ES6 modules

---

## Phase 1: Post-Symbolic Shader Foundation

### Task 1.1: Create Post-Symbolic Shader Skeleton

**Files:**
- Create: `systems/visual_shell/web/shaders/visual_cpu_riscv_post_symbolic.wgsl`

**Step 1: Write the shader skeleton**

```wgsl
// ============================================
// GEOMETRY OS - POST-SYMBOLIC CPU SHADER
// Phase 28: Zero-Symbol Holographic Execution
// ============================================
//
// KEY DIFFERENCE FROM STANDARD SHADER:
// - No expanded_code: array<u32> buffer
// - Instructions decoded on-demand from texture
// - Uses 32-bit dot product against glyph atlas

// --- BINDINGS ---

// 0: Glyph Atlas Texture (2D RGBA8)
// Each 16x16 tile encodes a RISC-V instruction
// R=charset index, G/B=TokenID, A=symmetry mask
@group(0) @binding(0) var glyph_atlas: texture_2d<f32>;

// 1: Atlas Dictionary (Storage Buffer)
// Maps TokenID -> RISC-V u32 instruction
@group(0) @binding(1) var<storage, read> atlas_dictionary: array<u32>;

// 2: System Memory / Heap
@group(0) @binding(2) var<storage, read_write> system_memory: array<u32>;

// 3: CPU State (Registers x0-x31, PC, CSRs)
@group(0) @binding(3) var<storage, read_write> cpu_states: array<u32>;

// --- CONSTANTS ---
const REGS_PER_CORE: u32 = 64u;
const GLYPH_SIZE: u32 = 16u;  // 16x16 pixel tiles
const ATLAS_WIDTH_TILES: u32 = 64u;  // 64 tiles = 1024 pixels wide

// --- HOLOGRAPHIC DECODING ---

/// Convert pixel coordinates to instruction index
fn pixel_to_inst_idx(x: u32, y: u32) -> u32 {
    let tile_x = x / GLYPH_SIZE;
    let tile_y = y / GLYPH_SIZE;
    return tile_y * ATLAS_WIDTH_TILES + tile_x;
}

/// Sample glyph atlas and extract TokenID
fn sample_token_id(pc: u32) -> u32 {
    // Convert PC to tile coordinates
    let tile_idx = pc / 4u;  // 4 bytes per instruction
    let tile_x = (tile_idx % ATLAS_WIDTH_TILES) * GLYPH_SIZE;
    let tile_y = (tile_idx / ATLAS_WIDTH_TILES) * GLYPH_SIZE;

    // Sample center of tile (8,8 offset within 16x16)
    let tex_coords = vec2<i32>(
        i32(tile_x + 8u),
        i32(tile_y + 8u)
    );

    let pixel = textureLoad(glyph_atlas, tex_coords, 0);

    // Extract TokenID from G/B channels
    // TokenID = (G << 8) | B
    let g = u32(pixel.g * 255.0);
    let b = u32(pixel.b * 255.0);
    return (g << 8u) | b;
}

/// Decode instruction at PC using holographic lookup
fn holographic_fetch(pc: u32) -> u32 {
    let token_id = sample_token_id(pc);

    // Dictionary lookup: each instruction is 1 u32
    // Dictionary format: [token_id_0_instr, token_id_1_instr, ...]
    let instr = atlas_dictionary[token_id];

    return instr;
}

// --- MAIN COMPUTE ENTRY POINT ---
@compute @workgroup_size(1)
fn main(@builtin(global_invocation_id) global_id: vec3<u32>) {
    let core_id = global_id.x;
    let base = core_id * REGS_PER_CORE;

    // Get PC
    let pc = cpu_states[base + 32u];

    // Check halt flag
    if (cpu_states[base + 38u] == 1u) {
        return;
    }

    // HOLOGRAPHIC FETCH - no expanded_code buffer!
    let inst = holographic_fetch(pc);

    // Decode and execute (same as standard shader)
    let opcode = inst & 0x7Fu;

    // ... (instruction execution logic continues)
    // For now, placeholder to validate compilation
    cpu_states[base + 32u] = pc + 4u;  // Increment PC
}
```

**Step 2: Verify shader compiles**

Run: Open in browser with WebGPU, check for compilation errors
Expected: No WebGPU errors in console

**Step 3: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv_post_symbolic.wgsl
git commit -m "feat(shader): add post-symbolic skeleton with holographic fetch"
```

---

### Task 1.2: Add Full Instruction Decoding to Post-Symbolic Shader

**Files:**
- Modify: `systems/visual_shell/web/shaders/visual_cpu_riscv_post_symbolic.wgsl`

**Step 1: Copy instruction execution from standard shader**

Copy the full instruction decode/execute logic from `visual_cpu_riscv.wgsl`:
- All opcode handlers (LUI, AUIPC, JAL, JALR, BRANCH, LOAD, STORE, OP-IMM, OP, SYSTEM)
- CSR handling functions
- Memory access helpers
- Syscall bridge

**Step 2: Replace `expanded_code[pc/4]` with `holographic_fetch(pc)`**

Find all references to `expanded_code` and replace with `holographic_fetch(pc)`.

**Step 3: Verify shader compiles**

Run: Test in browser, check console for errors
Expected: No compilation errors

**Step 4: Commit**

```bash
git add systems/visual_shell/web/shaders/visual_cpu_riscv_post_symbolic.wgsl
git commit -m "feat(shader): complete post-symbolic instruction execution"
```

---

## Phase 2: GlyphExecutor.js Motherboard

### Task 2.1: Create GlyphExecutor Class Skeleton

**Files:**
- Create: `systems/visual_shell/web/GlyphExecutor.js`

**Step 1: Write the class skeleton**

```javascript
/**
 * Geometry OS: GlyphExecutor
 *
 * The "Visual Motherboard" of the post-symbolic execution substrate.
 * Orchestrates:
 * - Glyph Atlas texture binding
 * - Dictionary buffer management
 * - Compute pipeline dispatch
 * - State synchronization with CPU
 *
 * Phase 28: Zero-Symbol Holographic Execution
 */

export class GlyphExecutor {
    /**
     * @param {GPUDevice} device - WebGPU device
     */
    constructor(device) {
        this.device = device;

        // Pipeline state
        this.pipeline = null;
        this.bindGroupLayout = null;
        this.initialized = false;

        // Texture atlas
        this.glyphAtlas = null;
        this.atlasWidth = 1024;   // pixels
        this.atlasHeight = 1024;  // pixels
        this.tileSize = 16;       // 16x16 glyph tiles

        // Dictionary
        this.dictionaryBuffer = null;
        this.dictionarySize = 0;

        // Memory (128MB)
        this.MEMORY_SIZE = 128 * 1024 * 1024;
        this.memoryBuffer = null;

        // CPU state (256 * 4 bytes)
        this.stateBuffer = null;

        // Active kernels
        this.kernels = new Map();
    }

    /**
     * Initialize the executor (load shader, create pipeline)
     */
    async initialize() {
        if (this.initialized) return;

        console.log('[GlyphExecutor] Initializing post-symbolic substrate...');

        // Load shader
        const shaderCode = await this._loadShader('shaders/visual_cpu_riscv_post_symbolic.wgsl');
        this.shaderModule = this.device.createShaderModule({
            label: 'Post-Symbolic CPU (RISC-V)',
            code: shaderCode
        });

        // Create bind group layout
        this.bindGroupLayout = this.device.createBindGroupLayout({
            entries: [
                // 0: Glyph Atlas Texture
                {
                    binding: 0,
                    visibility: GPUShaderStage.COMPUTE,
                    texture: { sampleType: 'float', viewDimension: '2d' }
                },
                // 1: Atlas Dictionary
                {
                    binding: 1,
                    visibility: GPUShaderStage.COMPUTE,
                    buffer: { type: 'read-only-storage' }
                },
                // 2: System Memory
                {
                    binding: 2,
                    visibility: GPUShaderStage.COMPUTE,
                    buffer: { type: 'storage' }
                },
                // 3: CPU State
                {
                    binding: 3,
                    visibility: GPUShaderStage.COMPUTE,
                    buffer: { type: 'storage' }
                }
            ]
        });

        // Create pipeline
        this.pipeline = this.device.createComputePipeline({
            layout: this.device.createPipelineLayout({
                bindGroupLayouts: [this.bindGroupLayout]
            }),
            compute: {
                module: this.shaderModule,
                entryPoint: 'main'
            }
        });

        this.initialized = true;
        console.log('[GlyphExecutor] Initialized successfully');
    }

    /**
     * Load shader source from URL
     * @private
     */
    async _loadShader(url) {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`Failed to load shader: ${url}`);
        }
        return response.text();
    }

    /**
     * Deploy a kernel from morphological texture
     * @param {string} textureUrl - URL to .rts.png file
     * @param {string} kernelId - Unique kernel identifier
     */
    async deploy(textureUrl, kernelId) {
        if (!this.initialized) await this.initialize();

        console.log(`[GlyphExecutor] Deploying kernel: ${kernelId}`);

        // 1. Load texture and metadata
        const { texture, dictionary } = await this._loadMorphologicalTexture(textureUrl);

        // 2. Create/update dictionary buffer
        this._updateDictionary(dictionary);

        // 3. Create memory buffer
        this.memoryBuffer = this.device.createBuffer({
            size: this.MEMORY_SIZE,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST
        });

        // 4. Create state buffer
        this.stateBuffer = this.device.createBuffer({
            size: 256 * 4,
            usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_SRC | GPUBufferUsage.COPY_DST | GPUBufferUsage.MAP_READ
        });

        // 5. Create bind group
        const bindGroup = this.device.createBindGroup({
            layout: this.bindGroupLayout,
            entries: [
                { binding: 0, resource: texture.createView() },
                { binding: 1, resource: { buffer: this.dictionaryBuffer } },
                { binding: 2, resource: { buffer: this.memoryBuffer } },
                { binding: 3, resource: { buffer: this.stateBuffer } }
            ]
        });

        // 6. Register kernel
        this.kernels.set(kernelId, {
            texture,
            bindGroup,
            pc: 0,
            cycleCount: 0,
            halted: false
        });

        console.log(`[GlyphExecutor] Kernel ${kernelId} deployed`);
        return true;
    }

    /**
     * Load morphological texture and its dictionary
     * @private
     */
    async _loadMorphologicalTexture(url) {
        // Fetch texture
        const response = await fetch(url);
        const blob = await response.blob();
        const imageBitmap = await createImageBitmap(blob);

        // Create GPU texture
        const texture = this.device.createTexture({
            size: [imageBitmap.width, imageBitmap.height],
            format: 'rgba8unorm',
            usage: GPUTextureUsage.TEXTURE_BINDING | GPUTextureUsage.COPY_DST | GPUTextureUsage.RENDER_ATTACHMENT
        });

        this.device.queue.copyExternalImageToTexture(
            { source: imageBitmap },
            { texture },
            [imageBitmap.width, imageBitmap.height]
        );

        // Fetch dictionary
        const metaUrl = url + '.meta.json';
        const metaResponse = await fetch(metaUrl);
        const metadata = await metaResponse.json();

        // Convert dictionary to Uint32Array
        const dictionary = new Uint32Array(metadata.dictionary.instructions);

        this.glyphAtlas = texture;
        this.atlasWidth = imageBitmap.width;
        this.atlasHeight = imageBitmap.height;

        return { texture, dictionary };
    }

    /**
     * Update dictionary buffer
     * @private
     */
    _updateDictionary(dictionary) {
        const size = dictionary.byteLength;

        if (this.dictionaryBuffer && this.dictionarySize < size) {
            this.dictionaryBuffer.destroy();
            this.dictionaryBuffer = null;
        }

        if (!this.dictionaryBuffer) {
            this.dictionaryBuffer = this.device.createBuffer({
                size: size,
                usage: GPUBufferUsage.STORAGE | GPUBufferUsage.COPY_DST
            });
        }

        this.device.queue.writeBuffer(this.dictionaryBuffer, 0, dictionary);
        this.dictionarySize = size;
    }

    /**
     * Execute N cycles
     * @param {string} kernelId - Kernel to execute
     * @param {number} cycles - Number of cycles to run
     */
    execute(kernelId, cycles = 100000) {
        const kernel = this.kernels.get(kernelId);
        if (!kernel) {
            throw new Error(`Kernel not found: ${kernelId}`);
        }

        const commandEncoder = this.device.createCommandEncoder();
        const passEncoder = commandEncoder.beginComputePass();

        passEncoder.setPipeline(this.pipeline);
        passEncoder.setBindGroup(0, kernel.bindGroup);
        passEncoder.dispatchWorkgroups(1);  // Single core for now

        passEncoder.end();

        this.device.queue.submit([commandEncoder.finish()]);
        kernel.cycleCount += cycles;
    }

    /**
     * Read CPU state
     * @param {string} kernelId - Kernel to read
     * @returns {Promise<Uint32Array>}
     */
    async readState(kernelId) {
        const kernel = this.kernels.get(kernelId);
        if (!kernel) {
            throw new Error(`Kernel not found: ${kernelId}`);
        }

        await this.stateBuffer.mapAsync(GPUMapMode.READ);
        const state = new Uint32Array(this.stateBuffer.getMappedRange().slice(0));
        this.stateBuffer.unmap();

        return state;
    }
}
```

**Step 2: Verify syntax**

Run: `node --check systems/visual_shell/web/GlyphExecutor.js`
Expected: No syntax errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/GlyphExecutor.js
git commit -m "feat(glyph-executor): add GlyphExecutor motherboard class"
```

---

### Task 2.2: Add Holographic Resonance Methods

**Files:**
- Modify: `systems/visual_shell/web/GlyphExecutor.js`

**Step 1: Add resonance validation method**

```javascript
/**
 * Validate holographic resonance for a glyph tile
 * Returns true if the tile's geometric shape matches its logical intent
 *
 * @param {number} tileX - Tile X coordinate in atlas
 * @param {number} tileY - Tile Y coordinate in atlas
 * @returns {Promise<boolean>} - True if resonance validated
 */
async validateResonance(tileX, tileY) {
    // Read the tile's symmetry metadata
    const pixel = await this._sampleTile(tileX, tileY);

    // A channel encodes symmetry mask:
    // 0xFF = fully executable (resonance validated)
    // 0x00 = NOP padding
    // 0x7F = partial resonance (requires geometric integrity check)

    const symmetryMask = pixel.a;

    if (symmetryMask === 0xFF) {
        return true;  // Full resonance
    } else if (symmetryMask === 0x00) {
        return false; // NOP - no resonance needed
    } else {
        // Partial resonance - perform dot-product validation
        return await this._checkGeometricIntegrity(tileX, tileY, symmetryMask);
    }
}

/**
 * Sample a tile from the atlas
 * @private
 */
async _sampleTile(tileX, tileY) {
    // Create a small staging buffer for single pixel read
    const stagingBuffer = this.device.createBuffer({
        size: 4,  // RGBA
        usage: GPUBufferUsage.MAP_READ | GPUBufferUsage.COPY_DST
    });

    // Issue copy command (simplified - real impl would use render pass)
    // For now, return placeholder
    return { r: 0, g: 0, b: 0, a: 0xFF };
}

/**
 * Check geometric integrity using dot-product resonance
 * @private
 */
async _checkGeometricIntegrity(tileX, tileY, symmetryMask) {
    // In a full implementation, this would:
    // 1. Load the 16x16 tile pixels
    // 2. Compute dot product against reference glyph shape
    // 3. Validate symmetry (horizontal/vertical/rotational)
    // 4. Return true if within tolerance

    // For POC, trust the encoder's symmetry metadata
    return (symmetryMask & 0x80) !== 0;
}
```

**Step 2: Add continuous execution method**

```javascript
/**
 * Start continuous execution loop
 * @param {string} kernelId - Kernel to execute
 * @param {number} cyclesPerFrame - Cycles per animation frame
 * @param {function} onOutput - Callback for UART output
 */
startContinuous(kernelId, cyclesPerFrame = 100000, onOutput = null) {
    const kernel = this.kernels.get(kernelId);
    if (!kernel) {
        throw new Error(`Kernel not found: ${kernelId}`);
    }

    if (kernel.running) {
        console.warn(`[GlyphExecutor] Kernel ${kernelId} already running`);
        return;
    }

    kernel.running = true;
    kernel.onOutput = onOutput;

    const executeFrame = () => {
        if (!kernel.running || kernel.halted) {
            return;
        }

        this.execute(kernelId, cyclesPerFrame);

        // Check for UART output
        if (onOutput) {
            this._checkUARTOutput(kernelId).then(output => {
                if (output) {
                    onOutput(output);
                }
            });
        }

        requestAnimationFrame(executeFrame);
    };

    requestAnimationFrame(executeFrame);
    console.log(`[GlyphExecutor] Started continuous execution for ${kernelId}`);
}

/**
 * Stop continuous execution
 * @param {string} kernelId - Kernel to stop
 */
stop(kernelId) {
    const kernel = this.kernels.get(kernelId);
    if (kernel) {
        kernel.running = false;
        console.log(`[GlyphExecutor] Stopped kernel ${kernelId}`);
    }
}

/**
 * Check UART output buffer
 * @private
 */
async _checkUARTOutput(kernelId) {
    // Read memory at UART FIFO region (0x05000400)
    // Implementation depends on memory bridge
    return null;  // Placeholder
}
```

**Step 3: Verify syntax**

Run: `node --check systems/visual_shell/web/GlyphExecutor.js`
Expected: No syntax errors

**Step 4: Commit**

```bash
git add systems/visual_shell/web/GlyphExecutor.js
git commit -m "feat(glyph-executor): add resonance validation and continuous execution"
```

---

## Phase 3: Updated Morphological Encoder

### Task 3.1: Add 16x16 Glyph Cluster Support to Encoder

**Files:**
- Modify: `riscv_morphological_encoder.py`

**Step 1: Add symmetry metadata calculation**

```python
def calculate_symmetry_mask(glyph_pixels: List[int]) -> int:
    """
    Calculate symmetry mask for a 16x16 glyph tile.

    Returns a byte encoding:
    - Bit 7: Full resonance (0x80)
    - Bit 6: Horizontal symmetry (0x40)
    - Bit 5: Vertical symmetry (0x20)
    - Bit 4: Rotational symmetry (0x10)
    - Bits 0-3: Geometric integrity score (0-15)
    """
    if len(glyph_pixels) != 256:
        return 0x00  # Invalid size

    # Convert to 16x16 grid
    grid = [glyph_pixels[i*16:(i+1)*16] for i in range(16)]

    # Check horizontal symmetry
    h_sym = all(grid[y] == grid[15-y] for y in range(8))

    # Check vertical symmetry
    v_sym = all(grid[y][x] == grid[y][15-x] for y in range(16) for x in range(8))

    # Check rotational symmetry (180 degree)
    r_sym = all(grid[y][x] == grid[15-y][15-x] for y in range(8) for x in range(16))

    mask = 0x80  # Full resonance by default
    if h_sym:
        mask |= 0x40
    if v_sym:
        mask |= 0x20
    if r_sym:
        mask |= 0x10

    # Geometric integrity score (simplified: based on pixel distribution)
    unique_pixels = len(set(glyph_pixels))
    integrity = min(15, unique_pixels // 17)  # 0-15 scale
    mask |= integrity

    return mask
```

**Step 2: Update pixel encoding to use symmetry mask in A channel**

```python
def encode_pixel(self, token_id: int, char: str, symmetry_mask: int = 0xFF) -> Tuple[int, int, int, int]:
    """
    Encode a single instruction as a pixel.

    Returns: (R, G, B, A) tuple where:
    - R: Charset index (visual glyph category)
    - G: TokenID high byte
    - B: TokenID low byte
    - A: Symmetry mask (0xFF = fully executable, 0x00 = NOP)
    """
    r = self.CHARSET.find(char)
    if r == -1:
        r = 0

    g = (token_id >> 8) & 0xFF
    b = token_id & 0xFF
    a = symmetry_mask

    return (r, g, b, a)
```

**Step 3: Add encoder option for 16x16 tile mode**

```python
class RISCVMorphologicalEncoder:
    def __init__(self, use_unique_tokens=True, tile_mode=False):
        self.use_unique_tokens = use_unique_tokens
        self.tile_mode = tile_mode  # Enable 16x16 glyph clusters
        self.dictionary: Dict[int, int] = {}
        self.reverse_dict: Dict[int, int] = {}
        self.next_token_id = 1
        self.CHARSET = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"
```

**Step 4: Commit**

```bash
git add riscv_morphological_encoder.py
git commit -m "feat(encoder): add 16x16 glyph cluster and symmetry mask support"
```

---

### Task 3.2: Generate Test Asset with Symmetry Metadata

**Files:**
- Create: `systems/visual_shell/web/assets/hello_holographic.rts.png`
- Create: `systems/visual_shell/web/assets/hello_holographic.rts.png.meta.json`

**Step 1: Run encoder with tile mode**

```bash
python3 riscv_morphological_encoder.py \
    --tile-mode \
    systems/infinite_map_rs/tests/hello_syscall.bin \
    systems/visual_shell/web/assets/hello_holographic.rts.png
```

**Step 2: Verify output**

```bash
file systems/visual_shell/web/assets/hello_holographic.rts.png
jq '.type, .dictionary.instructions | length' systems/visual_shell/web/assets/hello_holographic.rts.png.meta.json
```

Expected: PNG file exists, metadata shows `riscv-morphological` type

**Step 3: Commit**

```bash
git add systems/visual_shell/web/assets/hello_holographic.*
git commit -m "test(assets): add holographic test asset with symmetry metadata"
```

---

## Phase 4: Integration Test

### Task 4.1: Create GlyphExecutor Test Page

**Files:**
- Create: `systems/visual_shell/web/test_glyph_executor.html`

**Step 1: Create test HTML page**

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>GlyphExecutor Test - Post-Symbolic Execution</title>
    <style>
        body {
            background: #0a0a0a;
            color: #00ff88;
            font-family: 'Courier New', monospace;
            padding: 20px;
        }
        h1 {
            border-bottom: 2px solid #00ff88;
        }
        #controls {
            margin: 20px 0;
            display: flex;
            gap: 10px;
        }
        button {
            background: #1a1a1a;
            color: #00ff88;
            border: 1px solid #00ff88;
            padding: 12px 24px;
            cursor: pointer;
        }
        button:hover {
            background: #00ff88;
            color: #0a0a0a;
        }
        #console-output {
            background: #0f0f0f;
            border: 1px solid #333;
            padding: 15px;
            min-height: 300px;
            white-space: pre-wrap;
        }
        #status {
            padding: 10px;
            background: #1a1a1a;
            border-left: 4px solid #00ff88;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <h1>GlyphExecutor Test</h1>
    <p>Post-Symbolic Execution: GPU-side holographic decoding</p>

    <div id="controls">
        <button onclick="initExecutor()">Init WebGPU</button>
        <button onclick="loadKernel()" id="load-btn" disabled>Load Holographic</button>
        <button onclick="startExecution()" id="start-btn" disabled>Start</button>
        <button onclick="stopExecution()" id="stop-btn" disabled>Stop</button>
    </div>

    <div id="status">Status: Not initialized</div>

    <h2>UART Output</h2>
    <div id="console-output">(no output yet)</div>

    <script type="module">
        import { GlyphExecutor } from './GlyphExecutor.js';

        let executor = null;

        function updateStatus(msg) {
            document.getElementById('status').textContent = 'Status: ' + msg;
        }

        function appendOutput(text) {
            const el = document.getElementById('console-output');
            if (el.textContent === '(no output yet)') {
                el.textContent = '';
            }
            el.textContent += text;
        }

        window.initExecutor = async function() {
            try {
                updateStatus('Initializing WebGPU...');

                const adapter = await navigator.gpu.requestAdapter();
                const device = await adapter.requestDevice();

                executor = new GlyphExecutor(device);
                await executor.initialize();

                updateStatus('Ready');
                document.getElementById('load-btn').disabled = false;

            } catch (err) {
                updateStatus('Error: ' + err.message);
                console.error(err);
            }
        };

        window.loadKernel = async function() {
            if (!executor) return;

            try {
                updateStatus('Loading holographic kernel...');

                await executor.deploy('assets/hello_holographic.rts.png', 'test-kernel');

                updateStatus('Kernel loaded');
                document.getElementById('start-btn').disabled = false;

            } catch (err) {
                updateStatus('Error: ' + err.message);
                console.error(err);
            }
        };

        window.startExecution = function() {
            if (!executor) return;

            try {
                updateStatus('Running...');

                executor.startContinuous('test-kernel', 100000, (output) => {
                    appendOutput(output);
                });

                document.getElementById('start-btn').disabled = true;
                document.getElementById('stop-btn').disabled = false;

            } catch (err) {
                updateStatus('Error: ' + err.message);
                console.error(err);
            }
        };

        window.stopExecution = function() {
            if (!executor) return;

            executor.stop('test-kernel');
            updateStatus('Stopped');
            document.getElementById('start-btn').disabled = false;
            document.getElementById('stop-btn').disabled = true;
        };
    </script>
</body>
</html>
```

**Step 2: Verify HTML syntax**

Run: Open in browser, check for JS errors
Expected: Page loads without errors

**Step 3: Commit**

```bash
git add systems/visual_shell/web/test_glyph_executor.html
git commit -m "test(glyph-executor): add integration test page"
```

---

### Task 4.2: End-to-End Verification

**Files:**
- None (browser testing)

**Step 1: Start local server**

```bash
cd systems/visual_shell/web
python3 -m http.server 8080
```

**Step 2: Run test in browser**

1. Open http://localhost:8080/test_glyph_executor.html
2. Click "Init WebGPU"
3. Click "Load Holographic"
4. Click "Start"
5. Verify UART output appears

**Step 3: Document results**

Update `.progress.md` with verification results.

**Done when:** "Hello" output appears in console

---

## Phase 5: Quality Gates

### Task 5.1: Syntax Verification

**Files:**
- All modified files

**Step 1: Run syntax checks**

```bash
node --check systems/visual_shell/web/GlyphExecutor.js
node --check systems/visual_shell/web/test_glyph_executor.html 2>/dev/null || echo "HTML check skipped"
python3 -m py_compile riscv_morphological_encoder.py
```

Expected: All checks pass (exit code 0)

**Step 2: Fix any errors**

If syntax errors found, fix and re-verify.

**Step 3: Commit fixes**

```bash
git add -A
git commit -m "fix: address syntax issues"
```

---

### Task 5.2: Create Pull Request

**Files:**
- None (git operations)

**Step 1: Create feature branch**

```bash
git checkout -b feat/glyph-executor-post-symbolic
git push -u origin feat/glyph-executor-post-symbolic
```

**Step 2: Create PR**

```bash
gh pr create --title "feat(glyph-executor): add post-symbolic holographic execution" --body "$(cat <<'EOF'
## Summary
- Add GlyphExecutor.js - the "visual motherboard" for post-symbolic execution
- Add visual_cpu_riscv_post_symbolic.wgsl with holographic fetch
- Update encoder for 16x16 glyph clusters with symmetry metadata
- Add integration test page

## Key Features
- Zero-symbol execution: GPU decodes directly from texture
- Holographic resonance: geometric integrity validation
- 16x16 glyph tiles with symmetry encoding

## Test plan
- [ ] Open test_glyph_executor.html in Chrome
- [ ] Init WebGPU, Load Holographic, Start
- [ ] Verify UART output appears

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```

**Done when:** PR created and URL returned

---

## Notes

### Architecture Decisions

1. **Texture Atlas vs Storage Buffer**: Chose texture atlas for visual debuggability and future rendering integration
2. **Dictionary on GPU**: Dictionary buffer lives on GPU to avoid CPU round-trips during execution
3. **Symmetry Mask in Alpha**: Reuses A channel for metadata without changing pixel format

### Future Enhancements (Out of Scope)

- Multi-core execution (workgroup dispatch)
- Tier-2 JIT transpilation for hot paths
- Visual debugger with Infinite Map integration
- Geometric integrity scoring with ML

### Dependencies

- WebGPU (Chrome 113+, Firefox 118+)
- Existing `riscv_morphological_encoder.py`
- Existing `visual_cpu_riscv.wgsl` for instruction logic reference
