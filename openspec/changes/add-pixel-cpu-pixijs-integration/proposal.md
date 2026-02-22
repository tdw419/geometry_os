# Proposal: Add Pixel CPU - PixiJS Integration (Phase 40)

## Problem

Geometry OS currently has two powerful but disconnected components:

1. **Pixel CPU Emulator** ([`pixel_cpu.js`](systems/visual_shell/web/pixel_cpu.js:1)) - JavaScript implementation of a RISC-V compatible CPU that can execute `.brick` files containing transpiled RISC-V instructions. Currently isolated and not integrated into the visual system.

2. **PixiJS Infinite Map** ([`infinite_map.js`](systems/visual_shell/web/infinite_map.js:1)) - High-performance infinite scrolling map using PixiJS v8 that displays visual tiles and handles real-time updates. Currently lacks CPU execution capabilities.

**Critical Gap**: There is no integration between the CPU emulator and the visual map, preventing:
- Execution of `.brick` files within the visual shell
- Framebuffer memory mapping to PixiJS textures
- Console I/O for Linux kernel output display
- Real-time visualization of CPU state on the infinite map

## Solution

Initiate Phase 40: Pixel CPU - PixiJS Integration.

We will integrate the Pixel CPU emulator with the PixiJS infinite map to create a unified system where:
1. The CPU executes `.brick` files in real-time within the browser
2. CPU framebuffer memory is mapped to PixiJS textures for visual display
3. Console I/O is captured and displayed on the infinite map
4. CPU state (registers, PC, cycles) is visualized in real-time
5. The system can boot and display a RISC-V Linux kernel

## Technical Approach

### Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    PixiJS Infinite Map                       │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐       │
│  │  Visual Tile │  │  Visual Tile │  │  Visual Tile │       │
│  │  (Brick)     │  │  (Brick)     │  │  (Brick)     │       │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘       │
│         │                 │                 │               │
│         └─────────────────┼─────────────────┘               │
│                           │                                  │
│                  ┌────────▼────────┐                         │
│                  │  Pixel CPU      │                         │
│                  │  Emulator       │                         │
│                  │  (JavaScript)   │                         │
│                  └────────┬────────┘                         │
│                           │                                  │
│              ┌────────────┼────────────┐                    │
│              │            │            │                    │
│         ┌────▼───┐  ┌────▼───┐  ┌────▼───┐                 │
│         │Memory  │  │Console │  │  State │                 │
│         │Mapping │  │  I/O   │  │Visual  │                 │
│         └────────┘  └────────┘  └────────┘                 │
└─────────────────────────────────────────────────────────────┘
```

### Key Components

1. **CPU Execution Engine**
   - Integrate [`SimplePixelCPU`](systems/visual_shell/web/pixel_cpu.js:8) into infinite map render loop
   - Execute instructions in chunks per frame (e.g., 1000 cycles/frame)
   - Support async execution for non-blocking UI

2. **Framebuffer Memory Mapping**
   - Map CPU memory region (e.g., 0x1000000-0x100FFFF) to framebuffer
   - Convert memory bytes to RGBA pixel data
   - Update PixiJS texture from framebuffer data
   - Support multiple resolutions (640x480, 800x600, 1024x768)

3. **Console I/O System**
   - Map memory-mapped I/O for console output (e.g., 0x2000000)
   - Capture characters written to console memory
   - Display console output on infinite map tile
   - Support scrolling and ANSI color codes

4. **CPU State Visualization**
   - Display registers, PC, cycles in real-time
   - Show execution flow with highlighting
   - Visualize memory access patterns
   - Debug overlay for stepping through instructions

5. **Brick File Loading**
   - Load `.brick` files from server
   - Parse V2BrickHeader (132 bytes)
   - Extract instructions and metadata
   - Support hot-reloading during development

## Impact

- **Architecture**: Deep integration of CPU emulator with visual shell
- **Visual**: Real-time CPU execution visualization on infinite map
- **Performance**: Requires careful cycle budgeting to maintain 60 FPS
- **Functionality**: Enables booting Linux kernel in browser

## Risks

- **Performance**: CPU execution may block rendering if not properly throttled
- **Memory**: Framebuffer mapping requires significant memory allocation
- **Complexity**: Integration involves multiple subsystems with complex interactions
- **Compatibility**: RISC-V instruction set may need extensions for Linux boot

## Validation Strategy

- **Performance**: Maintain 60 FPS during CPU execution
- **Correctness**: Verify CPU execution against reference implementation
- **Visual**: Confirm framebuffer display matches expected output
- **Linux Boot**: Successfully boot simple RISC-V Linux kernel

## Success Criteria

1. ✅ Pixel CPU executes `.brick` files within infinite map
2. ✅ Framebuffer memory is mapped to PixiJS texture
3. ✅ Console output is displayed on infinite map
4. ✅ CPU state is visualized in real-time
5. ✅ System maintains 60 FPS during execution
6. ✅ Test `.brick` file runs successfully
7. ✅ RISC-V Linux kernel boots (basic output)

## Dependencies

- Existing [`pixel_cpu.js`](systems/visual_shell/web/pixel_cpu.js:1) - CPU emulator
- Existing [`infinite_map.js`](systems/visual_shell/web/infinite_map.js:1) - PixiJS map
- PixiJS v8 - Graphics rendering library
- Brick file format - V2BrickHeader specification

## Timeline

- **Week 1**: Architecture design and specification
- **Week 2**: CPU execution integration
- **Week 3**: Framebuffer mapping
- **Week 4**: Console I/O and state visualization
- **Week 5**: Testing and optimization
- **Week 6**: Linux kernel boot attempt

## Next Steps

1. ✅ Create OpenSpec change proposal (this document)
2. ⏳ Design detailed architecture
3. ⏳ Create implementation tasks
4. ⏳ Write formal specification
5. ⏳ Launch MCP Orchestrator for implementation
