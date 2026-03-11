# OpenSpec Change: Pixel CPU - PixiJS Integration

## Overview

This OpenSpec change defines the integration between the Pixel CPU emulator and the PixiJS infinite map, enabling real-time execution of `.brick` files within the Geometry OS visual shell.

**Phase**: Phase 40  
**Status**: Draft  
**Created**: 2025-01-25

## Problem Statement

Geometry OS currently has two powerful but disconnected components:

1. **Pixel CPU Emulator** ([`pixel_cpu.js`](systems/visual_shell/web/pixel_cpu.js:1)) - JavaScript implementation of a RISC-V compatible CPU that can execute `.brick` files containing transpiled RISC-V instructions.

2. **PixiJS Infinite Map** ([`infinite_map.js`](systems/visual_shell/web/infinite_map.js:1)) - High-performance infinite scrolling map using PixiJS v8 that displays visual tiles and handles real-time updates.

**Critical Gap**: There is no integration between the CPU emulator and the visual map, preventing:
- Execution of `.brick` files within the visual shell
- Framebuffer memory mapping to PixiJS textures
- Console I/O for Linux kernel output display
- Real-time visualization of CPU state on the infinite map

## Solution

Integrate the Pixel CPU emulator with the PixiJS infinite map to create a unified system where:
1. The CPU executes `.brick` files in real-time within the browser
2. CPU framebuffer memory is mapped to PixiJS textures for visual display
3. Console I/O is captured and displayed on the infinite map
4. CPU state (registers, PC, cycles) is visualized in real-time
5. The system can boot and display a RISC-V Linux kernel

## Documents

### Core Documents

- **[proposal.md](proposal.md)** - High-level proposal describing the problem, solution, and impact
- **[design.md](design.md)** - Detailed technical design with architecture, implementation details, and visual language
- **[tasks.md](tasks.md)** - Comprehensive task breakdown with 35+ implementation tasks organized by phase
- **[specs/spec.md](specs/spec.md)** - Formal specification with API definitions, memory map, and performance requirements

## Quick Start

### For Developers

1. **Read the Proposal**: Start with [`proposal.md`](proposal.md) to understand the high-level goals
2. **Review the Design**: Study [`design.md`](design.md) for technical architecture
3. **Check the Tasks**: Review [`tasks.md`](tasks.md) for implementation steps
4. **Reference the Spec**: Use [`specs/spec.md`](specs/spec.md) for API details and requirements

### For MCP Orchestrator

The MCP Orchestrator should use this OpenSpec change as follows:

1. **Load the Proposal**: Read [`proposal.md`](proposal.md) to understand the objectives
2. **Review the Design**: Study [`design.md`](design.md) for architecture decisions
3. **Execute Tasks**: Follow [`tasks.md`](tasks.md) in order, respecting dependencies
4. **Validate Against Spec**: Ensure implementation meets [`specs/spec.md`](specs/spec.md) requirements

## Architecture

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

## Memory Map

| Address Range | Size | Purpose |
|---------------|------|---------|
| 0x00000000 - 0x000FFFFF | 1 MB | Program Memory (Instructions) |
| 0x10000000 - 0x100FFFFF | 1 MB | Data Memory (Variables, Stack) |
| 0x20000000 - 0x2000FFFF | 64 KB | Console I/O (Memory-Mapped) |
| 0x30000000 - 0x3FFFFFFF | 4 MB | Framebuffer (640x480x4 bytes) |

## Key Features

### 1. CPU Execution Engine
- Integrate [`SimplePixelCPU`](systems/visual_shell/web/pixel_cpu.js:8) into infinite map render loop
- Execute instructions in chunks per frame (e.g., 1000 cycles/frame)
- Support async execution for non-blocking UI

### 2. Framebuffer Memory Mapping
- Map CPU memory region (0x30000000-0x3FFFFFFF) to framebuffer
- Convert memory bytes to RGBA pixel data
- Update PixiJS texture from framebuffer data
- Support multiple resolutions (640x480, 800x600, 1024x768)

### 3. Console I/O System
- Map memory-mapped I/O for console output (0x20000000)
- Capture characters written to console memory
- Display console output on infinite map tile
- Support scrolling and ANSI color codes

### 4. CPU State Visualization
- Display registers, PC, cycles in real-time
- Show execution flow with highlighting
- Visualize memory access patterns
- Debug overlay for stepping through instructions

### 5. Brick File Loading
- Load `.brick` files from server
- Parse V2BrickHeader (132 bytes)
- Extract instructions and metadata
- Support hot-reloading during development

## Performance Targets

- **Frame Rate**: 60 FPS (16ms per frame)
- **CPU Execution**: < 5ms per frame
- **Framebuffer Update**: < 3ms per frame
- **Memory Overhead**: < 10 MB

## Success Criteria

1. ✅ Pixel CPU executes `.brick` files within infinite map
2. ✅ Framebuffer memory is mapped to PixiJS texture
3. ✅ Console output is displayed on infinite map
4. ✅ CPU state is visualized in real-time
5. ✅ System maintains 60 FPS during execution
6. ✅ Test `.brick` file runs successfully
7. ✅ RISC-V Linux kernel boots (basic output)

## Implementation Timeline

- **Week 1**: Foundation (PixelCPUIntegration class, memory-mapped I/O)
- **Week 2**: Framebuffer integration and console I/O
- **Week 3**: CPU state visualization and brick file loading
- **Week 4**: InfiniteMap integration and UI controls
- **Week 5**: Testing, optimization, and debugging tools
- **Week 6**: Linux boot attempt and documentation

**Total Estimated Time**: ~65.5 hours (approximately 2 weeks of full-time work)

## Dependencies

### Existing Components
- [`pixel_cpu.js`](systems/visual_shell/web/pixel_cpu.js:1) - CPU emulator
- [`infinite_map.js`](systems/visual_shell/web/infinite_map.js:1) - PixiJS map
- PixiJS v8 - Graphics rendering library
- Brick file format - V2BrickHeader specification

### External Libraries
- PixiJS v8.0.0 or higher
- ES2020+ JavaScript support

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

## Next Steps

1. ✅ Create OpenSpec change proposal (this document)
2. ✅ Design detailed architecture
3. ✅ Create implementation tasks
4. ✅ Write formal specification
5. ⏳ Launch MCP Orchestrator for implementation

## Files to Create

- `systems/visual_shell/web/pixel_cpu_integration.js` - Main integration class
- `systems/visual_shell/web/test_program.brick` - Test brick file
- `systems/visual_shell/web/tests/pixel_cpu_integration.test.js` - Unit tests
- `systems/visual_shell/web/tests/integration.test.js` - Integration tests
- `systems/visual_shell/web/tests/performance.test.js` - Performance tests
- `systems/visual_shell/web/API.md` - API documentation
- `systems/visual_shell/web/USER_GUIDE.md` - User guide

## Files to Modify

- `systems/visual_shell/web/pixel_cpu.js` - Add memory-mapped I/O support
- `systems/visual_shell/web/infinite_map.js` - Integrate CPU execution
- `systems/visual_shell/web/index.html` - Add script loading

## Related OpenSpec Changes

- [add-visual-shell-core](../add-visual-shell-core/) - Visual shell foundation
- [add-geometry-os-framework](../add-geometry-os-framework/) - Geometry OS framework

## Contact

For questions or issues related to this OpenSpec change, please refer to the main Geometry OS documentation or contact the development team.

---

**Last Updated**: 2025-01-25  
**Version**: 1.0.0
