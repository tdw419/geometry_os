# Universal Pixel Taxonomy

> The foundational law of Geometry OS: **one 32-bit pixel is a complete operating system coordinate**.
>
> 4,294,967,296 states. Two strata. Infinite possibilities.

---

## 1. Philosophy

In Geometry OS, a pixel is not merely light. It is a **Universal OS Coordinate** — a 32-bit word that can be:

- A color on the screen
- A BIOS configuration for the entire VM
- A pointer into 4GB of addressable memory
- A generative seed that grows fractals
- A temporal instruction that evolves frame by frame

The taxonomy divides the 32-bit space into two strata based on the highest bit.

---

## 2. The Two Strata

### 2.1 Bit 31 — The Modality Switch

| Value | Mode | Meaning |
|-------|------|---------|
| `0` | **Object** | Passive container of light, texture, or encoded data |
| `1` | **Process** | Active system instruction, BIOS command, or pointer |

This single bit is the **Origin**. It determines whether the pixel *is* something (a color) or *does* something (a command).

---

### 2.2 Object Mode (Bit 31 = 0)

When the high bit is `0`, the pixel lives in the **Passive Stratum**. It is a container for visual or encoded information.

#### Bit Layout — Object Mode

```
 3                   2                   1                   0
 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
├─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┤
│0│  STRAT  │        COLOR / ENCODED PAYLOAD (28 bits)              │
└─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┘
```

| Field | Bits | Purpose |
|-------|------|---------|
| **Modality** | `[31]` | `0` = Object |
| **Strategy** | `[28:30]` | Transport encoding type (see PixelPack compatibility below) |
| **Payload** | `[0:27]` | Color data, compression parameters, or seed payload |

#### What an Object pixel can be

1. **Literal Color** — 24-bit RGB value (16.7 million colors)
2. **Z-Layer** — 128 depth levels encoded in bits `[24:30]` for compositing
3. **Lifetime (Alpha)** — Fade curves without CPU intervention
4. **Mirror** — Reference to another pixel's value (`"Copy the color of pixel (x,y)"`). See §2.4 for the encoding.
5. **PixelPack Seed** — Compressed bytecode or source text (see §5)

---

#### The Mirror Pixel (Object Mode Sub-Type)

When an Object pixel's **alpha channel = `0xFE`**, it is not a literal color. It is a **Mirror Token** that tells the renderer to look up another pixel's color.

```
Bits 31:24  Alpha    = 0xFE  (Mirror sentinel)
Bits 23:16  dx       = signed 8-bit X offset from this pixel's position
Bits 15:8   dy       = signed 8-bit Y offset from this pixel's position
Bits 7:0    mode     = mirror mode (0 = simple copy, reserved for future modes)
```

**Example:** A mirror pixel at `(50, 50)` with `dx = -1`, `dy = 0` displays the color of `(49, 50)`. If `(49, 50)` is also a mirror, the renderer follows the chain (max depth 8) until it reaches a literal color.

Mirror resolution happens at **render time**, not at write time. The underlying `vm.screen` buffer stores the raw token; the compositor resolves it when blitting to the host window. This means a single `PSETI` can create a "live" reflection that updates automatically as the referenced pixel changes.

---

### 2.3 Process Mode (Bit 31 = 1)

When the high bit is `1`, the pixel lives in the **Active Stratum**. It is a system instruction that configures hardware, jumps through memory, or executes atomic opcodes.

#### Bit Layout — Process Mode

```
 3                   2                   1                   0
 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
├─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┤
│1│  OPCODE │ SUB-OP  │  PARAM 1  │  PARAM 2  │      MISC         │
└─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┘
```

| Field | Bits | Purpose |
|-------|------|---------|
| **Modality** | `[31]` | `1` = Process |
| **Opcode** | `[28:30]` | Instruction class (3 bits = 8 classes) |
| **Sub-Op** | `[24:27]` | Variant within the class (4 bits = 16 variants) |
| **Param 1** | `[16:23]` | First argument (8 bits) |
| **Param 2** | `[8:15]` | Second argument (8 bits) |
| **Misc** | `[0:7]` | Frame rate, loop count, alpha, or flags |

