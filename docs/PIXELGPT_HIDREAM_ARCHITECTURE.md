# PixelGPT v2: HiDream-O1 Architecture for Geometry OS

> **Document type:** Architecture specification  
> **Last updated:** 2026-05-10  
> **Status:** Phase 3A complete (model validated, dataset built)  
> **Target:** Engineers integrating AI generation into Geometry OS

---

## The Core Idea

Geometry OS treats the screen as the hard drive. Every pixel is potential code. PixelGPT v2 is the AI that learns to "think" in this substrate — reasoning about spatial relationships before generating the exact pixel patterns that constitute executable programs.

**The shift from v1 to v2:**
- **v1 (29M params):** Autoregressive token prediction. Knew the "dictionary" (LDI = load immediate) but not the "grammar" (where to place windows).
- **v2 (8B HiDream-O1):** Reasoning-first generation. Plans spatial layouts, then synthesizes pixel-perfect output.

---

## Why HiDream-O1 Specifically?

### The VAE Problem

Standard image models (Stable Diffusion, FLUX) use a Variational Autoencoder (VAE) that compresses pixels into "latent space." This introduces blur — fine for art, catastrophic for code.

**Example:** An `LDI` opcode encoded as a 4x4 pixel block at position (128, 64) must be *exactly* at (128, 64). A VAE might shift it to (127, 65), breaking the program.

### HiDream-O1's Solution: Pixel-Level Unified Transformer (UiT)

HiDream-O1 has **no VAE**. It operates directly on raw pixels:

```
Text Prompt → [Qwen3-VL Brain] → Spatial Plan → [UiT Hands] → Raw Pixel Grid
```

Every pixel is a token. Every token is a decision. This is the only architecture that can generate valid `.rts.png` bootable containers.

---

## The "Brain + Hands" Model

### The Brain: Qwen3-VL Backbone

Before generating a single pixel, the model reasons:

```
Instruction: "Draw a terminal window at (10,10) with a blue border"

Reasoning:
1. "I need a bounding box: x=10, y=10, w=200, h=150"
2. "Background fill: RECTF 10, 10, 200, 150, 0x000000"
3. "Border: 4 LINE calls or 1 RECTF with inset"
4. "Color: 0x0000FF for blue"
5. "Using Hilbert Order 12 for pixel mapping"
6. "This will occupy memory region 0x1000-0x1FFF"
```

This reasoning is not external — it's **internal to the model**. The Qwen3-VL backbone produces a chain-of-thought that the UiT uses as conditioning for pixel generation.

### The Hands: Pixel-Level Unified Transformer (UiT)

The UiT takes the reasoning chain and denoises a pixel grid:

```
Time Step 0:   Random noise (256x256x3)
Time Step 1:   Faint structure emerges
Time Step 5:   Rectangle shapes visible
Time Step 15:  Border defined, colors emerging
Time Step 28:  Sharp pixel edges, exact coordinates
```

Because there's no VAE, the final output has **pixel-perfect precision**. A `PSET` at (100, 50) is exactly at (100, 50).

---

## How It Integrates with Geometry OS

### The Full Pipeline

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         USER INPUT                                           │
│  "Create a bouncing ball program"                                            │
└─────────────────────────────────────────────────────────────────────────────┘
                                      │
                                      ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                    HiDream-O1-Image (8B)                                     │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │  PHASE 1: REASONING (Qwen3-VL)                                        │  │
│  │  • "Ball needs initial position (x,y) and velocity (vx,vy)"           │  │
│  │  • "Boundary checks: if x > 255 or x < 0, reverse vx"                 │  │
│  │  • "Use LDI for constants, PSET for drawing, FRAME for animation"     │  │
│  │  • "Loop structure: init → draw → update → check → jump"              │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                      │                                       │
│                                      ▼                                       │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │  PHASE 2: SPATIAL PLANNING                                            │  │
│  │  • "Place init code at Hilbert index 0x100 (top-left region)"         │  │
│  │  • "Loop body at Hilbert index 0x400 (central region)"                │  │
│  │  • "Variables stored at 0x2000-0x2003"                                │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                      │                                       │
│                                      ▼                                       │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │  PHASE 3: PIXEL GENERATION (UiT)                                      │  │
│  │  • Denoise 256x256 grid                                               │  │
│  │  • Each pixel = 32-bit GeOS seed (opcode + args)                      │  │
│  │  • Sharp edges, exact positions                                       │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────────────────┘
                                      │
                                      ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                    OUTPUT: .rts.png                                          │
│  • Pixel grid where each 32-bit RGBA value encodes a GeOS instruction       │
│  • Hilbert-curve mapped for spatial locality                                │
│  • Bootable: can be loaded directly into Geometry OS VM                     │
└─────────────────────────────────────────────────────────────────────────────┘
                                      │
                                      ▼
