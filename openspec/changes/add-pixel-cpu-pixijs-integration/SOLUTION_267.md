# Solution for Task: Overlay is positioned correctly

Here is the implementation plan for the **Overlay Positioning** task.

### 1. File Paths

The following files will be created to bridge the Pixel CPU and the PixiJS Infinite Map, ensuring the framebuffer overlay is positioned correctly relative to the virtual camera.

*   **`systems/visual_shell/web/cpu_overlay.js`** (New)
    *   *Role:* Manages the PixiJS Container that acts as the "screen" for the CPU. It handles coordinate translation (World Space -> Screen Space) to ensure the overlay stays fixed or moves as intended within the game world.
*   **`systems/visual_shell/web/pixi_integrator.js`** (New)
    *   *Role:* The main integration layer that instantiates the `CpuOverlay` and pipes data from the `PixelCpu` memory to the `CpuOverlay` texture.

### 2. Code Implementation

#### A. The Overlay Manager (`systems/visual_shell/web/cpu_overlay.js`)
This class creates a "Screen" entity in the PixiJS world. It uses a `PIXI.Container` to group the framebuffer sprite and a border background. It includes logic to sync its position with the camera if a "screen lock" is desired, or to remain static at a world coordinate.

```javascript
import { Container, Graphics, Sprite, Texture } from 'pixi.js';

export class CpuOverlay {
  constructor(app, infiniteMap) {
    this.app = app;
    this.map = infiniteMap;
    
    // Configuration for the Brick screen (e.g., 512x256 resolution)
    this.width = 512;
    this.height = 256;
    this.scale = 1; // Zoom level of the screen

    // Create a Container to hold the screen graphics
    this.container = new Container();
    
    // 1. Create the dynamic texture for the CPU Framebuffer
    // We start with a blank texture. The CPU will update this.
    this.texture = Texture.create(this.width, this.height);
    this.framebufferSprite = new Sprite(this.texture);
    this.framebufferSprite.anchor.set(0.5);

    // 2. Create a background/border for visibility
    const bg = new Graphics();
    bg.rect(0, 0, this.width, this.height);
    bg.fill(0x222222); // Dark grey background
    bg.stroke({ width: 2, color: 0xFFFFFF }); // White border

    // Assemble the hierarchy
    // Note: Graphics are centered, Sprite is anchored to center
    bg.x = -this.width / 2;
    bg.y = -this.height / 2;
    
    this.container.addChild(bg);
    this.container.addChild(this.framebufferSprite);

    // Initial Position in World Coordinates
    this.container.x = 0;
    this.container.y = 0;

    // Add to the main stage (or a specific layer in the infinite map)
    this.app.stage.addChild(this.container);
  }

  /**
   * Updates the texture with new data from CPU Memory.
   * @param {Uint8ClampedArray} imageData - RGBA pixel data.
   */
  updateFrameBuffer(imageData) {
    // In PixiJS v8, we update the underlying resource
    const resource = this.texture.source;
    resource.resource = imageData; // Simplified; actual impl may use buffer views
    resource.update();
  }

  /**
   * Positions the overlay. 
   * If 'locked', it centers on the camera. 
   * If 'unlocked', it stays at a fixed world coordinate.
   */
  updatePosition(isLocked) {
    if (isLocked) {
      // Center the overlay on the camera's viewport center
      const center = this.map.camera.getCenter();
      this.container.x = center.x;
      this.container.y = center.y;
    } else {
      // Logic to keep it at a specific tile coordinate could go here
      // For now, we leave it where it was placed.
    }
  }
}
```

#### B. The Integration Logic (`systems/visual_shell/web/pixi_integrator.js`)
This file ties the `PixelCpu` execution loop to the `CpuOverlay` rendering.

```javascript
import { CpuOverlay } from './cpu_overlay.js';

export class PixiIntegrator {
  constructor(pixiApp, infiniteMap, pixelCpu) {
    this.app = pixiApp;
    this.cpu = pixelCpu;
    
    // Initialize the overlay system
    this.overlay = new CpuOverlay(pixiApp, infiniteMap);
    
    // Subscribe to the CPU's memory write events or poll on tick
    this.setupMemoryHooks();
  }

  setupMemoryHooks() {
    // Define the memory-mapped I/O address for the Framebuffer
    // (Assuming 0x5000_0000 is the base address based on typical RISC-V soft-cpu layouts)
    const FB_BASE_ADDR = 0x50000000;
    const FB_WIDTH = 512;
    const FB_HEIGHT = 256;

    // Hook into the CPU's render loop or main loop
    this.app.ticker.add(() => {
      if (this.cpu.isRunning) {
        // 1. Execute a batch of instructions (Non-blocking)
        this.cpu.executeSteps(100); // Run 100 instructions per frame

        // 2. Check for Framebuffer updates
        // We map the CPU's memory Uint8Array to a texture view
        const fbData = new Uint8ClampedArray(
          this.cpu.memory.buffer, 
          FB_BASE_ADDR, 
            FB_WIDTH * FB_HEIGHT * 4
        );
        
        this.overlay.updateFrameBuffer(fbData);
        
        // 3. Update Overlay Position (e.g., keep it locked to camera)
        this.overlay.updatePosition(true); 
      }
    });
  }
}
```

### 3. Next Step

Create the overlay manager component to handle the screen positioning logic.

```bash
touch systems/visual_shell/web/cpu_overlay.js
```