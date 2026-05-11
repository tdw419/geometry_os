# Spike Proposal: Pixel-LLM (The "Paint-to-Code" Bridge)

## Goal
Build a 'Pixel-LLM' that treats Geometry OS opcodes as visual tokens, generating executable programs by 'painting' pixels directly onto the framebuffer. This bypasses text compilers entirely and enables self-hosted AI code generation.

## Rationale
Standard LLMs struggle with esoteric assembly languages because their tokenizers fragment the logic into meaningless BPE subwords. By training a small model (15M-30M parameters) exclusively on GeOS opcodes (where each opcode is a single, discrete token), we can develop an "ISA Instinct" where the model understands the shape and grammar of the machine implicitly.

## Status Update: Experiment Concluded (V8)
The initial experiment to train a 29M parameter model (PixelGPT V8) on a 'Golden Dataset' of 2,110 augmented programs is complete.

**Key Findings:**
1. **Tokenizer Fixed**: Moving to a strict `ByteLevel` BPE for prose and exact char-level encoding for literals successfully eliminated the 'space injection' text fragmentation.
2. **ISA Instinct vs Overfitting**: While the model can generate syntactically valid constructs and occasionally succeeds on simple prompts (like filling the screen blue), it rapidly overfits the small 200-program training set. It hallucinates undefined labels and parrots long comments rather than synthesizing new logic.
3. **Autoregressive Brittleness**: Free-form next-token prediction frequently results in grammar errors (e.g., emitting `RECTF` with 2 arguments instead of 5).

## Phase 3: The Reasoning-Spatial Scale-up (HiDream-O1 Integration)

The discovery of **HiDream-O1-Image (8B)** provides a perfect base for the next generation of PixelGPT. Unlike latent-diffusion models, HiDream-O1 operates directly in **Pixel Space (No VAE)**, aligning perfectly with our framebuffer-first architecture.

### 1. Model & Quantization Strategy
To fit within a 24GB VRAM budget (RTX 3090/4090), we will employ:
*   **Base Model:** HiDream-O1-Image-Dev (8B Unified Transformer).
*   **Quantization:** NF4 (4-bit) for the base weights using `bitsandbytes`.
*   **Fine-tuning:** QLoRA (Rank 64) targeting the Transformer blocks.
*   **VRAM Allocation:**
    *   Model (4-bit): ~5.5 GB.
    *   Optimizer/Gradients: ~10 GB.
    *   KV Cache (8k context): ~2 GB.
    *   System Overhead (GeOS Compositor): ~1 GB.
    *   **Total:** ~18.5 GB (Leaving ~5.5 GB for training batch headroom).

### 2. Integration: The "Reasoned Opcode" Pipeline
HiDream-O1's internal "Thinking" agent allows for complex spatial planning before code emission:
1.  **Instruction:** "Draw a terminal window at (10,10) with a blue border."
2.  **Reasoning (O1):** "I need to calculate the bounding box, emit a `RECTF` for the background, then 4 `RECTF` or `LINE` calls for the border. I will use Hilbert Order 12 for the pixel mapping."
3.  **Visual Emission:** The model 'paints' the `.rts.png` bootable container directly.

### 3. VCC (Visual Consistency Contract) Enhanced
The 8B model's vision capabilities allow it to perform autonomous **Self-Correction**. If a generated program fails a VCC hash check, the model can 'look' at the fracture and reason about the fix (e.g., "The `LDI` was missing an immediate value, shifting the pipeline.")
