# AGENTS.md
This file provides guidance to agents when working with code in this repository.

## Foundational Documents

Before working on Geometry OS, read these in order:

1. **[NORTH_STAR.md](NORTH_STAR.md)** - Vision and direction
2. **[ARCHITECTURE.md](ARCHITECTURE.md)** - System structure
3. **[OPERATIONS.md](OPERATIONS.md)** - Working protocol

---

## Project: Infinite Map Compositor (Rust Wayland Compositor)

**Purpose**: High-performance Wayland compositor with neural state visualization and infinite map rendering.

**Stack**: Rust + Smithay + WGPU

## Critical Build Requirements

**Smithay Dependencies**: Smithay requires system libraries for DRM/KMS backend:

```bash
# Ubuntu/Debian
sudo apt-get install libseat-dev libudev-dev libinput-dev libdrm-dev

# Fedora/RHEL
sudo dnf install libseat-devel libudev-devel libinput-devel libdrm-devel

# Arch Linux
sudo pacman -S libseat libudev libinput libdrm
```

**Rust Version**: Requires Rust 1.70+ for Smithay compatibility.

## Non-Obvious Code Patterns

### Smithay API Gotchas
- `DrmDevice` is a trait, not a concrete type - use `SmithayDrmDevice` for concrete implementation
- GBM allocator type complexity: `GbmAllocator<GbmDevice<DrmDeviceFd>>` - type parameter matters
- Always use `smithay::reexports::*` for direct imports of re-exported crates
- Import required traits: `use smithay::reexports::drm::control::Device;` for DRM operations

### Backend Selection
Backend is selected at runtime via `--backend <name>` argument (winit|drm), but main.rs currently hardcodes to Winit:
```rust
// For now, always Winit (DRM backend is incomplete)
let backend = WinitBackend::new();
```
DRM backend requires Linux + no compositor running (bare metal or QEMU).

### Evolution Protocol
- Socket path: `/tmp/evolution_daemon.sock` (hardcoded in protocol)
- Automatic reconnection on failure
- Bidirectional: daemon → compositor (neural state), compositor → daemon (visual feedback)

## Bootable OS

The compositor runs as PID 1 in an initramfs:

```bash
# Build initramfs (creates initramfs-geometry-os.cpio.gz in project root)
bash systems/infinite_map_rs/scripts/create_initramfs.sh

# Boot with QEMU (requires /boot/vmlinuz)
bash systems/infinite_map_rs/scripts/qemu_test.sh
```

**Critical**: Init script expects `init=/infinite_map_rs` - compositor binary must be at `/infinite_map_rs` in initramfs.

## Performance Targets

- **Frame Rate**: 60 FPS (16ms per frame)
- **Latency**: <10ms overhead for evolution protocol
- **Memory**: ~50MB for compositor + WGPU

---

## OpenSpec Workflow

**Before starting any feature implementation, check active OpenSpec changes:**

```bash
# List active changes
openspec list

# Or check the directory
ls openspec/changes/
```

### Creating a New Feature

1. **Draft a proposal:**
   ```
   openspec/changes/<feature-name>/
   ├── proposal.md      # Goal and architecture
   ├── tasks.md         # Implementation checklist
   └── specs/<domain>/spec.md  # Delta with ADDED/MODIFIED/REMOVED
   ```

2. **Use the converter for existing plans:**
   ```bash
   python3 scripts/plan_to_openspec.py docs/plans/<plan-name>.md
   ```

3. **Implement using Claude Code:**
   ```
   /openspec:apply <feature-name>
   ```

4. **Archive when complete:**
   ```
   /openspec:archive <feature-name>
   ```

### Spec Format

All specs use the OpenSpec delta format:

```markdown
## ADDED Requirements
### Requirement: <name>
The system SHALL <behavior>.

#### Scenario: <name>
- **WHEN** <condition>
- **THEN** <expected result>
```

### Current Specs

| Spec | Location |
|------|----------|
| cognitive-core | `openspec/specs/cognitive-core/spec.md` |
| evolution-daemon | `openspec/specs/evolution-daemon/spec.md` |
| foundry-core | `openspec/specs/foundry-core/spec.md` |
| multi-modal | `openspec/specs/multi-modal/spec.md` |
| rts-driver | `openspec/specs/rts-driver/spec.md` |
| rts-ecosystem | `openspec/specs/rts-ecosystem/spec.md` |
| terminal | `openspec/specs/terminal/spec.md` |
| visual-shell | `openspec/specs/visual-shell/spec.md` |
