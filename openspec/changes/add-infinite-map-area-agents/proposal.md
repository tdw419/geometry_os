# Proposal: Add Infinite Map Area Agents

## Summary

Implement an area-based agent assignment system for the Infinite Map, where specialized agents are responsible for specific regions of the infinite spatial substrate. This organizational pattern enables parallel development, focused expertise, and better resource management.

## Motivation

The Geometry OS Infinite Map is a vast spatial substrate where different types of functionality coexist. Without clear organizational boundaries:
- Agents compete for the same resources
- Task routing becomes ambiguous
- It's difficult to scale individual subsystems
- Health monitoring lacks granularity

## Solution

### Area Definitions

| Area ID | Agent | Region | Z-Layer | Responsibilities |
|---------|-------|--------|---------|-----------------|
| `core_compositor` | CoreCompositorAgent | 0,0 → 2048,2048 | 10 | Windows, layers, surfaces, DMA-BUF |
| `visual_shell` | VisualShellAgent | 2048,0 → 4096,2048 | 15 | UI components, commands, theming |
| `neural_cognitive` | NeuralCognitiveAgent | 0,2048 → 2048,4096 | 5 | Intent, decisions, memory |
| `graphics_rendering` | GraphicsAgent | 2048,2048 → 4096,4096 | 8 | Shaders, textures, VRAM |
| `input_interaction` | InputInteractionAgent | 0,0 → 1024,1024 | 20 | Devices, events, gestures |
| `system_services` | SystemServicesAgent | 1024,1024 → 3072,3072 | 1 | Files, processes, network |
| `development_tools` | DevelopmentToolsAgent | 3072,0 → 4096,1024 | 3 | Build, debug, profile |

### Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                  InfiniteMapAreaManager                     │
│  - Lifecycle management                                      │
│  - Task routing                                              │
│  - Health monitoring                                         │
│  - Inter-agent coordination                                  │
└─────────────────────────────────────────────────────────────┘
         │
         ├── CoreCompositorAgent
         ├── VisualShellAgent
         ├── NeuralCognitiveAgent
         ├── GraphicsAgent
         ├── InputInteractionAgent
         ├── SystemServicesAgent
         └── DevelopmentToolsAgent
```

### Key Features

1. **Clear Area Ownership**: Each agent has exclusive responsibility for its domain
2. **Task Routing**: Manager auto-routes tasks based on type prefix
3. **Health Monitoring**: Per-agent health scores with alerting
4. **Inter-agent Communication**: Agents can send tasks to each other
5. **Hilbert Mapping**: Area boundaries use Hilbert curve for spatial locality

## Implementation

### Files Created

```
systems/infinite_map/
├── __init__.py              # Module exports
├── area_manager.py          # Central InfiniteMapAreaManager
├── demo_area_manager.py     # Demo script
└── area_agents/
    ├── __init__.py          # Agent exports
    ├── base_agent.py        # Abstract AreaAgent base class
    ├── compositor_agent.py  # Window/layer management
    ├── visual_shell_agent.py# UI components/commands
    ├── neural_cognitive_agent.py  # Intent/memory
    ├── graphics_agent.py    # Shaders/textures
    ├── input_agent.py       # Input handling
    ├── services_agent.py    # System services
    └── devtools_agent.py    # Development tools
```

## Impact

- **Performance**: Parallel agent execution, isolated resource pools
- **Scalability**: Add new areas without modifying existing agents
- **Maintainability**: Clear boundaries for code ownership
- **Testing**: Agents can be tested independently

## Visual Impact

The Infinite Map gains spatial organization:
- Top-left quadrant: Compositor (windows, composition)
- Top-right quadrant: Visual Shell (UI components)
- Bottom-left quadrant: Neural Cognitive (AI processing)
- Bottom-right quadrant: Graphics (GPU resources)

## Success Metrics

- All 7 agents start successfully ✅
- Task routing works for all task types ✅
- Health monitoring reports accurate scores ✅
- Demo completes without errors ✅
