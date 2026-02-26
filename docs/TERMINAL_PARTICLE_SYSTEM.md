# Terminal Particle System

A spatial window management system for terminal instances within the Geometry OS infinite canvas.

## Overview

The Terminal Particle System provides a way to create, manage, and persist multiple terminal windows as "particles" on an infinite canvas. Each terminal particle has spatial properties (position, scale, zIndex) and integrates with the Neural Event Bus (NEB) for cross-terminal coordination.

### Key Features

- **Spatial Management**: Terminals exist at specific world coordinates with scale and depth
- **Focus Management**: Single active terminal with visual highlighting
- **Persistence**: Terminal layouts saved to localStorage and restored on reload
- **NEB Integration**: Real-time event publishing for multi-client coordination
- **Keyboard Shortcuts**: Quick terminal creation, cycling, and destruction
- **Resize Handles**: Corner-based interactive resizing

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                      Application (PixiJS Stage)                 │
│                                                                 │
│  ┌───────────────────────────────────────────────────────────┐ │
│  │                    ParticleManager                        │ │
│  │                                                           │ │
│  │   ┌─────────────────┐  ┌─────────────────┐               │ │
│  │   │ TerminalWindow  │  │ TerminalWindow  │  ...          │ │
│  │   │    Particle     │  │    Particle     │               │ │
│  │   │                 │  │                 │               │ │
│  │   │  ┌───────────┐  │  │  ┌───────────┐  │               │ │
│  │   │  │TerminalWin│  │  │  │TerminalWin│  │               │ │
│  │   │  │   dow     │  │  │  │   dow     │  │               │ │
│  │   │  └───────────┘  │  │  └───────────┘  │               │ │
│  │   └─────────────────┘  └─────────────────┘               │ │
│  │                                                           │ │
│  │   Storage: Map<particleId, particle>                     │ │
│  │   Spatial Index: Map<cellKey, Set<particleId>>           │ │
│  │   Focus: focusedParticle reference                       │ │
│  └───────────────────────────────────────────────────────────┘ │
│                                                                 │
│   ┌─────────────┐    ┌─────────────┐    ┌─────────────┐       │
│   │ localStorage│    │ NEB Socket  │    │ xterm.js    │       │
│   │ (persist)   │    │ (events)    │    │ (render)    │       │
│   └─────────────┘    └─────────────┘    └─────────────┘       │
└─────────────────────────────────────────────────────────────────┘
```

### Component Hierarchy

```
PIXI.Stage
└── ParticleManager (manages lifecycle)
    └── ParticleLayer (PIXI.Container, sortableChildren=true)
        ├── TerminalWindowParticle (zIndex: 1)
        │   ├── ResizeHandle (nw)
        │   ├── ResizeHandle (ne)
        │   ├── ResizeHandle (sw)
        │   ├── ResizeHandle (se)
        │   └── TerminalWindow (internal)
        │       └── HTML Overlay (xterm.js)
        ├── TerminalWindowParticle (zIndex: 2)
        └── ...
```

## Usage Examples

### Creating a Terminal

**Programmatic:**

```javascript
// Via ParticleManager
const particle = particleManager.createTerminalParticle({
    x: 100,
    y: 100,
    width: 800,
    height: 500,
    title: 'My Terminal',
    wsUrl: 'ws://localhost:8769/terminal'
});

console.log('Created particle:', particle.particleId);
```

**Keyboard Shortcut:**

Press `Ctrl+Shift+N` to create a new terminal at the center of the viewport.

### Managing Terminals

```javascript
// Get all particles
const particles = particleManager.getAllParticles();

// Focus a specific particle
particleManager.focusParticle('terminal-123-abc');

// Cycle focus through particles
const nextParticle = particleManager.cycleFocus();

// Destroy a particle
particleManager.destroyParticle('terminal-123-abc');

// Get particles at a position
const nearby = particleManager.getParticleAtPosition(500, 300, 100);
```

### Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+Shift+N` | Create new terminal particle |
| `Ctrl+Shift+T` | Open terminal (legacy) |
| `Ctrl+Shift+W` | Close focused terminal |
| `Ctrl+Tab` | Cycle through terminals |
| `Ctrl+Shift+M` | Toggle heat map |
| `Ctrl+Shift+G` | Toggle gravity wells |
| `Shift + Middle Mouse` | Semantic drag |

### Mouse Interactions

| Action | Behavior |
|--------|----------|
| Click terminal | Focus and bring to front |
| Drag title bar | Move terminal |
| Drag corner handles | Resize terminal |
| Mouse wheel (focused) | Scale terminal (0.25x - 3.0x) |

## NEB Events

The Terminal Particle System publishes and subscribes to events on the Neural Event Bus (NEB) for cross-client coordination.

### Published Events

| Topic | Payload | Description |
|-------|---------|-------------|
| `terminal.particle.created` | `{ particleId, particleType, position }` | New particle created |
| `terminal.particle.destroyed` | `{ particleId, particleType }` | Particle removed |
| `terminal.particle.focused` | `{ particleId }` | Particle gained focus |
| `terminal.particle.moved` | `{ particleId, position }` | Particle position changed |
| `terminal.particle.resized` | `{ particleId, width, height }` | Particle resized |
| `terminal.particle.scaled` | `{ particleId, scale }` | Particle scale changed |

### Subscribed Events

