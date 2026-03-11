# Solution for Task: Sprite is added to world

Here is the implementation plan for the **Sprite is added to world** task within the Geometry OS Pixel CPU integration context.

### 1. File Paths

**New File**
*   `systems/visual_shell/web/cpu_sprite.js`
    *   *Description*: A PixiJS `Container` subclass that wraps the `PixelCPU` instance. It handles the creation of the "Screen" texture (for framebuffer output) and the "Console" text object (for serial output), positioning them relative to the sprite's world coordinates.

**Modified File**
*   `systems/visual_shell/web/infinite_map.js`
    *   *Description*: Updated to accept `CpuSprite` instances. The `addCpu` method will inject the CPU entity into the scene graph and register its memory-mapped regions with the world state.

### 2. Code Implementation

**File: `systems/visual_shell/web/cpu_sprite.js`**
This class bridges the raw CPU emulator and the PixiJS rendering engine. It creates a visual representation of the CPU state.

```javascript
import { Container, Graphics, Texture, Sprite, Text, RenderTexture } from 'pixi.js';
import { PixelCPU } from './pixel_cpu.js';

export class CpuSprite extends Container {
    /**
     * @param {string} brickUrl - URL to the .brick file to load.
     * @param {number} x - World X coordinate.
     * @param {number} y - World Y coordinate.
     */
    constructor(brickUrl, x, y) {
        super();
        this.position.set(x, y);

        // 1. Initialize CPU
        this.cpu = new PixelCPU();
        this.brickUrl = brickUrl;
        this.isLoaded = false;

        // 2. Visual Elements
        this._initVisuals();

        // 3. Load Logic
        this._loadBrick();
    }

    _initVisuals() {
        // A. Debug Body (The physical "chip" look)
        const body = new Graphics();
        body.rect(0, 0, 320, 240).fill(0x333333).stroke({ width: 2, color: 0x00FF00 });
        this.addChild(body);

        // B. Framebuffer Display (The "Screen")
        // We use a RenderTexture so the CPU can write to it directly
        this.fbTexture = RenderTexture.create({ width: 160, height: 120 });
        this.fbSprite = new Sprite(this.fbTexture);
        this.fbSprite.position.set(10, 10);
        this.fbSprite.scale.set(2); // Scale up the pixel art
        this.addChild(this.fbSprite);

        // C. Console Output (Serial Terminal)
        this.consoleText = new Text({
            text: "> System Boot...",
            style: {
                fontFamily: 'monospace',
                fontSize: 10,
                fill: 0x00FF00,
                wordWrap: true,
                wordWrapWidth: 300
            }
        });
        this.consoleText.position.set(10, 250); // Below the screen
        this.addChild(this.consoleText);
    }

    async _loadBrick() {
        try {
            const response = await fetch(this.brickUrl);
            const buffer = await response.arrayBuffer();
            const instructions = new Uint8Array(buffer);
            
            // Load into CPU memory
            this.cpu.loadInstructions(instructions);
            
            // Setup Memory Mapped I/O (MMIO)
            this._setupMMIO();
            
            this.isLoaded = true;
            this.consoleText.text = "> CPU Loaded. Ready.";
        } catch (e) {
            this.consoleText.text = `> Error: ${e.message}`;
        }
    }

    _setupMMIO() {
        // Map a specific memory address to the framebuffer update
        // Example: Writing to address 0xF000 updates the texture
        this.cpu.mmio.write = (address, value) => {
            if (address === 0xF000) {
                // Update specific pixel on texture (simplified)
                // In a real impl, we would map a buffer region to the texture
                // This is a placeholder for the integration logic
                this.consoleText.text += `\n> MMIO Write: ${value.toString(16)}`;
            }
        };
    }

    // Called by the InfiniteMap render loop
    update(dt) {
        if (!this.isLoaded) return;

        // Execute a batch of instructions (Non-blocking)
        // e.g., run for 1ms or max 100 instructions
        const start = performance.now();
        while (performance.now() - start < 1) {
             this.cpu.step();
        }

        // If CPU updated a framebuffer buffer in memory, upload to GPU here
        // this.fbTexture.update();
    }
}
```

**File: `systems/visual_shell/web/infinite_map.js` (Modification)**
Adding the method to instantiate and place the CPU object into the world.

```javascript
// Inside InfiniteMap class...

    /**
     * Adds a CPU entity to the world at a specific tile coordinate.
     * @param {string} brickUrl 
     * @param {number} tileX 
     * @param {number} tileY 
     */
    addCpu(brickUrl, tileX, tileY) {
        // Convert tile coordinates to world pixel coordinates
        const worldX = tileX * this.tileSize;
        const worldY = tileY * this.tileSize;

        // Create the CPU Sprite
        const cpuSprite = new CpuSprite(brickUrl, worldX, worldY);
        
        // Add to the container for rendering
        this.worldContainer.addChild(cpuSprite);
        
        // Register for update loop
        this.activeCpus.push(cpuSprite);
        
        return cpuSprite;
    }
```

### 3. Next Step

**Command:** Create the `cpu_sprite.js` file to define the `CpuSprite` class.

```bash
touch systems/visual_shell/web/cpu_sprite.js
```