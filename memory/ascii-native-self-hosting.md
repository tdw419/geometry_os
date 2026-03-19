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

**Total: 22 tests** (17 lib + 5 integration)

### Unit Tests (self_hosting_template.rs)
| Test | Status |
|------|--------|
| template_loads_successfully | ✅ |
| template_has_source_placeholder | ✅ |
| template_has_status_placeholder | ✅ |
| template_has_buttons | ✅ |
| render_basic | ✅ |

### Unit Tests (self_hosting_cartridge.rs)
| Test | Status |
|------|--------|
| generate_produces_valid_png | ✅ |
| generate_with_empty_source | ✅ |
| generate_with_multi_line_source | ✅ |

### Integration Tests (ascii_native_integration_test.rs)
| Test | Status |
|------|--------|
| test_template_loads_successfully | ✅ |
| test_template_renders_with_source | ✅ |
| test_cartridge_generation_produces_valid_png | ✅ |
| test_cartridge_loads_via_ascii_cartridge | ✅ |
| test_cartridge_with_labels | ✅ |

## CLI Usage

```bash
# Compile .glyph to self-hosting cartridge
geos-compile input.glyph --self-hosting -o output.rts.png

# With verbose output
geos-compile input.glyph --self-hosting -v
```

---

*Completed: 2026-03-18*
