# PixelPack

> Geometry OS has two pixel-encoding formats for PNG files.
> This doc covers **Pixelpack PNGs** (`.png`, not `.rts.png`).

For the raw spatial format, see [rts-png](#rts-png) below.

---

## Two PNG Formats

| Format | Extension | How pixels map to data | Use case |
|--------|-----------|----------------------|----------|
| **Pixelpack** | `.png` | Each RGBA pixel is a 32-bit *seed* that expands to variable-length bytes via 16 compression strategies | Compressed programs, source code, multi-region boot chains |
| **Raw Spatial** | `.rts.png` | Each RGBA pixel is a big-endian u32 instruction word, read directly into RAM | Raw bytecode, fastest boot path |

The bootloader detects format by extension: `.rts.png` → raw loader, everything else ending in `.png` → pixelpack decoder.

---

## Pixelpack: How It Works

A pixelpack PNG stores a sequence of 32-bit **seeds**. Each seed's top 4 bits select a **strategy** and the lower 28 bits are the **payload**:

```
 seed: [SSSS] [PPPPPPPPPPPPPPPPPPPPPPPPPPPP]
        ^^^^   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        strat         params (28 bits)
```

The decoder iterates seeds in raster order, expanding each into bytes via its strategy. Expanded bytes accumulate -- later seeds can reference earlier output (LZ77 back-references). The final byte stream is either:
- **Source text** (`.asm` assembly) → assembled to bytecode via `boot-src-png`
- **Raw bytecode** → loaded directly into VM RAM via `boot-png`

### PNG Metadata

Pixelpack PNGs use standard PNG `tEXt` chunks for metadata:

| Key | Value | Purpose |
|-----|-------|---------|
| `seedcnt` | integer string | Number of valid seeds (pixels to decode) |
| `bytecnt` | integer string | Target byte count for truncation |
| `geo_boot` | `"bytecode"` or `"source"` | Hint for boot mode |
| `pixelpack` | `"v2"` | Format version tag |
| `layout` | `"hilbert"` or `"linear"` | Pixel ordering in seed save files |

---

## The 16 Expansion Strategies

Implemented in `src/pixel.rs` (`pixelpack_expand`):

| ID | Name | Payload layout | Output |
|----|------|----------------|--------|
| `0x0` | Dict Neural (1) | 24-bit token index into `PP_DICTIONARY` | 1 dictionary token |
| `0x1` | Dict 2 | 4-bit × 2 token indices | 2 concatenated tokens |
| `0x2` | Dict 3 | 4-bit × 3 token indices | 3 concatenated tokens |
| `0x3` | Dict 4 | 4-bit × 4 token indices | 4 concatenated tokens |
| `0x4` | Dict Neural (3) | 9-bit × 3 token indices | 3 dictionary tokens |
| `0x5` | Dict 6 | 4-bit × 6 token indices (24 bits used) | 6 concatenated tokens |
| `0x6` | Dict 7 | 4-bit × 7 token indices (28 bits used) | 7 concatenated tokens |
| `0x7` | Nibble | 4-bit × 7 nibble lookups | 7 ASCII hex chars |
| `0x8` | LZ77 | 14-bit offset + 14-bit length | Back-reference into already-decoded bytes |
| `0x9` | RLE | 8-bit byte + 8-bit count | Repeated byte (1-256x) |
| `0xA` | Raw3 | 3 literal bytes (24 bits) | 3 raw bytes |
| `0xB` | XOR Chain | 8-bit start + 8-bit key + 4-bit count | XOR-iterated sequence |
| `0xC` | Linear | 8-bit start + 8-bit step + 4-bit count | Arithmetic sequence |
| `0xD` | Delta | 8-bit base + 3× 8-bit deltas | Base + cumulative increments |
| `0xE` | Bytepack | 3 bytes at shifted bit positions | 3 raw bytes (different packing) |
| `0xF` | Literal | All 28 bits as raw data | 4 raw bytes |

### The Dictionary (`PP_DICTIONARY`)

256 entries of common GeOS assembly tokens: `LDI`, `STORE`, `ADD`, `LOAD`, `SUB`, registers (`r0`-`r31`), punctuation, hex prefixes, etc. Dictionary strategies (0x0-0x6) achieve high compression on GeOS assembly source by tokenizing common patterns into 4-bit or 9-bit indices.

For example, a single seed using strategy 0x3 (Dict 4) can encode 4 dictionary tokens -- potentially 30+ bytes of assembly text in one pixel.

---

## BIOS Pixel (Boot Configuration)

The **first pixel** of a pixelpack PNG can be a **BIOS pixel** that configures the VM before code runs. Detected by bit 31 being set (`seed >= 0x80000000`).

```
 BIOS: [1] [MMM] [RRRR] [PPPPPPPP] [LLLLLLLLLLLLLLLL]
        ^   ^^^   ^^^^   ^^^^^^^^   ^^^^^^^^^^^^^^^^
      en   mode   res   periph    fps/chain_ptr
```

| Bits | Field | Values |
|------|-------|--------|
| 31 | Enable | 1 = BIOS pixel present |
| 30:28 | Mode | 0=AsmSource, 1=RawBytecode, 2=PixelpackCompressed, 3=NeuralSubstrate, 4=ChainBoot, 5=Directory |
| 27:24 | Resolution | 0=256×256, 1=512×512, 2=128×32 text, 3=Headless |
| 23:16 | Peripherals | bit0=audio, bit1=network, bit2=mouse, bit3=sysclock |
| 15:0 | FPS / ChainPtr | FPS for normal modes, seed index for ChainBoot/Directory |

Example: `0x9105003C` = Bytecode mode, 512×512, audio+mouse, 60fps.

### Boot Chain Protocol

When mode=ChainBoot (4), the BIOS pixel points to a **manifest** elsewhere in the seed array. The manifest describes multiple **regions** scattered across the PNG -- each region can be source code, bytecode, spritesheets, filesystems, even Linux kernels:

```
 Seed 0:        BIOS pixel (mode=ChainBoot, chain_pointer → manifest)
 Seed N:        Manifest Header (magic 0x43480000 | region_count)
 Seed N+1..K:   Region Descriptors (1 seed each: [seed_index:16 | seed_count:12 | type:4])
 Seed R..:      Actual payloads (pixelpack seeds)
```

Region types: AsmSource(0), RawBytecode(1), PixelpackCompressed(2), SpriteSheet(3), FileSystem(4), ConfigData(5), Directory(6), LinuxKernel(7), LinuxInitrd(8).

---

## Two Authoring Modes (Python Scripts)

Pixelpack also has two higher-level authoring modes that generate `.asm` from human-friendly inputs:

### Hex Key Mode (`scripts/pixelpack_decoder.py`)

A character-stream grammar for quick visual sketching:

| Input | Type | Values |
|-------|------|--------|
| Even digits (`0,2,4,6,8`) | Coordinates | 0, 64, 128, 192, 255 |
| Odd digits (`1,3,5,7,9`) | Colors | black, red, green, blue, white |
| Letters (`A-F`) | Opcodes | PSET, RECTF, LINE, FILL, FRAME, HALT |

Example: `D3E` = Fill red + Present. `B30044E` = Red rect at (0,0) + Present.

### Seed Expansion Mode (`scripts/pixelpack_seed.py`)

A 32-bit seed maps to a procedural visual pattern:

| Bits | Field | Description |
|------|-------|-------------|
| 31:28 | Pattern | 0-15 (solid, stripes, checker, border, cross, diagonal, etc.) |
| 27:24 | Color A | Index into 16-color palette |
| 23:20 | Color B | Secondary color |
| 19:16 | Density | Spacing/thickness (1-16) |
| 15:0 | Offset | X/Y origin for the pattern |

Note: This is the Python *authoring* tool for generating art. It is separate from the Rust compression codec that boots programs.

---

## Encoding (Rust API)

`encode_pixelpack_png(bytes)` wraps raw bytes into a pixelpack PNG using strategy 0xA (raw3) -- 3 bytes per pixel, auto-sized to a square-ish image, with `seedcnt` and `bytecnt` metadata.

`save_seeds_to_png(path, seeds, layout)` writes raw seeds to a PNG in either `hilbert` or `linear` layout.

---

## Decoding Pipeline

```
.png file → decode_pixelpack_png_skip(data, skip) → byte stream
  1. Read PNG, extract seedcnt/bytecnt metadata
  2. For each seed (raster order, skipping BIOS pixel if skip=1):
     seed → pixelpack_expand(seed, &history) → bytes appended
  3. Truncate to bytecnt if specified
  4. Return byte stream
```

CLI commands:
- `boot-png <file>` → decode → load bytecode at 0x1000 → run
- `boot-src-png <file>` → decode → write to canvas as assembly text → assemble → run

---

## rts-png

The `.rts.png` format stores raw 32-bit instruction words as RGBA pixels in big-endian order. No compression, no strategies. Pixels are read in raster order, skipping transparent pixels (0x00000000). Loaded by `boot_from_rts_png()`.

---

*Source: `src/pixel.rs` (Phase 92), `scripts/pixelpack_decoder.py`, `scripts/pixelpack_seed.py`*
