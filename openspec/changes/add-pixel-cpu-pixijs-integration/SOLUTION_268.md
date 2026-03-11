# Solution for Task: Z-index is set properly

Here is the implementation plan for the **Z-Index** task within the Pixel CPU - PixiJS Integration.

### 1. File Paths

*   **Modified:** `systems/visual_shell/web/infinite_map.js`
    *   *Reason:* The `InfiniteMap` class manages the PixiJS stage. We need to ensure the container for CPU visualization (tiles/textures) is initialized with the correct `zIndex` relative to the background and UI layers.
*   **Modified:** `systems/visual_shell/web/pixel_cpu_integration.js` (New or Existing)
    *   *Reason:* This is the integration layer. We need to ensure that when the CPU writes to the framebuffer memory, the resulting PixiJS Sprite is created with a specific `zIndex` so it appears above the map grid but below the console overlay.

### 2. Implementation Code

We will use PixiJS's `sortableChildren` feature to manage z-indexes explicitly.

#### A. Configure Infinite Map for Z-Indexing
In `systems/visual_shell/web/infinite_map.js`, enable sorting on the main container.

```javascript
// systems/visual_shell/web/infinite_map.js

class InfiniteMap {
    constructor() {
        // ... existing initialization code ...
        
        // Enable sorting for children based on zIndex property
        this.container.sortableChildren = true;
        this.container.zIndex = 0; // Base map layer
    }

    addCpuVisuals() {
        // Create a specific container for CPU artifacts
        this.cpuLayer = new PIXI.Container();
        this.cpuLayer.zIndex = 10; // Ensure CPU is above the background map (0)
        this.container.addChild(this.cpuLayer);
    }
}
```

#### B. Set Z-Index during Memory Mapping
In the integration logic, when the CPU updates the framebuffer, we ensure the visual representation respects the layer order.

```javascript
// systems/visual_shell/web/pixel_cpu_integration.js

function updateFramebufferTexture(memoryBuffer) {
    // Create or update the sprite from CPU memory
    const texture = createTextureFromBuffer(memoryBuffer);
    const sprite = new PIXI.Sprite(texture);

    // CRITICAL: Set zIndex so it renders correctly in the sort loop
    // 10 = CPU Layer, 20 = UI/Console (if applicable)
    sprite.zIndex = 10; 
    
    // Add to the map container (which has sortableChildren = true)
    window.geomMap.cpuLayer.addChild(sprite);
}
```

### 3. Next Step

**Command:** Create the file `systems/visual_shell/web/pixel_cpu_integration.js` with the memory mapping logic defined above to link the `PixelCPU` memory state to the `InfiniteMap` container.