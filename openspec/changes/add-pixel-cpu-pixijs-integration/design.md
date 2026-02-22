# Design: Pixel CPU - PixiJS Integration

## Principles

1. **Non-Blocking Execution**: CPU execution must not block the render loop
2. **Visual-First**: CPU state is visualized as part of the infinite map
3. **Memory-Mapped I/O**: Console and framebuffer use memory-mapped I/O for simplicity
4. **Incremental Loading**: Brick files are loaded asynchronously
5. **Performance First**: Maintain 60 FPS during CPU execution

## System Architecture

### Component Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                         Visual Shell (Browser)                       │
│                                                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                    PixiJS Application                        │   │
│  │  ┌────────────────────────────────────────────────────────┐  │   │
│  │  │              InfiniteMap Class                         │  │   │
│  │  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐ │  │   │
│  │  │  │ Visual Tiles │  │ CPU Display  │  │ Console Tile │ │  │   │
│  │  │  │   (Brick)    │  │  (Framebuffer)│  │   (I/O)     │ │  │   │
│  │  │  └──────────────┘  └──────────────┘  └──────────────┘ │  │   │
│  │  └────────────────────────────────────────────────────────┘  │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                │                                      │
│                                ▼                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                    PixelCPUIntegration                         │   │
│  │  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐        │   │
│  │  │ SimplePixel  │  │ Framebuffer  │  │ Console      │        │   │
│  │  │   CPU        │  │   Mapper     │  │   Manager    │        │   │
│  │  └──────────────┘  └──────────────┘  └──────────────┘        │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                                │                                      │
│                                ▼                                      │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │                    Brick File Loader                          │   │
│  └──────────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────┘
```

### Memory Map

```
Address Range        Size        Purpose
─────────────────────────────────────────────────────────────────────
0x00000000 -         1MB         Program Memory (Instructions)
0x000FFFFF
─────────────────────────────────────────────────────────────────────
0x10000000 -         1MB         Data Memory (Variables, Stack)
0x100FFFFF
─────────────────────────────────────────────────────────────────────
0x20000000 -         64KB        Console I/O (Memory-Mapped)
0x2000FFFF
  - 0x20000000: Console Output (write-only)
  - 0x20000001: Console Input (read-only)
  - 0x20000002: Console Status (read/write)
─────────────────────────────────────────────────────────────────────
0x30000000 -         4MB         Framebuffer (640x480x4 bytes)
0x3FFFFFFF
  - 0x30000000: Pixel data (RGBA, little-endian)
  - Format: Each pixel = 4 bytes (R,G,B,A)
─────────────────────────────────────────────────────────────────────
```

## Technical Implementation

### 1. PixelCPUIntegration Class

```javascript
class PixelCPUIntegration {
    constructor(infiniteMap, config = {}) {
        this.infiniteMap = infiniteMap;
        this.config = {
            cyclesPerFrame: 1000,      // CPU cycles per render frame
            framebufferBase: 0x30000000,
            consoleBase: 0x20000000,
            framebufferWidth: 640,
            framebufferHeight: 480,
            ...config
        };
        
        this.cpu = new SimplePixelCPU();
        this.framebufferTexture = null;
        this.consoleBuffer = '';
        this.consoleMaxLines = 24;
        this.running = false;
        this.paused = false;
    }
}
```

### 2. CPU Execution Loop

```javascript
/**
 * Execute CPU for a fixed number of cycles per frame
 * Called from PixiJS ticker (60 FPS)
 */
executeFrame() {
    if (!this.running || this.paused) return;
    
    const startTime = performance.now();
    const cyclesExecuted = this.cpu.execute(this.config.cyclesPerFrame);
    const executionTime = performance.now() - startTime;
    
    // Update framebuffer if memory changed
    this.updateFramebuffer();
    
    // Update console if output changed
    this.updateConsole();
    
    // Update CPU state visualization
    this.updateStateVisualization();
    
    // Log performance
    if (executionTime > 5) {
        console.warn(`CPU execution took ${executionTime.toFixed(2)}ms`);
    }
}
```

### 3. Framebuffer Mapping

```javascript
/**
 * Map CPU memory to PixiJS texture
 */
updateFramebuffer() {
    if (!this.framebufferTexture) return;
    
    const fbBase = this.config.framebufferBase;
    const width = this.config.framebufferWidth;
    const height = this.config.framebufferHeight;
    const pixelData = new Uint8ClampedArray(width * height * 4);
    
    // Copy memory to pixel data
    for (let y = 0; y < height; y++) {
        for (let x = 0; x < width; x++) {
            const offset = (y * width + x) * 4;
            const memAddr = fbBase + offset;
            
            // Read RGBA from memory
            pixelData[offset] = this.readMemory(memAddr);     // R
            pixelData[offset + 1] = this.readMemory(memAddr + 1); // G
            pixelData[offset + 2] = this.readMemory(memAddr + 2); // B
            pixelData[offset + 3] = this.readMemory(memAddr + 3); // A
        }
    }
    
    // Update PixiJS texture
    const imageData = new ImageData(pixelData, width, height);
    this.framebufferTexture.update(imageData);
}
```

### 4. Console I/O

```javascript
/**
 * Write character to console (memory-mapped I/O)
 */
