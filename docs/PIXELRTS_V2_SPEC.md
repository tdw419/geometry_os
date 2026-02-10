# PixelRTS v2 Format Specification
**Version:** 2.0  
**Status:** Production  
**Extension:** `.rts.png`  
**Philosophy:** "The Screen is the Hard Drive"
**Comparison:** [PixelRTS vs Traditional Boot](whitepapers/PIXELRTS_VS_TRADITIONAL_BOOT.md)

## 1. Overview

PixelRTS v2 is a **Visual Bootable Container** format that encodes arbitrary binary data (operating systems, kernels, WASM modules) into standard PNG images. Unlike steganography, the visual aesthetic *is* the data itself, mapped using space-filling curves to preserve locality.

### Key Features
- **Dense Packing:** 4 bytes per pixel (RGBA), achieving 100% data density.
- **Hilbert Mapping:** Uses Hilbert Space-Filling Curves to map linear binary streams to 2D textures, ensuring that code/data locality is preserved visually.
- **Universal:** viewable in any image software; bootable via the PixelRTS runtime.
- **AI-Native:** Natively intelligible to Vision-Language Models (VLMs) for visual diagnostics and generative coding.
- **Verifiable:** Embedded SHA256 hashes ensure bit-perfect extraction.

---

## 2. Container Structure

### 2.1 Base Format
- **Format:** Standard PNG (Portable Network Graphics)
- **Channels:** RGBA (Red, Green, Blue, Alpha)
- **Bit Depth:** 8 bits per channel (32 bits per pixel)
- **Dimensions:** Power-of-2 square grid (e.g., 1024×1024, 4096×4096) to optimize GPU texture uploading.

### 2.2 Metadata
Metadata is stored in multiple locations for redundancy:

1. **Core Metadata:** Inside a PNG `tEXt` chunk keyed as `PixelRTS` and sidecar `{filename}.rts.meta.json`
2. **Blueprint Metadata (Optional):** Inside a PNG `tEXt` chunk keyed as `PixelRTS-Blueprint` and sidecar `{filename}.rts.png.blueprint.json`

**Schema:**
```json
{
  "format": "PixelRTS-2.0",
  "version": 2,
  "grid_size": 4096,
  "encoding": {
    "type": "RGBA-dense",
    "bytes_per_pixel": 4,
    "mapping": "Hilbert space-filling curve (precomputed LUT)"
  },
  "offsets": {
    "kernel": {
      "start": 0,
      "end": 10485760,
      "size": 10485760,
      "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    },
    "initrd": { ... }
  },
  "hashes": { ... }
}
```

---

## 3. Encoding Modes

### 3.1 Standard Mode (Production)
Used for operating system images, kernels, and generic data.

- **Mapping Strategy:**
  - The linear binary stream is chunked into 4-byte groups.
  - Each group fills one pixel: `R=byte[0]`, `G=byte[1]`, `B=byte[2]`, `A=byte[3]`.
  - Pixel positions `(x, y)` are calculated using a precomputed Hilbert Look-Up Table (LUT) based on the pixel index.
- **Visuals:** The resulting image looks like colored noise, but with distinct structural patterns matching the entropy of the underlying binary data.

### 3.2 Code Mode (WASM / OpenSpec 004)
Used for WASM modules and executable code to provide semantic visualization ("seeing the logic").

- **Preprocessing:**
  - **LEB128 Padding:** WASM integers (ULEB128) are padded to the maximal 5-byte alignment to align instruction boundaries.
- **Semantic Coloring:**
  - **Red Channel:** Opcode Entropy (Hot = Control Flow/Complex Ops, Cold = Simple Ops/Nops).
  - **Green Channel:** Operand 1 Value.
  - **Blue Channel:** Operand 2 Value / Immediate.
  - **Alpha Channel:** Execution Mask (255 = Executable Code, 0 = Data/Padding).

---

## 4. Boot Process

The `.rts.png` file is "booted" via the `PixelRTSv2Extractor` or the Geometry OS runtime.

1. **Load:** The PNG is loaded into memory (RAM or VRAM).
2. **Extract:**
   - The Hilbert LUT is generated for the image's grid order.
   - Pixels are read in Hilbert order.
   - Bytes are unpacked from RGBA channels to reconstruct the linear stream.
3. **Verify:**
   - Extracted binary segments (Kernel, Initrd) are hashed (SHA256).
   - Hashes are compared against the embedded metadata.
