# Universal Pixel Taxonomy (Geometry OS)

> One pixel. 32 bits. 4,294,967,296 states.
> The pixel is not output. The pixel is the computer.

---

## 1. The BIOS Pixel (SHIPPING)

The first pixel of any Geometry OS PNG. Bit 31 set = hardware strap.

Source: `src/pixel.rs` -> `BootPixel::parse()`

```
Bit Layout:
  [31]      BIOS flag (must be 1)
  [28:30]   BootMode
            0 = AsmSource       (text to canvas)
            1 = RawBytecode     (load at 0x1000)
            2 = Pixelpack       (dictionary decompress)
            3 = NeuralSubstrate (reserved)
            4 = ChainBoot       (multi-program cascade)
            5 = Directory       (filesystem image)
  [24:27]   Resolution
            0 = 256x256
            1 = 512x512
            2 = 128x32 text grid
            3 = Headless
  [16:23]   Peripheral flags
            bit0 = Audio
            bit1 = Network
            bit2 = Mouse
            bit3 = System Clock
  [00:15]   FPS (0-65535)
            OR chain_pointer (ChainBoot/Directory modes)
```

Example: `0x9105003C` = BIOS | Bytecode(1) | 512x512(1) | audio+mouse(0x05) | 60fps(0x3C)

This pixel replaces a traditional BIOS chip. One u32 configures the entire VM.

---

## 2. The Opcode Substrate (SHIPPING)

404 unique opcode bytes across the VM. 267 mnemonic tokens in PP_DICTIONARY.

Each pixel after the BIOS pixel is a 32-bit seed. How it's interpreted depends on the BootMode:

### Encoding Strategies

| Strategy | Bits   | Expansion             | Density              |
|----------|--------|-----------------------|----------------------|
| 0x0      | 24-bit | Dictionary lookup     | 1 pixel = 1-3 tokens |
| 0x4      | 24-bit | Neural (reserved)     | TBD                  |
| 0x8-0xB  | 24-bit | Raw literal bytes     | 1 pixel = 3 bytes    |
| 0xC-0xF  | 24-bit | Raw literal + control | 1 pixel = 3-4 bytes  |

A single pixel encoding `AI_AGENT` via dictionary is equivalent to 10+ hex characters
of raw text, packed into one 32-bit word.

---

## 3. The 9 Pixel Archetypes

### A. The BIOS (SHIPPING)
- Pixel [0][0] with bit 31 set
- Configures VM hardware profile
- See Section 1

### B. The Portal (PARTIAL)
- A pixel whose value is a RAM address pointer
- Current: PEEK/POKE opcodes treat pixel values as addresses
- Gap: No explicit "Portal Pixel" type that auto-dereferences on render
- Proposed: BootPixel extension or render-mode flag

### C. The Mirror (NOT IMPLEMENTED)
- A pixel that reflects another pixel's color
- Mechanism: When alpha == 0xFE, the renderer reads from (R, G) instead of own color
- Use cases:
  - Zero-copy window cloning
  - Hardware magnification (NxN mirror block pointing to 1x1 source)
  - Live-updating UI overlays
  - Entangled pixel pairs (mirrors of mirrors)

```
If pixel.alpha == 0xFE:
    return framebuffer[pixel.red][pixel.green]
```

Implementation: ~20 lines in the render path, 0 new opcodes needed.

### D. The Physics Voxel (NOT IMPLEMENTED)
- A pixel encoding a particle: Mass(8) | dX(8) | dY(8) | Charge(8)
- 65,536 autonomous physics agents in a 256x256 grid
- Requires: physics tick in the VM scheduler

### E. The Neural Activation (RESERVED)
- BootMode::NeuralSubstrate = 3 (exists in enum)
- Proposed: pixel = Weight(8) | Bias(8) | Activation(8) | Gradient(8)
- PXLessons layer as weight matrix, PXCore as activation surface
- Requires: ManifestBlock handler for RegionType::NeuralWeights

### F. The Audio Oscillator (PARTIAL)
- audio.rs exists with FM synthesis engine
- Proposed: Freq(10) | Amp(10) | Phase(6) | Envelope(6)
- 60 fps = 60 Hz audio parameter update rate
- Gap: No per-pixel audio parameter mapping
- Requires: audio parameter bus from framebuffer to synthesizer

### G. The Quantum Superposition (NOT IMPLEMENTED)
- A pixel that toggles between two states each frame
- Mechanism: Based on FrameCount % 2, pixel alternates between (R1,G1,B1) and (R2,G2,B2)
- To PEEK: returns the current collapsed state
- To the eye: appears as a blend
- Requires: TEMPORAL render mode, ~15 lines in render tick