writeConsole(char) {
    const consoleBase = this.config.consoleBase;
    
    // Check if character is printable
    if (char >= 32 && char <= 126) {
        this.consoleBuffer += String.fromCharCode(char);
    } else if (char === 10) { // Newline
        this.consoleBuffer += '\n';
    } else if (char === 13) { // Carriage return
        // Ignore
    }
    
    // Limit buffer size
    const lines = this.consoleBuffer.split('\n');
    if (lines.length > this.consoleMaxLines) {
        this.consoleBuffer = lines.slice(-this.consoleMaxLines).join('\n');
    }
    
    // Update console display
    this.updateConsoleDisplay();
}

/**
 * Update console tile on infinite map
 */
updateConsoleDisplay() {
    const consoleTile = this.infiniteMap.tiles.get('0,0');
    if (consoleTile && consoleTile.sprite) {
        // Update text on console tile
        // Implementation depends on how console tile is rendered
    }
}
```

### 5. CPU State Visualization

```javascript
/**
 * Create CPU state overlay
 */
createStateOverlay() {
    const overlay = new PIXI.Container();
    overlay.x = 10;
    overlay.y = 10;
    overlay.zIndex = 1000;
    
    // Background
    const bg = new PIXI.Graphics();
    bg.beginFill(0x000000, 0.8);
    bg.lineStyle(2, 0x00AAFF, 1);
    bg.drawRoundedRect(0, 0, 300, 400, 8);
    bg.endFill();
    overlay.addChild(bg);
    
    // Title
    const title = new PIXI.Text('🖥️  CPU State', {
        fontFamily: 'Arial',
        fontSize: 16,
        fontWeight: 'bold',
        fill: 0x00AAFF
    });
    title.x = 10;
    title.y = 10;
    overlay.addChild(title);
    
    // Register display
    this.registerText = new PIXI.Text('', {
        fontFamily: 'Monaco',
        fontSize: 10,
        fill: 0xFFFFFF
    });
    this.registerText.x = 10;
    this.registerText.y = 40;
    overlay.addChild(this.registerText);
    
    // PC display
    this.pcText = new PIXI.Text('', {
        fontFamily: 'Monaco',
        fontSize: 12,
        fontWeight: 'bold',
        fill: 0xFFAA00
    });
    this.pcText.x = 10;
    this.pcText.y = 200;
    overlay.addChild(this.pcText);
    
    // Cycles display
    this.cyclesText = new PIXI.Text('', {
        fontFamily: 'Monaco',
        fontSize: 12,
        fill: 0x00FF00
    });
    this.cyclesText.x = 10;
    this.cyclesText.y = 230;
    overlay.addChild(this.cyclesText);
    
    // Add to infinite map
    this.infiniteMap.world.addChild(overlay);
    this.stateOverlay = overlay;
}

/**
 * Update CPU state display
 */
updateStateVisualization() {
    const state = this.cpu.getState();
    
    // Update registers
    let regText = 'Registers:\n';
    for (let i = 0; i < 8; i++) {
        regText += `R${i.toString().padStart(2, '0')}: 0x${state.registers[i].toString(16).padStart(8, '0')}\n`;
    }
    this.registerText.text = regText;
    
    // Update PC
    this.pcText.text = `PC: 0x${state.pc.toString(16).padStart(8, '0')}`;
    
    // Update cycles
    this.cyclesText.text = `Cycles: ${state.cycles}`;
}
```

### 6. Brick File Loading

```javascript
/**
 * Load and execute a .brick file
 */
async loadBrick(brickName) {
    try {
        console.log(`📦 Loading brick: ${brickName}`);
        
        // Load brick file
        await this.cpu.loadBrick(`/builder/queue/${brickName}`);
        
        // Reset CPU
        this.cpu.reset();
        
        // Create framebuffer texture
        this.createFramebufferTexture();
        
        // Create console tile
        this.createConsoleTile();
        
        // Start execution
        this.running = true;
        this.paused = false;
        
        console.log(`✓ Brick loaded and execution started`);
    } catch (error) {
        console.error(`Failed to load brick:`, error);
        throw error;
    }
}

/**
 * Create framebuffer texture for display
 */
