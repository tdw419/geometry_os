# Tasks: Macromedia to PixiJS Evolution

- [x] **Infrastructure: The Host Substrate**
    - [x] Locate Macromedia Studio MX ZIP source.
    - [x] Create `macromedia_packer.py` inheriting from `InceptionPacker`.
    - [x] Prepare a Wine-enabled initrd for legacy binary execution.

- [x] **Artifact Generation: visual_macromedia.rts.png**
    - [x] Encode 215MB ZIP into Hilbert-mapped RGBA texture.
    - [x] Generate `.meta.json` with execution entry points for `Flash.exe`.
    - [x] Verify SHA256 integrity of the baked asset.

- [x] **The Bridge: Flash MX → PixiJS**
    - [x] Implement `pixijs_exporter.jsfl` (JavaScript Flash API).
    - [x] Define mapping logic: MovieClip → PIXI.Container, Graphic → PIXI.Sprite.
    - [x] Implement Tween-to-GSAP conversion logic within the bridge.

- [x] **Integration: Visual Shell Terminal**
    - [x] Update `InfiniteDesktopServer` to launch `macromedia.rts.png`.
    - [x] Add "Morph to PixiJS" context menu to the OS desktop.