4. **Execute:**
   - **Native:** Parsed and executed directly (if WASM/eBPF).
   - **Hypervisor:** Written to temporary buffers and launched via QEMU/KVM (if Linux Kernel).

---

## 5. Tooling

### Converter (`pixelrts_v2_converter.py`)
Converts binary files to PixelRTS v2 format.
```bash
# Standard OS Image
python3 pixelrts_v2_converter.py alpine.rts alpine.rts.png

# WASM Code Mode
python3 pixelrts_v2_converter.py --mode code module.wasm module.rts.png
```

### Extractor (`pixelrts_v2_extractor.py`)
Extracts and verifies binaries from the visual container.
```bash
python3 pixelrts_v2_extractor.py alpine.rts.png
```

### Boot Script
The converter automatically generates a QEMU launch script (`.boot.sh`) that references the extracted artifacts, enabling one-click booting of the visual container.

---

## 6. Visual Diagnostics & VLM Integration

The PixelRTS format is designed to be machine-readable by Vision-Language Models (VLMs). The visual structure of the container directly correlates to the entropy and type of data it contains.

### 6.1 Entropy Encoding
Each container includes embedded entropy metadata calculated during conversion.
- **High Entropy (Red/White):** `> 200/255` - Compressed data, encrypted payloads, or dense machine code.
- **Low Entropy (Dark/Blue):** `< 50/255` - Zero padding, sparse data structures, or uninitialized memory.
- **Medium Entropy (Green/Texture):** `50-150` - Structured text, headers, or data tables.

### 6.2 Diagnostic Workflow
The `vlm_visual_diagnostics.py` tool simulates a VLM's visual cortex analysis:
1. **Scans** the visual field (RGBA channels).
2. **Correlates** pixel intensity with embedded block entropy.
3. **Detects** anomalies (e.g., "fractured" entropy in code sections).
4. **Reports** system health in natural language.

```bash
python3 systems/intelligence/vlm_visual_diagnostics.py geometry_os.rts.png
# Output: "✅ Status: HEALTHY MIXED STRUCTURE"
```

---

## 7. Generative PixelRTS (Roadmap)

The logical evolution of the diagnostic capability is **Generative OS Painting**. Instead of just reading the entropy, an AI model will *write* the entropy map to generate functional operating systems.

### 7.1 Concept: "Painting" an OS
1.  **Prompt:** User requests "Minimal Linux kernel with networking".
2.  **VLM Latent Space:** Model generates a 2D entropy map representing the code structure.
3.  **Hilbert Projection:** The 2D map is unfolded into a linear binary stream via the Hilbert Space-Filling Curve.
4.  **Boot:** The resulting binary is effectively a compiled kernel, ready to boot.

### 7.2 Proposed Pipeline
```python
# Hypothethical Flow
mask = vlm.generate_entropy_mask(prompt="linux_kernel_network")
binary_stream = hilbert_unfold(mask)
pixelrts.save(binary_stream, "generated_kernel.rts.png")
```

This closes the loop: **The OS is an Image.**

---

## 8. PixelRTS Platform (PixelISA Extension)

The format has been extended to support direct execution on GPU without extraction, turning `.rts.png` into a **Visual Machine Code**.

### 8.1 PixelISA v1.1
Mapps RGBA channels to processor semantics where **Color Intensity = Computational Complexity**.
- **Red (Hot):** Control Flow (Points of high execution temperature)
- **Orange (Warm):** Arithmetic
- **Blue (Cool):** Data/Memory

See [PixelISA Specification](PIXELISA.md) for opcode details.

### 8.2 Infinite Canvas Runtime (ICR)
The geometry_os runtime can execute these images directly from VRAM using Compute Shaders (`pixel_vm.wgsl`).
- **Visual Debugging:** Execution paths generate real-time heatmaps.
- **Visual Linking:** Programs import libraries by sampling other textures.

See [PixelRTS Platform Guide](../systems/pixel_compiler/PLATFORM_GUIDE.md) for usage.

---

## 9. Blueprint Layer (Optional)

The Blueprint Layer is an optional structural metadata system that describes the logical components, memory layout, dependencies, and behavioral semantics of the encoded system. It enables visual understanding, semantic querying, and AI-driven analysis of PixelRTS containers.

### 9.1 Blueprint Storage

Blueprint metadata is stored in two locations for redundancy:

