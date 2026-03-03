# Geometry OS v1.0

**A GPU-Native, Self-Hosting Operating System**

> "Where Logic is Light, and the Map is the Territory"

## Overview

Geometry OS is a visual operating system that runs entirely on the GPU using WebGPU/SPIR-V. Instead of traditional text-based programming, it uses **morphological glyphs** — visual symbols that represent computational operations.

### Key Features

- **Self-Hosting**: The `geo_cc.spv` compiler can compile itself
- **GPU-Native**: All processes run as SPIR-V shaders on the GPU
- **Visual Language**: Programs are written using glyphs (⊕, ⊖, →, ←, etc.)
- **Hilbert Memory**: Spatial memory layout using Hilbert curve addressing
- **Agent Inhabitation**: AI agents have 3D avatars that manipulate the system

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Geometry OS v1.0                         │
├─────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐  │
│  │ GlyphTerminal│  │ AgentManager│  │ InteractionManager │  │
│  └──────┬──────┘  └──────┬──────┘  └──────────┬──────────┘  │
│         │                │                     │             │
│  ┌──────┴────────────────┴─────────────────────┴──────┐     │
│  │                  GeometryOS.js                      │     │
│  │              (Root Controller / Compositor)         │     │
│  └────────────────────────┬───────────────────────────┘     │
│                           │                                 │
│  ┌────────────────────────┴───────────────────────────┐     │
│  │               GeometryKernel.js                     │     │
│  │          (GPU Process Scheduler, IPC, Memory)       │     │
│  └────────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────┘
```

## Memory Sectors (Hilbert Layout)

| Sector | Address Range | Purpose |
|--------|---------------|---------|
| KERNEL | 0 - 1,023 | Process Control Blocks, Scheduler |
| MAILBOX | 1,024 - 1,535 | IPC Message Queues |
| SHELL | 2,048 - 6,143 | Process RAM |
| FILES | 8,192 - 24,575 | Filesystem |
| MEMORY | 32,768 - 65,535 | Visual Substrate |
| AGENTS | 65,536 - 81,919 | Avatar Space |

## Morphological Glyphs

### Arithmetic
| Glyph | Code | Operation |
|-------|------|-----------|
| ⊕ | 160 | FADD (Float Add) |
| ⊖ | 161 | FSUB (Float Subtract) |
| ⊗ | 162 | FMUL (Float Multiply) |
| ⊘ | 163 | FDIV (Float Divide) |

### Memory
| Glyph | Code | Operation |
|-------|------|-----------|
| → | 164 | STORE |
| ← | 165 | LOAD |
| ⇒ | 166 | SHARED_STORE |
| ⇐ | 167 | SHARED_LOAD |

### Control Flow
| Glyph | Code | Operation |
|-------|------|-----------|
| ↻ | 168 | JMP (Jump) |
| ∅ | 169 | JZ (Jump if Zero) |
| ◉ | 170 | JNZ (Jump if Not Zero) |
| █ | 171 | LABEL |
| ▣ | 172 | RETURN |

### IPC
| Glyph | Code | Operation |
|-------|------|-----------|
| ✉ | 173 | MSG_SEND |
| 📥 | 174 | MSG_RECV |
| 👁 | 175 | MSG_PEEK |

## Quick Start

```bash
# Clone the repository
git clone https://github.com/tdw419/geometry_os.git
cd geometry_os

# Generate the font atlas
python3 core/atlas_gen.py

# Build the standard library
python3 core/libgeo.py core/libgeo.spv

# Build the self-hosting compiler
python3 core/geo_cc.py

# Start the web server
python3 -m http.server 8080

# Open in browser
open http://localhost:8080/web/index.html
```

## Project Structure

```
geometry-os/
├── core/                    # Python build tools
│   ├── atlas_gen.py         # Font atlas generator
│   ├── geo_cc.py            # Self-hosting compiler
│   ├── init.py              # Boot process generator
│   ├── libgeo.py            # Visual standard library
│   └── spirv_gen.py         # SPIR-V code generation
│
├── web/                     # Browser runtime
│   ├── GeometryOS.js        # Root controller
│   ├── GeometryKernel.js    # GPU kernel
│   ├── AgentManager.js      # AI agent avatars
│   ├── GlyphTerminal.js     # Interactive console
│   ├── InteractionManager.js # Haptic manipulation
│   ├── VisualShell.js       # Visual command interface
│   └── assets/              # Font atlas, resources
│
├── tests/                   # Test suite
│   └── test_geometry_os.py
│
└── docs/                    # Documentation
```

## The Self-Hosting Loop

1. `geo_cc.spv` reads glyph program from Visual RAM
2. Lexical analysis tokenizes glyphs
3. Parser builds AST
4. Code generator emits SPIR-V
5. Output written to executable memory
6. New binary can compile more programs (including itself)

## License

MIT

---

*"The era of symbolic computation is over. The era of geometric intelligence has begun."*