#### Process Opcodes

| Opcode (top nibble) | Name | Function |
|---------------------|------|----------|
| `0x8` | `ATOMIC` | Instant execution of a single VM opcode (JMP, RECTF, FILL, CALL, etc.) |
| `0x9` | `BIOS` | System configuration — FPS, resolution, peripherals, boot mode |
| `0xA` | `PORTAL` | 32-bit pointer into RAM. The pixel *is* an address |
| `0xB` | `GENERATIVE` | PRNG seed that grows patterns (fractal, noise, cellular automata) |
| `0xC` | `TEMPORAL` | Time-aware seed. Meaning evolves with `FrameCount` |
| `0xD` | `SPATIAL` | Position-aware seed. Meaning depends on `(x, y)` coordinate |
| `0xE` | `RESERVED` | Future expansion |
| `0xF` | `META` | Self-referential / introspection commands |

---

## 3. The BIOS Pixel (Opcode 0x9)

The first pixel of a Geometry OS boot image, if it carries Opcode `0x9`, is intercepted by the bootloader **before** the VM or window is allocated. It morphs the virtual hardware to match the program's requirements.

### 3.1 BIOS Bit Map

```
 3                   2                   1                   0
 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
├─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┼─┤
│1│0 0 1│ BOOT  │   RES   │  PERIPHERAL MASK  │    FPS (Hz)       │
└─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┴─┘
```

| Field | Bits | Values |
|-------|------|--------|
| **Opcode** | `[31:28]` | `0x9` = BIOS |
| **Boot Mode** | `[28:30]` | `000`=ASM Source, `001`=Raw Bytecode, `010`=Pixelpack, `011`=Neural |
| **Resolution** | `[24:27]` | `0`=256×256, `1`=512×512, `2`=128×32, `3`=Headless |
| **Peripherals** | `[16:23]` | Bitmask: `b0`=Audio, `b1`=Network, `b2`=Mouse, `b3`=SysClock |
| **FPS** | `[0:15]` | `0`=Uncapped, `0x003C`=60, `0x000F`=15 (power-save) |

### 3.2 BIOS Examples

| Name | Hex | Translation |
|------|-----|-------------|
| High-Performance Game | `0x9105003C` | Bytecode, 512×512, Audio+Mouse, 60fps |
| Safe Mode CLI | `0x8300000A` | ASM source, Headless, No peripherals, 10fps |
| Uncapped Neural | `0xD0020000` | Neural substrate, 256×256, Network, Uncapped |

> **Implementation note:** The bootloader reads the first pixel, parses the BIOS word, configures the window size and FPS target, then **skips** the BIOS pixel when decoding the rest of the image as program data. See `src/pixel.rs::BootPixel` and `src/main.rs` for the reference implementation.

---

## 4. Spatio-Temporal Uniqueness

No two pixels are identical because every pixel carries implicit coordinates:

### 4.1 Spatial Identity

```
Meaning = f(seed_value, x, y)
```

- A `RECTF` command at `(0, 0)` draws a **system border**
- The same `RECTF` command at `(128, 128)` draws a **user widget**
- A `0x00FF0000` (red) pixel at `(0, 0)` is a **boot flag**
- The same red pixel at `(255, 255)` is **texture data**

### 4.2 Temporal Identity

```
Meaning = f(seed_value, FrameCount)

Frame 1:   seed = LDI instruction (load immediate)
Frame 100: top 8 bits toggle → becomes PEEK instruction (read memory)
```

A single static pixel can **animate** by changing its interpretation based on the system tick.

---

## 5. PixelPack Compatibility

The existing PixelPack encoding system (see `docs/PIXELPACK.md`) uses the **top nibble** `[31:28]` as a compression strategy (0x0–0xF). Under the Universal Taxonomy:

