# Solution for Task: Dirty tracking reduces unnecessary updates

Here is the implementation plan for the **Dirty Tracking** feature within the Geometry OS Pixel CPU - PixiJS Integration.

This feature is critical for **Principle 5: Performance First**. Without dirty tracking, the system would attempt to upload the entire GPU framebuffer texture every single frame (60 times a second), even if the CPU only updated a single pixel. This would kill performance and violate the 60 FPS requirement.

### 1. File Paths

**New Files**
*   `systems/visual_shell/web/pixel_cpu/gpu_buffer.js`
    *   *Description*: A wrapper around the `Uint32Array` memory that tracks write coordinates and manages a "dirty rectangle" (bounding box of changes).

**Modified Files**
*   `systems/visual_shell/web/pixel_cpu.js`
    *   *Description*: Import `GpuBuffer` and replace the raw `Uint32Array` initialization with the new `GpuBuffer` class.
*   `systems/visual_shell/web/infinite_map.js`
    *   *Description*: Access the `GpuBuffer` instance to check `isDirty` and retrieve the `dirtyRect` bounds before calling `texture.update()`.

---

### 2. Code Implementation

#### A. The `GpuBuffer` Class (Dirty Tracking Logic)
This class intercepts memory writes to mark exactly where the CPU has drawn.

**File:** `systems/visual_shell/web/pixel_cpu/gpu_buffer.js`

```javascript
/**
 * GpuBuffer
 * Wraps the CPU memory to track modifications (Dirty Tracking).
 * Optimizes PixiJS texture uploads by only updating changed regions.
 */
export class GpuBuffer {
    constructor(width, height) {
        this.width = width;
        this.height = height;
        // Underlying memory buffer (shared with CPU view)
        this.buffer = new Uint32Array(width * height);
        
        // Dirty State
        this._dirty = false;
        this._dirtyRect = {
            x1: width,
            y1: height,
            x2: 0,
            y2: 0
        };
    }

    /**
     * Called by the CPU or Memory Controller when a write occurs at 'address'.
     * Maps linear memory address to 2D coordinates.
     */
    markDirty(address) {
        this._dirty = true;
        
        const index = address >> 2; // Convert byte address to 32-bit word index
        const x = index % this.width;
        const y = Math.floor(index / this.width);

        // Expand the bounding box
        if (x < this._dirtyRect.x1) this._dirtyRect.x1 = x;
        if (x > this._dirtyRect.x2) this._dirtyRect.x2 = x;
        if (y < this._dirtyRect.y1) this._dirtyRect.y1 = y;
        if (y > this._dirtyRect.y2) this._dirtyRect.y2 = y;
    }

    /**
     * Checks if the buffer needs an upload.
     */
    isDirty() {
        return this._dirty;
    }

    /**
     * Returns the bounding box of changes and resets the state.
     */
    consumeDirtyRect() {
        if (!this._dirty) return null;

        // Clone current rect
        const rect = { 
            x: this._dirtyRect.x1, 
            y: this._dirtyRect.y1, 
            width: (this._dirtyRect.x2 - this._dirtyRect.x1) + 1, 
            height: (this._dirtyRect.y2 - this._dirtyRect.y1) + 1 
        };

        // Reset state for next frame
        this._dirty = false;
        this._dirtyRect = { x1: this.width, y1: this.height, x2: 0, y2: 0 };

        return rect;
    }
}
```

#### B. Integration: `infinite_map.js` (PixiJS Render Loop)
This modification ensures we only upload the specific chunk of pixels that changed.

**File:** `systems/visual_shell/web/infinite_map.js` (Snippet)

```javascript
import { GpuBuffer } from './pixel_cpu/gpu_buffer.js';

class InfiniteMap {
    // ... existing setup code ...

    updateTextureFromCPU(cpuState) {
        const gpuBuffer = cpuState.gpu; // The GpuBuffer instance

        if (gpuBuffer && gpuBuffer.isDirty()) {
            const dirtyRect = gpuBuffer.consumeDirtyRect();

            if (dirtyRect) {
                // Create a temporary Uint32Array view for just the dirty region
                // This is much faster than uploading the whole 1024x1024 texture
                const rowWidth = this.framebufferWidth;
                const size = dirtyRect.width * dirtyRect.height;
                const subBuffer = new Uint32Array(size);

                // Extract the dirty rows from the main buffer
                for (let y = 0; y < dirtyRect.height; y++) {
                    const srcOffset = ((dirtyRect.y + y) * rowWidth) + dirtyRect.x;
                    const dstOffset = y * dirtyRect.width;
                    subBuffer.set(gpuBuffer.buffer.subarray(srcOffset, srcOffset + dirtyRect.width), dstOffset);
                }

                // Update PixiJS texture region
                // Note: In PixiJS v8, we update the underlying resource
                this.fbTexture.resource.source.update(subBuffer, dirtyRect.x, dirtyRect.y, dirtyRect.width, dirtyRect.height);
            }
        }
    }
}
```

---

### 3. Next Step

Create the `GpuBuffer` wrapper class to enable efficient memory-mapped I/O tracking.

**Command:**
```bash
mkdir -p systems/visual_shell/web/pixel_cpu
touch systems/visual_shell/web/pixel_buffer.js
```