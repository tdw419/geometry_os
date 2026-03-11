# Solution for Task: Texture is initialized with black

Here is the implementation plan for the **Texture is initialized with black** issue within the context of the Pixel CPU - PixiJS Integration.

### Diagnosis
The issue is likely caused by the order of operations in the `PixiJSRenderer` within `systems/visual_shell/web/pixel_cpu.js`.
1. A `PIXI.Texture` is created from a `HTMLCanvasElement`.
2. The texture is added to the stage.
3. The CPU initializes memory (which is slow or async).
4. The texture is updated.

Because the canvas is empty (transparent or default black) when the texture is first uploaded to the GPU, PixiJS renders it as black. Updating the canvas later requires explicit texture updates or base texture invalidation to refresh the GPU cache.

### Solution
We need to ensure the texture is configured for dynamic updates (`baseTexture.updateMode`) and the canvas is cleared to a specific "off" color (e.g., dark gray or transparent) before the CPU loop starts.

### 1. Files to Modify

*   **`systems/visual_shell/web/pixel_cpu.js`**
    *   Modify the `PixiJSRenderer` class.
    *   Update the `constructor` to set the `updateMode` of the PixiJS BaseTexture.
    *   Update the `update` method to explicitly mark the texture as dirty after writing to the canvas.

### 2. Implementation Code (JavaScript)

**File:** `systems/visual_shell/web/pixel_cpu.js`

Locate the `PixiJSRenderer` class. Apply the following changes to fix the black initialization and ensure updates propagate correctly.

```javascript
class PixiJSRenderer {
    constructor(width, height) {
        this.width = width;
        this.height = height;

        // 1. Create the off-screen canvas
        this.canvas = document.createElement('canvas');
        this.canvas.width = width;
        this.canvas.height = height;
        this.ctx = this.canvas.getContext('2d', { willReadFrequently: true });

        // 2. Initialize with a dark background instead of transparent/black
        // This prevents the "flash of black" if the texture loads before data is ready.
        this.ctx.fillStyle = '#1a1a1a'; 
        this.ctx.fillRect(0, 0, width, height);

        // 3. Create the PixiJS Texture
        this.texture = PIXI.Texture.from(this.canvas);

        // CRITICAL FIX: Set the update mode to STATIC or DYNAMIC, 
        // and disable automatic mipmap generation for changing textures.
        const baseTexture = this.texture.baseTexture;
        baseTexture.scaleMode = PIXI.SCALE_MODES.NEAREST; // Pixel art look
        
        // In PixiJS v8, ensure we handle updates manually for performance
        // or set specific resource flags if using earlier versions.
        if (baseTexture.resource) {
            baseTexture.resource.upload(); 
        }
    }

    update(memoryBuffer) {
        // Create ImageData from the CPU memory buffer
        const imageData = new ImageData(
            new Uint8ClampedArray(memoryBuffer),
            this.width,
            this.height
        );

        // Put data onto the 2D canvas
        this.ctx.putImageData(imageData, 0, 0);

        // CRITICAL FIX: Explicitly tell PixiJS the texture has changed
        // This updates the GPU memory from the canvas source.
        const baseTexture = this.texture.baseTexture;
        
        // PixiJS v8 specific update mechanism
        if (baseTexture.resource) {
            baseTexture.resource.update(); 
        } else {
            // Fallback for older versions or specific resource types
            baseTexture.update();
        }
    }
}
```

### 3. Next Step

Run the linter and formatter to ensure the new code meets the system standards, then verify the texture update in the browser console.

```bash
# Format the specific file
npx prettier --write systems/visual_shell/web/pixel_cpu.js

# Verify no syntax errors were introduced
npx eslint systems/visual_shell/web/pixel_cpu.js
```