- **Strategies 0x0–0x7** are in Object mode (`bit 31 = 0`). They expand to colors, bytecode, or source text. This is fully compatible.
- **Strategies 0x8–0xF** overlap with Process mode (`bit 31 = 1`).

### 5.1 Current Status

| Top Nibble | PixelPack Strategy | Taxonomy Mode | Status |
|------------|-------------------|---------------|--------|
| `0x0` | `DICT_NEURAL_1` | Object | ✅ Compatible |
| `0x1` | `DICT_2` | Object | ✅ Compatible |
| `0x2` | `DICT_3` | Object | ✅ Compatible |
| `0x3` | `DICT_4` | Object | ✅ Compatible |
| `0x4` | `NEURAL_3` | Object | ✅ Compatible |
| `0x5` | `DICT_6` | Object | ✅ Compatible |
| `0x6` | `DICT_7` | Object | ✅ Compatible |
| `0x7` | `NIBBLE` | Object | ✅ Compatible |
| `0x8` | `RAW4` | Process (`ATOMIC`) | ⚠️ Overlap — migration planned |
| `0x9` | `RLE` | Process (`BIOS`) | ⚠️ Overlap — BIOS takes precedence for Pixel 0 |
| `0xA` | `RAW3` | Process (`PORTAL`) | ⚠️ Overlap — migration planned |
| `0xB` | `XOR_CHAIN` | Process (`GENERATIVE`) | ⚠️ Overlap — migration planned |
| `0xC` | `LINEAR` | Process (`TEMPORAL`) | ⚠️ Overlap — migration planned |
| `0xD` | `DELTA` | Process (`SPATIAL`) | ⚠️ Overlap — migration planned |
| `0xE` | `BYTEPACK` | Process (`RESERVED`) | ⚠️ Overlap — migration planned |
| `0xF` | `LITERAL` | Process (`META`) | ⚠️ Overlap — migration planned |

### 5.2 Migration Path

The immediate rule is **context-sensitive**:

1. **Pixel 0** of a boot image is always interpreted through the Taxonomy. If its top nibble is `0x9`, it is a BIOS pixel regardless of PixelPack legacy.
2. **Pixels 1+** continue to use PixelPack strategy expansion until the transport layer is fully aligned.
3. Future work will remap PixelPack strategies `0x8–0xF` into the Object-mode space (e.g., by using a strategy prefix in the payload bits) so the Taxonomy owns the entire top nibble unambiguously.

---

## 6. Summary: What One Pixel Can Do

| # | Role | Description |
|---|------|-------------|
| 1 | **Color** | 16.7 million literal hex values (Object mode) |
| 2 | **Instruction** | Atomic VM opcode — JMP, RECTF, FILL, CALL (Process `ATOMIC`) |
| 3 | **BIOS** | Configure FPS, resolution, peripherals, boot mode (Process `BIOS`) |
| 4 | **Portal** | 32-bit pointer into 4GB of RAM (Process `PORTAL`) |
| 5 | **Variable** | Store a 32-bit integer for calculations (Object payload) |
| 6 | **Generative Seed** | Grow fractals, noise, or cellular automata (Process `GENERATIVE`) |
| 7 | **Temporal Rule** | Evolve meaning based on frame count (Process `TEMPORAL`) |
| 8 | **Spatial Rule** | Meaning depends on screen coordinate (Process `SPATIAL`) |
| 9 | **Compressed Data** | PixelPack seed expanding to bytecode or source text (Object mode) |

---

## 7. References

| Document | Purpose |
|----------|---------|
| `docs/PIXELPACK.md` | Hex-key and seed-expansion visual encoding |
| `docs/PIXELPACK_KEY.md` | The 16-character hex key for drawing commands |
| `src/pixel.rs` | Reference implementation of BootPixel, peek, and skip-decode |
| `src/main.rs` | Bootloader integration — window sizing, FPS, PNG boot paths |

---

*The Universal Pixel Taxonomy is the contract between light and logic. Every pixel is a universe. Every image is an operating system.*