1. **Embedded:** Inside a PNG `tEXt` chunk keyed as `PixelRTS-Blueprint`
2. **Sidecar:** A matching `{filename}.rts.png.blueprint.json` file

### 9.2 Blueprint Schema

```json
{
  "blueprint_version": "1.0",
  "system_name": "Alpine Linux Minimal",
  "system_type": "Linux Kernel + Initrd",
  "architecture": "x86_64",
  "components": [
    {
      "id": "kernel",
      "type": "executable",
      "description": "Linux Kernel 6.1",
      "hilbert_range": {
        "start_index": 0,
        "end_index": 2621440,
        "pixel_start": [0, 0],
        "pixel_end": [1024, 2560]
      },
      "entropy_profile": "high",
      "visual_hint": "red_dominant",
      "dependencies": ["initrd"],
      "semantic_tags": ["boot", "syscall"],
      "security": {
        "executable": true,
        "writable": false
      }
    }
  ],
  "memory_map": [
    {"region": ".text", "permissions": "rx", "gpu_alignment": 256},
    {"region": ".data", "permissions": "rw", "gpu_alignment": 256}
  ],
  "entry_point": "0x100000",
  "visual_overlay": {
    "grid_overlay": true,
    "color_key": "semantic",
    "legend": "red=code, green=data, blue=uninitialized",
    "highlight_boundaries": true,
    "boundary_color": [255, 255, 0, 128]
  }
}
```

### 9.3 Component Types

Supported component types:
- `executable`: Executable code (kernels, programs)
- `archive`: Archive files (initrd, cpio)
- `data`: Generic data sections
- `config`: Configuration data
- `library`: Shared libraries

### 9.4 Entropy Profiles

Entropy profiles indicate data characteristics:
- `high`: Compressed, encrypted, or dense code (> 7.5 bits/byte)
- `medium`: Structured data, text (2.0 - 7.5 bits/byte)
- `low`: Zero padding, sparse data (< 2.0 bits/byte)

### 9.5 Visual Hints

Visual hints map components to colors for visualization:

| Hint | Color | Usage |
|------|-------|-------|
| `red_dominant` | Red | High entropy code (compressed, encrypted) |
| `textured_green` | Green | Medium entropy (structured data, text) |
| `blue_dominant` | Blue | Low entropy (sparse, zero-filled) |
| `dark_blue` | Dark Blue | Uninitialized memory |
| `green_dominant` | Green | Writable data sections |
| `gray` | Gray | Unknown/uncategorized |

### 9.6 Blueprint Generation

Blueprints can be automatically generated during encoding:

```bash
# Generate with automatic blueprint analysis
python3 -m systems.pixel_compiler.pixelrts_cli blueprint generate \
    kernel.bin \
    --output kernel.rts.png \
    --system-name "Linux Kernel 6.1" \
    --system-type "executable"
```

Programmatic generation:

```python
from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

analyzer = BlueprintAnalyzer()
blueprint = analyzer.analyze(
    data,
    system_name="Linux Kernel",
    architecture="x86_64"
)
```

### 9.7 Blueprint Visualization

View blueprint overlays:

```bash
# Generate PNG overlay
python3 -m systems.pixel_compiler.pixelrts_cli blueprint view \
    kernel.rts.png \
    --output kernel_overlay.png

# Generate interactive HTML
python3 -m systems.pixel_compiler.pixelrts_cli blueprint view \
    kernel.rts.png \
    --html \
    --output kernel_blueprint.html

# Analyze blueprint
python3 -m systems.pixel_compiler.pixelrts_cli blueprint analyze \
    kernel.rts.png
```

### 9.8 AI Integration

Blueprints enhance VLM (Vision-Language Model) analysis by providing structured context:

```python
from systems.pixel_compiler.pixelrts_vision_analyzer import PixelRTSVisionAnalyzer

analyzer = PixelRTSVisionAnalyzer('kernel.rts.png')
blueprint = analyzer.load_blueprint()

# Build context-aware prompt
if blueprint:
    context = f"""
System: {blueprint.system_name}
Components: {len(blueprint.components)}
Architecture: {blueprint.architecture}

Component structure:
"""
    for comp in blueprint.components:
        context += f"- {comp.id}: {comp.description}\n"

    # Use context for VLM analysis
    response = vlm.analyze(image, context)
```

See [Blueprint Quickstart Guide](pixelrts/PIXELRTS_BLUEPRINT_QUICKSTART.md) for complete usage examples.

