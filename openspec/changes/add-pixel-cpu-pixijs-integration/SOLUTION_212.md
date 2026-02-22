# Solution for Task: Tile is positioned on map

Here is the implementation plan for the **Pixel CPU - PixiJS Integration**, focusing on the specific task: **Tile is positioned on map**.

### 1. File Paths

**New File**
*   `systems/visual_shell/web/components/cpu_tile.js`
    *   *Description*: A PixiJS `Container` subclass that represents the CPU. It handles the positioning logic, anchoring to the infinite grid, and rendering the CPU's visual state (screen/border).

**Modified File**
*   `systems/visual_shell/web/infinite_map.js`
    *   *Description*: Updated to include the instantiation and management of the `CpuTile` within the viewport.

---

### 2. Implementation Code

#### **File: `systems/visual_shell/web/components/cpu_tile.js`**

This component creates a visual representation of the CPU. It uses a `PIXI.Graphics` object to draw a border and a placeholder screen, and implements logic to position itself based on the "virtual" coordinate system of the infinite map.

```javascript
import * as PIXI from 'pixi.js';

/**
 * CpuTile
 * Represents the visual instance of the Pixel CPU on the Infinite Map.
 * Converts virtual grid coordinates into PixiJS world coordinates.
 */
export class CpuTile extends PIXI.Container {
    constructor(tileSize = 100) {
        super();
        this.tileSize = tileSize;
        this.interactive = true;
        this.cursor = 'pointer';

        // 1. Visual Body (The "Chip")
        const graphics = new PIXI.Graphics();
        graphics.rect(0, 0, this.tileSize, this.tileSize);
        graphics.fill(0x2E2E2E); // Dark grey body
        graphics.stroke({ width: 2, color: 0x00FF00 }); // Green terminal border
        
        // 2. Screen/Label Area
        const text = new PIXI.Text({
            text: "PIXEL\nCPU",
            style: {
                fontFamily: 'Monospace',
                fontSize: 14,
                fill: 0x00FF00,
                align: 'center'
            }
        });
        text.anchor = 0.5;
        text.x = this.tileSize / 2;
        text.y = this.tileSize / 2;

        this.addChild(graphics, text);
        
        // Initial placement (will be updated by map logic)
        this.gridPosition = { x: 0, y: 0 };
    }

    /**
     * Positions the tile on the map based on grid coordinates.
     * @param {number} gridX - The X grid index.
     * @param {number} gridY - The Y grid index.
     */
    setGridPosition(gridX, gridY) {
        this.gridPosition = { x: gridX, y: gridY };
        
        // Calculate pixel position relative to the world
        // Adding a small gap (padding) for visual separation
        const gap = 10;
        this.x = (gridX * this.tileSize) + gap;
        this.y = (gridY * this.tileSize) + gap;
    }
}
```

#### **File: `systems/visual_shell/web/infinite_map.js`**

We modify the `InfiniteMap` class to spawn the `CpuTile` at a specific coordinate (e.g., `0,0`) so it appears immediately when the map loads.

```javascript
import { CpuTile } from './components/cpu_tile.js';

// Inside InfiniteMap class definition...

async init() {
    // ... existing setup code (viewport, app, etc.) ...

    // Instantiate the CPU Tile
    this.cpuTile = new CpuTile(this.tileSize);
    
    // Position it at grid coordinate 0,0 (The Origin)
    this.cpuTile.setGridPosition(0, 0);

    // Add to the main container (not the viewport, so it moves with the world)
    this.mainContainer.addChild(this.cpuTile);
    
    // Optional: Center camera on the CPU tile
    this.viewport.moveCenter(0, 0);
}
```

---

### 3. Next Step

**Create the component file** to define the visual representation of the CPU.

```bash
mkdir -p systems/visual_shell/web/components
touch systems/visual_shell/web/components/cpu_tile.js
```