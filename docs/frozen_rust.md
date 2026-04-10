# GEOMETRY OS: PROJECT-SPECIFIC MANDATES

## 1. RUST SOURCE HARD FREEZE (PHASE 20: VISUAL BOOTSTRAPPING)
The Rust implementation of the VM and Painter (`src/*.rs`) is now considered a **Stable Substrate**. 

- **PROHIBITED:** Implementing new application logic, tools, or algorithms in Rust.
- **PROHIBITED:** Adding new opcodes without an explicit Architectural Change Proposal.
- **PERMITTED:** Bug fixes to the core VM execution logic.
- **PERMITTED:** Improvements to the UI/Painter for better observability (not functionality).

---

## 2. MANDATORY PIXEL PROGRAMMING
All new features, applications, and experiments **MUST** be implemented using the **GEOS Pixel Programming** method.

- **Storage:** Programs are stored in the 32x32 RAM grid.
- **Language:** Geometry OS Glyph Assembly (.glyph) or direct pixel-stamping.
- **Verification:** All "logic" must be verifiable by running the `geometry-os` binary and pressing **F5**.
- **Ref:** See `docs/GEOS_PIXEL_PROGRAMMING_SPEC.md` for instruction encoding.

---

## 3. ARCHITECTURAL DIRECTION
The goal of this phase is to eliminate the AI's reliance on "legacy" text-based languages (Rust, Python). We are migrating to a **Visual-First Computation** model where the "code" is the morphological texture of the 32x32 grid.

> "If it isn't pixels, it isn't Geometry OS."