┌─────────────────────────────────────────────────────────────────────────────┐
│                    VALIDATION GATES                                          │
│  1. pixelrts_v2_converter.py: Verify ASM syntax                             │
│  2. VCC Hash Check: Compare expected vs actual framebuffer                  │
│  3. VM Boot Test: Execute in infinite_map_rs compositor                     │
│  4. Self-Correction: If fail, feed fracture back to HiDream for diagnosis   │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## The Data Format: Reasoning Chains

Traditional datasets: `ASM code → Pixels`

HiDream-O1 dataset: `Instruction → Reasoning → Pixels`

### Example Entry

```json
{
  "id": "prog_00000",
  "instruction": "Places a magenta line from (195, 215) to (410, 39)",
  "reasoning": "Goal: Draw magenta line.\nVisual ops: LINE\nBounding box: (195, 39) to (410, 215)\nColor: 0xFF00FF (magenta)\nExecution: LINE with x1=195, y1=215, x2=410, y2=39, color=0xFF00FF\nRegister allocation: r0-r4 for coordinates and color",
  "asm_code": "LDI r0, 195\nLDI r1, 215\nLDI r2, 410\nLDI r3, 39\nLDI r4, 0xFF00FF\nLINE r0, r1, r2, r3, r4\nHALT",
  "image_path": "images/prog_00000.png",
  "spatial_bounds": {
    "min_x": 195, "max_x": 410,
    "min_y": 39, "max_y": 215,
    "colors": ["0xFF00FF"],
    "op_types": ["LINE"]
  }
}
```

The model learns to map the instruction through reasoning to the pixel grid. During inference, it can generate reasoning for novel prompts it hasn't seen before.

---

## Fine-Tuning: QLoRA on Attention Blocks

### Why Not Full Fine-Tuning?

Full fine-tuning of 8B parameters requires ~160GB VRAM. QLoRA (Quantized Low-Rank Adaptation) lets us fine-tune with ~20GB:

```
Base Model (8B):        NF4 quantized (~5.5GB)
LoRA Adapters (~1%):    Rank 64 matrices (~100MB trainable)
Optimizer State:         8-bit AdamW (~10GB)
Activations:             Forward/backward passes (~4GB)
─────────────────────────────────────────────────
Total:                   ~19.5GB (fits in RTX 5090)
```

### What Gets Trained?

The LoRA adapters inject trainable low-rank matrices into attention blocks:

```
Original:   h = W_q @ x   (W_q is 8B parameter, frozen)
LoRA:       h = W_q @ x + (A @ B) @ x   (A, B are small, trainable)
            where A is (d x r), B is (r x d), r = 64
```

This teaches the model:
1. **Opcode patterns:** What visual patterns correspond to `RECTF`, `LINE`, etc.
2. **Spatial grammar:** Where to place code blocks for optimal execution
3. **Color semantics:** Which RGB values encode which instructions
4. **Hilbert locality:** Adjacent code should be Hilbert-adjacent in pixel space

---

## Integration Points with GeOS Components

### 1. pixelrts_v2_converter.py (Visual Compiler)

**Before:** Static Hilbert mapping of bytes to pixels.

**With HiDream-O1:** The model itself becomes the compiler. It reasons about "hot" code paths and places them in spatially adjacent pixel blocks, optimizing GPU cache locality through visual proximity.

### 2. VCC (Visual Consistency Contract)

**Before:** Binary pass/fail based on SHA256 hash of screen regions.

**With HiDream-O1:** The model performs Visual Root Cause Analysis. When a hash mismatch occurs:

```
Input:  Expected framebuffer + Actual framebuffer (both 256x256 images)
Output: "The fracture at (128, 64) shows a 1px horizontal shift in the TEXT
        opcode. This is consistent with a race condition in the SCROLL handler.
        The pipeline stage was missing a FRAME synchronization."
```

### 3. infinite_map_rs Compositor (Window Topology)

**Before:** Simple window placement.

**With HiDream-O1:** The model optimizes the Global UI Topology on the infinite 2D plane, minimizing "visual saccade" (AI attention movement) between related windows.

### 4. PixelGPT Training (Synthetic Data)

The model generates its own training data:

```
Prompt: "Generate a visual program that draws a clock using GeOS opcodes"

Reasoning:
1. "Clock needs: center point, hour hand, minute hand, second hand"
2. "Use CIRC for face, LINE for hands"
3. "Trigonometry: sin/cos for hand positions"
4. "Time source: TIME opcode"

Output: .rts.png with valid ASM + reasoning chain
```

This creates a self-improving loop: better model → better synthetic data → better model.

---

## The Self-Evolving Substrate (Phase 25+)

