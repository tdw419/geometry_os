# Spike Proposal: Pixel-LLM (The "Paint-to-Code" Bridge)

## Goal
Build a 'Pixel-LLM' that treats Geometry OS opcodes as visual tokens, generating executable programs by 'painting' pixels directly onto the framebuffer. This bypasses the text-based assembly layer for direct 'geometric intelligence'.

## Architecture
1.  **Visual Vocabulary (Opcodes as Tokens):**
    -   Mapping the GeOS 32-bit pixel-encoded ISA (R=opcode, G=op1, B=op2) into a discrete token space for a transformer.
    -   Leveraging the `Pixel-VM` (9 opcodes) or the full GeOS ISA (187 opcodes).
2.  **Pixel-Native Inference Engine:**
    -   Using the existing `pixelflow` GPT-2 engine (10ms/token on RTX 5090) to generate the next 'instruction pixel'.
    -   Weights stored as BC4 compressed textures (8x VRAM reduction).
3.  **Training Substrate:**
    -   Dataset: The ~200 existing `.asm` files rendered as 'Pixel Program' PNGs via the `pixelpack` encoder.
    -   Task: Autoregressive pixel prediction (given the first N rows of a program image, predict the next pixel).
4.  **Geometry OS Integration:**
    -   A new `.glyph` or `.asm` helper that calls the `pixelflow` engine via a bridge.
    -   The model generates a 2D grid of pixels that are then executed by the GeOS VM.

## Phase 1: The "Seed" Spike (Proof of Concept)
-   **Step 1:** Render all `programs/*.asm` to 1D pixel arrays (seeds).
-   **Step 2:** Fine-tune a toy GPT-2 (small context) on these pixel sequences.
-   **Step 3:** Use `pixelflow` to generate a 32-pixel 'seed sequence' from a prompt.
-   **Step 4:** Decode the seeds and run them in the GeOS VM.

## Why this is "Geometric Intelligence"
In GeOS, the screen IS the computer. By training a model to 'paint' correctly, we are training it to 'program' spatially. The model doesn't output text; it outputs the machine state.

**Status:** Ready to begin Step 1 (Dataset Generation) if approved.
