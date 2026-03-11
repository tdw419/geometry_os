# Implement Optical Python Scripting

## Rationale
To enable rapid prototyping and AI-driven logic within Geometry OS, we are introducing "Optical Python Scripting". This allows Python scripts to be treated as morphological assets (Visual Bricks) that can be loaded, executed, and hot-reloaded by the engine, leveraging the existing embedded generic Python runtime.

## Benefits
- **Zero-Compilation**: Python scripts run immediately upon modification.
- **AI Integration**: Scripts can easily interact with the Neural Evolution Daemon.
- **Morphological Unity**: Code is reduced to texture data, consistent with the OS philosophy.

## Risks
- **Performance**: Python is slower than Rust/WASM, suitable for high-level logic only.
- **Safety**: `exec()` is powerful; sandbox boundaries must be respected (though we are running in an experimental OS context).

## Impact
- **Foundry Daemon**: Needs to watch `src/scripts/*.py`.
- **Tensor Fold**: Already supports text, verification needed.
- **Infinite Map**: Needs a new `OpticalScriptLoader` component.