createFramebufferTexture() {
    const width = this.config.framebufferWidth;
    const height = this.config.framebufferHeight;
    
    // Create blank texture
    const canvas = document.createElement('canvas');
    canvas.width = width;
    canvas.height = height;
    const ctx = canvas.getContext('2d');
    ctx.fillStyle = '#000000';
    ctx.fillRect(0, 0, width, height);
    
    // Create PixiJS texture from canvas
    this.framebufferTexture = PIXI.Texture.from(canvas);
    
    // Create sprite for framebuffer
    const sprite = new PIXI.Sprite(this.framebufferTexture);
    sprite.x = 100;
    sprite.y = 100;
    sprite.width = width;
    sprite.height = height;
    
    // Add to infinite map
    this.infiniteMap.world.addChild(sprite);
    this.framebufferSprite = sprite;
}
```

### 7. Integration with InfiniteMap

```javascript
/**
 * Integrate CPU execution into InfiniteMap render loop
 */
class InfiniteMap {
    // ... existing code ...
    
    constructor(worldContainer, config = {}) {
        // ... existing initialization ...
        
        // Initialize CPU integration
        this.cpuIntegration = new PixelCPUIntegration(this, config.cpu);
        
        // Create CPU state overlay
        this.cpuIntegration.createStateOverlay();
        
        // Add CPU execution to ticker
        this.app.ticker.add(() => {
            this.cpuIntegration.executeFrame();
        });
    }
    
    /**
     * Load and execute a brick file on the map
     */
    async loadBrick(brickName) {
        await this.cpuIntegration.loadBrick(brickName);
    }
    
    /**
     * Pause/resume CPU execution
     */
    toggleCpuPause() {
        this.cpuIntegration.paused = !this.cpuIntegration.paused;
        console.log(`CPU ${this.cpuIntegration.paused ? 'paused' : 'resumed'}`);
    }
}
```

## Visual Language

### Color Palette

- **CPU State**: Blue accent (#00AAFF)
- **Registers**: White text (#FFFFFF)
- **PC Highlight**: Orange (#FFAA00)
- **Cycles**: Green (#00FF00)
- **Console**: Terminal green (#00FF00) on black (#000000)
- **Framebuffer**: Direct pixel mapping

### Typography

- **Monospace**: Monaco, Consolas for code/data
- **Sans-serif**: Arial for UI labels
- **Font Sizes**: 10-16px depending on importance

### Layout

- **CPU State Overlay**: Top-left corner (10, 10)
- **Framebuffer**: Center of map (100, 100)
- **Console**: Bottom of screen or dedicated tile
- **Visual Tiles**: Surrounding the CPU display

## Performance Considerations

### Cycle Budgeting

- **Target**: 60 FPS = 16.67ms per frame
- **CPU Execution**: < 5ms per frame
- **Framebuffer Update**: < 3ms per frame
- **Console Update**: < 1ms per frame
- **State Visualization**: < 2ms per frame

### Optimization Strategies

1. **Dirty Tracking**: Only update framebuffer when memory changes
2. **Partial Updates**: Update only changed regions of framebuffer
3. **Texture Compression**: Use compressed texture formats if available
4. **Web Workers**: Offload CPU execution to web worker (future)
5. **SIMD**: Use SIMD operations for memory copying (future)

### Memory Management

- **Framebuffer**: 4MB for 640x480x4 bytes
- **CPU Memory**: 2MB (1MB instructions + 1MB data)
- **Console Buffer**: ~10KB
- **Total**: ~6MB overhead

## Impact Analysis

### Geometric Integrity

- **PAS Score**: Target > 0.95
- **Symmetry**: High (balanced CPU/visual load)
- **Complexity**: Medium (integration of existing components)

### System Health

- **Performance**: Critical (must maintain 60 FPS)
- **Stability**: High (isolated CPU execution)
- **Extensibility**: High (easy to add new instructions)

## Mockup Description

A dark infinite map with:
- CPU state overlay in top-left showing registers, PC, cycles
- Framebuffer display in center showing rendered output
- Console tile at bottom showing kernel output
- Visual tiles surrounding the CPU display
- Real-time updates as CPU executes instructions

## Testing Strategy

### Unit Tests

- CPU instruction execution
- Memory read/write operations
- Console I/O
- Framebuffer mapping

### Integration Tests

- Brick file loading
- CPU execution loop
- Framebuffer display
- Console output

### Performance Tests

- Frame rate during execution
- Memory usage
- CPU cycle throughput

### End-to-End Tests

- Load simple program
- Execute and verify output
- Boot Linux kernel (basic)

## Future Enhancements

1. **Web Worker Support**: Offload CPU execution to separate thread
2. **Debugging**: Step-through execution, breakpoints
3. **Instruction Tracing**: Log all executed instructions
4. **Memory Inspector**: Visualize memory contents
5. **Multiple CPUs**: Support SMP (Symmetric Multiprocessing)
6. **Network I/O**: Memory-mapped network interface
7. **Disk I/O**: Memory-mapped disk interface
8. **GPU Acceleration**: Use WebGL for framebuffer updates
