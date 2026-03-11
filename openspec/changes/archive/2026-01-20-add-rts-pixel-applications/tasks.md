# Tasks: Implement Pixel Applications

## Phase 1: The Container Format
- [ ] Define `RTS_PNG_v1` spec (Manifest schema, Chunk layout).
- [ ] Create `rts_packer.py`: Tool to inject Python/Binary into PNG.
- [ ] Create `rts_extractor.py`: Tool to read payload from PNG without corrupting image.

## Phase 2: The Runtime (Hypervisor)
- [ ] Update `PixelHypervisor` to handle "Shared Kernel" booting.
- [ ] Create `MicroVM` template (Alpine Linux optimized for <50ms boot).
- [ ] Implement `framebuffer_to_texture` pipe (Shared Memory).

## Phase 3: Desktop Integration
- [ ] Update `InfiniteDesktop` to detect `.rts.png` files.
- [ ] Implement "Possession" shader (transition from static PNG to live texture).
- [ ] Add "Freeze" command: Snapshot live app back to PNG IDAT chunk on close.
