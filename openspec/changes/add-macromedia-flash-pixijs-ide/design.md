# Design: Morphological Bridge Architecture

## 1. Visual Mapping (The Hilbert Mirror)
The Macromedia ZIP is treated as **Static Substrate**. When the OS boots `macromedia.rts.png`, it projects this texture back into a virtual filesystem.

- **Storage**: RGBA dense packing in an 8192² grid.
- **Access**: The `Pixel CPU` (WGSL) handles the on-the-fly decompression of the Hilbert path into memory addresses for the VM.

## 2. The JSFL Bridge (Flash as PixiJS Editor)
To make Flash a "PixiJS IDE," we don't modify the `.exe`. Instead, we utilize the native **JSFL** scripting engine.

### Symbolic Convergence
| Flash Concept | PixiJS Implementation | Bridge Logic |
|---------------|-----------------------|--------------|
| Stage         | `PIXI.Application.stage` | `fl.getDocumentDOM()` |
| Layer         | `PIXI.Container`      | `dom.getTimeline().layers` |
| MovieClip     | `PIXI.Container` + Ticker | Library Item recursive export |
| Symbol Tween  | `gsap.to()` / Ticker  | Keyframe interpolation extraction |
| ActionScript  | Native JS Injection   | Comments parsing `// @pixi: code` |

## 3. The "Export" Flow
1. User designs in the legacy Flash MX interface inside the RTS container.
2. User runs `Command > Export to PixiJS`.
3. The JSFL script traverses the DOM, serializes to JSON, and pipes the data out of the VM to the Geometry OS `Substrate Bridge`.
4. Geometry OS hot-reloads the visual shell with the new PixiJS-rendered component.
