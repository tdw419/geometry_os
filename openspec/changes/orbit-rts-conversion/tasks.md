# Orbit Rts Conversion - Tasks

## 1. Create Hilbert Curve Utilities

**Rationale:** The existing Hilbert implementation is in Rust. We need a Python port for the converter script.

- [ ] Create ``systems/pixel_compiler/hilbert.py``

## 2. Create Orbit Binary Scanner

**Rationale:** Need to discover and categorize all Orbit components (binaries, libraries, configs) before encoding.

- [ ] Create ``systems/pixel_compiler/orbit_scanner.py``

## 3. Create RTS Encoder for Orbit Sections

**Rationale:** Need to encode discovered sections into RGBA grid using Hilbert folding.

- [ ] Create ``systems/pixel_compiler/orbit_rts_encoder.py``

## 4. Create Main Converter Script

**Rationale:** Provide CLI interface for the conversion pipeline.

- [ ] Create ``convert_orbitiny_to_rts.py``

## 5. Create Runtime Loader

**Rationale:** Need to extract and execute Orbit binaries from RTS file.

- [ ] Create ``systems/orbitiny_integration/rts_loader.py``

## 6. Create Launch Script Integration

**Rationale:** Integrate RTS conversion into the existing launch workflow.

- [ ] Create ``systems/orbitiny_integration/launch_from_rts.sh``

## 7. Create Documentation

**Rationale:** Document the architecture and usage for future developers.

- [ ] Modify ``systems/orbitiny_integration/README_RTS_ARCHITECTURE.md` (enhance existing)`