### H. The Subpixel Resolution Hack (NOT IMPLEMENTED)
- Treat R, G, B subpixels as 3 independent horizontal pixels
- Triples horizontal resolution: 256 -> 768 effective
- Enables glyph-atomic text rendering without anti-aliasing
- Requires: custom font rasterizer that maps to subpixel channels

### I. The Entropy Source (NOT IMPLEMENTED)
- LSB jitter of a high-refresh pixel as TRNG seed
- Thermal noise + timing jitter = entropy pool
- Proposed: RAND opcode that reads from designated entropy zone
- Requires: entropy harvesting from framebuffer refresh timing

---

## 4. CPPM Framework

Computational Power Per Minute -- a budget metric for pixel substrate compute.

### Base Formula
```
CPPM = Pixels x FPS x 60 + ColorSpace
```

### Extended Formula
```
CPPM_EXTENDED = (P x F x B) x A x R x L

P = pixel count (spatial)
F = frame rate Hz (temporal)
B = bits per pixel (data density)
A = active agent density 0-1 (how many pixels are "alive")
R = reflex logic depth (trigger layers per zone)
L = layer count (memory surfaces per pixel)
```

### Zone-Based Budget Allocation
```
Zone           FPS   Bits   CPPM Weight
Logic Core     120   24-bit High
Reflex Agent    90   32-bit Medium
Long-Term Mem   30   16-bit Low
Backup Ring      5    8-bit Minimal
```

### Intelligence Density
```
ID = (Reflexes x Mutation x MemoryRetention) / CPPM
```

Not raw throughput -- meaningful computation per unit of substrate pressure.

---

## 5. Color Space Remappings

The 32 bits can be reinterpreted for different substrates:

| Mapping       | Layout                          | Use Case                          |
|---------------|---------------------------------|-----------------------------------|
| RGBA          | R(8) G(8) B(8) A(8)           | Standard display                  |
| CMYK          | C(8) M(8) Y(8) K(8)           | Print substrate                   |
| HSV           | H(10) S(11) V(11)             | Procedural animation              |
| YUV           | Y(8) U(8) V(8) A(8)           | Video/compression pipeline        |
| Spectral      | IR(8) R(8) G(8) UV(8)         | Multi-spectral agent vision       |
| Opcode        | Op(12) Backup(8) Parity(4)    | Self-healing instruction pixel    |
| Physics       | Mass(8) dX(8) dY(8) Charge(8) | Autonomous particle               |
| Neural        | Weight(8) Bias(8) Act(8) Grad(8) | Perceptron node               |
| Audio         | Freq(10) Amp(10) Phase(6) Env(6) | Synthesizer voice             |

---

## 6. Implementation Priority

| Priority | Archetype       | Effort  | Impact | Dependency        |
|----------|-----------------|---------|--------|-------------------|
| 1        | Mirror          | Low     | High   | None              |
| 2        | Quantum/Temporal| Low     | Medium | None              |
| 3        | Entropy/TRNG    | Low     | Medium | None              |
| 4        | Portal          | Medium  | Medium | Render refactor   |
| 5        | Audio Oscillator| Medium  | Medium | Audio bus         |
| 6        | Neural          | High    | High   | BootMode impl     |
| 7        | Physics Voxel   | High    | Medium | Physics engine    |
| 8        | Subpixel        | High    | Low    | Font rewrite      |

---

## 7. The Single-Pixel Capability Summary

```
One pixel (32 bits) can simultaneously be:

POSITIONAL:
  - A spatial address (x, y) in the grid
  - A memory pointer to 4GB RAM space
  - A filesystem entry (GeoFile boot_pixel)

INFORMATIONAL:
  - 4 ASCII characters
  - 1x u32 / 2x u16 / 8x bool
  - 1x Unix timestamp (valid to 2106)
  - 1x RISC-V or GeOS opcode + operands
  - A dictionary-compressed instruction (via pixelpack)

TEMPORAL:
  - A frame-rate signal (how fast it changes = priority)
  - A decay curve (phosphor fade = memory aging)
  - An oscillator (flicker = reflex timing)
  - A delta encoder (change from last frame = data)

STRUCTURAL:
  - A BIOS configuration (bit 31)
  - A boot mode selector (bits 28-30)
  - A peripheral enable mask (bits 16-23)
  - A chain pointer (bits 0-15)

The pixel is not the output.
The pixel is the substrate.
```
