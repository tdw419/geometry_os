---
name: ASCII-Native Self-Hosting
description: ASCII-First visual interface for the self-hosting assembler
type: project
---

# ASCII-Native Self-Hosting

## Status: ✅ Complete

## Components

| Component | File | Purpose |
|-----------|------|---------|
| Self-Hosting Assembler | `glyph_stratum/programs/self_hosting_assembler.glyph` | VM-native compiler (398 lines) |
| ASCII Template | `geos-ascii/examples/self_hosting.ascii` | 80x24 visual layout |
| Mapping Config | `geos-ascii/examples/self_hosting.mapping.json` | Button/state definitions |
| Template Loader | `ascii_native/self_hosting_template.rs` | Rust template renderer |
| Cartridge Generator | `ascii_native/self_hosting_cartridge.rs` | PNG cartridge emitter |

## Why

ASCII-First sovereignty - users can edit source in a visual 80x24 grid, compile on GPU, and run without leaving the ASCII interface.

## How to Use

```bash
# Use via Rust API
use infinite_map_rs::ascii_native::self_hosting_cartridge::generate_self_hosting_cartridge;
generate_self_hosting_cartridge(source, "output.rts.png")?;
```

## Test Coverage

| Test | Status |
|------|--------|
| Template loads | ✅ |
| Template renders | ✅ |
| Cartridge generates | ✅ |

---

*Completed: 2026-03-18*
