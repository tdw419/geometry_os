# Code-Pixel Generation (Pixel-LLM)

Geometry OS uses a "Pixel-LLM" to generate executable programs by treating 32-bit pixel seeds as tokens. This creates a "Paint-to-Code" pipeline where the model generates a 2D grid of pixels that directly represent machine instructions.

## The Philosophy: "Pixels Move Pixels"

In most systems, code is text that is compiled into binary. In Geometry OS, the "Binary" IS the "Image". By training a model to predict the next pixel in an image, we are simultaneously training it to predict the next instruction in a program.

## Architecture

The Pixel-LLM is a discrete transformer model that operates on the **GeOS Pixel Vocabulary**.

### 1. Visual Vocabulary
- **Tokens:** Each token is a 32-bit u32 representing a `pixelpack` seed.
- **Encoding:** Strategy `0xA` (raw3) is primarily used, packing 3 ASCII bytes into each RGBA pixel.
- **Vocab Size:** ~19,000 unique pixel values (extracted from the 200+ program corpus).
- **Format:** `0xA0` (Strategy A) + `byte2` + `byte1` + `byte0`.

### 2. The Model (PixelGPT)
- **Size:** 2.8M parameters (Spike model).
- **Layers:** 2-4 Transformer blocks.
- **Heads:** 4-6 Attention heads.
- **Context Window:** 256 - 1024 pixel tokens.
- **Backend:** `pixelflow` (GPU-native inference via fragment shaders on RTX 5090).

### 3. The "Generate-and-Test" Loop
Because the model generates code as a visual painting, it can occasionally "hallucinate" invalid syntax (e.g., incorrect register names or argument counts). To ensure correctness, the `geos-paint` utility uses a Generate-and-Test loop:
1.  **Generate:** The LLM produces N samples (e.g., 5 programs).
2.  **Decode:** Pixel seeds are decoded back into assembly source text.
3.  **Validate:** Each sample is passed through the GeOS assembler.
4.  **Execute:** The first program that successfully assembles is selected for execution.

## The Dataset

The model was trained on the **GeOS Pixel Dataset**:
- **Source:** 208 programs from `programs/` and `lib/`.
- **Volume:** ~645,000 pixel tokens.
- **Coverage:** Full GeOS ISA, including graphics primitives (`RECTF`, `PSET`), multi-processing (`SPAWN`), and kernel syscalls.

## Tooling

### `geos-paint`
The primary interface for code-pixel generation.

```bash
# Generate and run a program from a prompt
./scripts/geos_paint.py "Draw a red square at 10,10" --run

# Validate 5 samples for a complex prompt
./scripts/geos_paint.py "Main loop with counter" --validate --samples 5
```

### `train_pixel_llm.py`
The training script for the Pixel Transformer. It maps the raw 32-bit seeds to a dense index space for the transformer's embedding layer.

### `pixel_llm_pipeline.py`
The inference engine that bridges the PyTorch/Pixelflow model with the GeOS filesystem.

## Intelligence Characteristics

At the current scale (2.8M params), the model exhibits:
- **ISA Grammar:** 95%+ accuracy on opcode arity and register usage.
- **Structural Memory:** Correct use of labels (`main_loop:`), comments (`;`), and section dividers.
- **Boilerplate Proficiency:** Excellent at setting up standard GeOS environments (clearing screen, initializing `TXT_BUF`).
- **Creative Limits:** Needs higher parameter counts to master complex algorithms or specific non-linear geometric shapes.

## Future: Self-Describing Pixels

The ultimate goal of this research is a **Self-Generating OS Substrate**, where the OS can "paint" its own updates and UI elements at runtime based on high-level system needs, using the `pixelflow` WebGL engine for sub-100ms on-device inference.