| Topic | Handler |
|-------|---------|
| `terminal.particle.created` | Log creation, sync with other clients |
| `terminal.particle.moved` | Update position from remote clients |
| `terminal.particle.focused` | Sync focus state across clients |
| `terminal.particle.destroyed` | Log destruction, sync removal |

### NEB Integration Example

```javascript
// In application.js
connectNebBridge() {
    const ws = new WebSocket('ws://localhost:8765/neb');

    ws.onopen = () => {
        // Enable NEB on ParticleManager
        this.particleManager.setNebSocket(ws);
    };

    ws.onmessage = (event) => {
        const data = JSON.parse(event.data);
        this._handleNebEvent(data);
    };
}
```

## Persistence

### localStorage Format

Terminal layouts are automatically persisted to `localStorage` under the key `geometryOS_particleLayout`.

**Schema:**

```json
{
  "particles": [
    {
      "particleId": "terminal-1-1708123456789",
      "particleType": "terminal",
      "position": { "x": 100, "y": 150 },
      "scale": 1.0,
      "zIndex": 3,
      "config": {
        "width": 800,
        "height": 500,
        "title": "Terminal",
        "wsUrl": "ws://localhost:8769/terminal"
      }
    }
  ],
  "timestamp": 1708123456789,
  "version": 1
}
```

### Save/Load API

```javascript
// Save current layout
app.saveParticleLayout();
// Output: "💾 Particle layout saved: 3 particles"

// Load saved layout
app.loadParticleLayout();
// Output: "💾 Particle layout restored: 3 particles"
```

### Automatic Persistence

Layouts are saved automatically on:
- Particle creation
- Particle destruction
- Particle position change
- Particle resize

## Key Files

| File | Purpose |
|------|---------|
| `systems/visual_shell/web/TerminalWindowParticle.js` | Particle wrapper with spatial properties |
| `systems/visual_shell/web/TerminalWindow.js` | Internal terminal window with xterm.js |
| `systems/visual_shell/web/ParticleManager.js` | Lifecycle and focus management |
| `systems/visual_shell/web/application.js` | Integration and keyboard shortcuts |

## API Reference

### TerminalWindowParticle

```javascript
class TerminalWindowParticle extends PIXI.Container {
    static PARTICLE_TYPE = 'terminal';
    static MIN_SCALE = 0.25;
    static MAX_SCALE = 3.0;

    constructor(options) {
        // Options: particleId, x, y, scale, zIndex,
        //          width, height, title, wsUrl, nebSocket
    }

    // Getters
    get particlePosition()  // { x, y }
    get particleScale()     // 0.25 - 3.0
    get particleZIndex()    // depth order
    get focused()           // boolean

    // Methods
    setPosition(x, y)       // Move particle
    setScale(scale)         // Resize (clamped)
    focus()                 // Gain focus
    blur()                  // Lose focus
    bringToFront()          // Highest zIndex
    serialize()             // Export state
    update()                // Render loop
    destroy()               // Cleanup
}
```

### ParticleManager

```javascript
class ParticleManager {
    static SPATIAL_CELL_SIZE = 100;

    constructor(worldContainer, options) {
        // Options: nebSocket, onParticleCreated,
        //          onParticleDestroyed, onParticleFocused
    }

    // Creation
    createTerminalParticle(options)  // Returns TerminalWindowParticle

    // Destruction
    destroyParticle(particleId)      // Returns boolean
    destroyFocused()                 // Returns boolean
    clearAll()                       // Remove all

    // Retrieval
    getParticle(particleId)          // Returns particle or undefined
    getAllParticles()                // Returns array
    getParticlesByType(type)         // Returns array
    getParticleCount()               // Returns number
    getParticleAtPosition(x, y, radius)  // Returns nearest particle

    // Focus
    focusParticle(particleId)        // Returns boolean
    cycleFocus()                     // Returns next particle

    // NEB
    setNebSocket(socket)             // Enable NEB events

    // Serialization
    serialize()                      // Export all particles
    deserialize(data)                // Restore particles

    // Update
    update()                         // Call from render loop
}
```

### TerminalWindow

```javascript
class TerminalWindow extends PIXI.Container {
    constructor(options) {
        // Options: width, height, title, wsUrl, x, y
    }

    // Properties
    terminalId         // Unique ID
    windowWidth        // Width in pixels
    windowHeight       // Height in pixels
    title              // Title bar text
    connected          // WebSocket state

    // Methods
    focus()            // Gain focus, highlight border
    blur()             // Lose focus, normal border
    toggleMinimize()   // Collapse to title bar
    close()            // Destroy and cleanup
    update()           // Sync overlay position
    onCanvasResize()   // Handle canvas resize
}
```

## Design Decisions

### Spatial Indexing

Particles are indexed in a 100x100 pixel grid for fast spatial queries. This enables O(1) lookup of particles at specific world positions without iterating all particles.

### Focus Model

Only one particle can be focused at a time. Focusing a particle:
1. Blurs the previously focused particle
2. Changes border color to cyan (focused) / green (normal)
3. Brings particle to front (highest zIndex)
4. Publishes NEB focus event

### Scale Limits

Scale is clamped between 0.25x and 3.0x to prevent:
- Too small: Unreadable terminal content
- Too large: Performance issues with canvas rendering

### HTML Overlay

Terminal content uses xterm.js in an HTML overlay positioned over the PixiJS canvas. This provides:
- Proper terminal rendering with ANSI support
- Native text selection and copy/paste
- Responsive font sizing

---

*Part of Geometry OS Visual Shell System*