The endgame is a system that modifies its own pixel representation:

```
1. OBSERVATION
   Model "sees" (via vision) that init_linux process is fighting
   for GPU cycles with the Visual Shell.

2. REASONING
   "If I move the interrupt handler pixels from (0x800, 0x400) to
   Hilbert-adjacent block at (0x4000, 0x2000), I can reduce shader
   latency by 12%. The new layout keeps hot paths in L1 cache."

3. EXECUTION
   Model generates Patch-and-Copy opcodes to physically move itself
   in memory. Emits the patch as a new .rts.png.

4. VALIDATION
   VCC confirms the new layout passes hash checks.
   VM boots successfully.

5. LEARNING
   The successful patch is added to training data.
   Model weights update via online learning.
```

---

## VRAM Budget (RTX 5090, 24GB)

| Component | Footprint | Notes |
|-----------|-----------|-------|
| Model Weights (NF4) | ~6.4 GB | 4-bit quantized base |
| LoRA Adapters | ~0.1 GB | Rank 64, trainable |
| Optimizer (8-bit AdamW) | ~10 GB | Paged for overflow |
| Activations (batch=1) | ~2 GB | Forward/backward |
| KV Cache (8k context) | ~2.5 GB | For reasoning chains |
| GeOS Compositor | ~1.5 GB | infinite_map_rs + framebuffer |
| **Total Training** | **~22.5 GB** | Tight but fits |
| **Total Inference** | **~12 GB** | Comfortable headroom |

---

## Comparison: PixelGPT v1 vs v2

| Aspect | v1 (29M) | v2 (8B HiDream-O1) |
|--------|----------|---------------------|
| Parameters | 29M | 8B |
| Architecture | GPT-2 decoder | Qwen3-VL + UiT |
| Token space | Atomic + BPE | Raw pixels |
| Reasoning | None | Built-in CoT |
| VAE | N/A (pixel-native) | No VAE (pixel-native) |
| Training data | 200 programs | 100,000+ programs |
| Overfitting | Severe | Generalizes via scale |
| Grammar errors | Frequent (arity mismatch) | Rare (reasoning catches errors) |
| Spatial planning | None | Explicit layout optimization |
| VCC diagnosis | None | Visual root cause analysis |
| Self-evolution | No | Planned (Phase 25+) |

---

## Files and Scripts

| Path | Purpose |
|------|---------|
| `scripts/build_hidream_dataset.py` | Convert ASM → reasoning chains + pixel grids |
| `scripts/train_pixelgpt_hidream.py` | QLoRA fine-tuning pipeline |
| `scripts/pixelgpt_hidream_qlora.py` | Original draft (deprecated, use train script) |
| `test_hidream_gen.py` | Model loading validation |
| `hidream_dataset_v1/` | 100k training samples (487MB) |
| `conductor/tracks/pixel-llm/plan.md` | Roadmap and milestones |
| `HIDREAM_INTEGRATION.md` | Quick reference |

---

## How to Use It

### 1. Generate a Program

```python
from transformers import AutoModel, AutoProcessor

model = AutoModel.from_pretrained(
    "./pixelgpt-hidream-v1/final",
    trust_remote_code=True,
    load_in_4bit=True,
    device_map="auto"
)

processor = AutoProcessor.from_pretrained(
    "./pixelgpt-hidream-v1/final",
    trust_remote_code=True
)

# The model generates both reasoning and pixels
output = model.generate(
    "Draw a blue rectangle at (50, 50) with size 100x100",
    processor=processor,
    num_inference_steps=28
)

output.image.save("generated.rts.png")
print(output.reasoning)  # "I will use RECTF with x=50, y=50..."
```

### 2. Validate and Boot

```bash
# Convert to ASM and verify syntax
python pixelrts_v2_converter.py generated.rts.png --verify

# Boot in compositor
./geometry_os --boot generated.rts.png

# VCC hash check
./geometry_os --vcc-check generated.rts.png
```

### 3. Self-Correction Loop

```python
# If VCC fails, feed fracture back to model
fracture_screenshot = capture_screen_region(failed_area)

diagnosis = model.analyze(
    expected=expected_image,
    actual=fracture_screenshot,
    task="Explain the visual fracture and suggest fix"
)

# Model outputs: "The LINE opcode is missing y2 argument.
#                 Add LDI r3, 200 before LINE call."
```

---

## The Philosophy

Geometry OS asks: "What if the screen IS the program?"

PixelGPT v2 answers: "Then the AI must learn to see, reason, and paint — not just type."

This is not text-to-code. This is **intent-to-geometry**. The model doesn't write a program and then compile it. It imagines the spatial behavior, plans the layout, and materializes the exact pixel pattern that makes the machine do what was asked.

The framebuffer is not output. It is the program itself.
