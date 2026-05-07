# PixelGPT: Architectural Deep-Dive

PixelGPT is the transformer model powering the Geometry OS Pixel-LLM. It is designed to autoregressively "paint" executable programs by predicting the next 32-bit pixel seed in a sequence.

## Core Architecture

PixelGPT follows a standard **GPT-2 style Decoder-only Transformer** architecture.

### Model Parameters (Spike Version)
- **Parameters:** ~2.8 Million
- **Layers (Blocks):** 2
- **Attention Heads:** 4
- **Embedding Dimension:** 128
- **Context Window:** 512 tokens (pixels)
- **Vocabulary Size:** ~19,000 unique pixel seeds

## The Data Pipeline: Pixel-to-Token

Unlike standard LLMs that use BPE (Byte Pair Encoding) on text, PixelGPT treats the **Geometry OS Pixel Substrate** as its native vocabulary.

1.  **Pixel Mapping:** Each unique 32-bit pixel seed found in the training corpus (208 programs) is mapped to a dense integer index (0 to ~19,000).
2.  **Strategy A (raw3):** Most tokens represent 3 ASCII characters packed into an RGBA pixel (e.g., `0xA04C4449` = `LDI `).
3.  **Embeddings:** The discrete index is projected into a 128-dimensional continuous vector space.

## Transformer Block Components

Each of the 2 transformer blocks contains two primary sub-layers:

### 1. Causal Self-Attention
This is where the "intelligence" happens. For each pixel in the context window, the model computes:
-   **Query (Q):** "What am I looking for?"
-   **Key (K):** "What information do I contain?"
-   **Value (V):** "This is my contribution to the sequence."

A **Causal Mask** (lower triangular matrix) is applied to the attention scores to ensure that when the model is predicting the next instruction, it can only "see" the instructions it has already painted.

### 2. Feed-Forward Network (MLP)
After the attention mechanism gathers context from the sequence, a 2-layer linear network with **GELU** (Gaussian Error Linear Unit) activation processes each token independently. This allows the model to learn the complex non-linear relationships between opcodes (e.g., that `LDI` is often followed by a register and then an immediate value).

## Training Regime

The spike model was trained with the following hyperparameters:
-   **Optimizer:** AdamW (Weight Decay = 0.01)
-   **Learning Rate:** 3e-4 with **Cosine Annealing** (fading the LR to zero over the course of training).
-   **Loss Function:** Cross-Entropy (calculated over the dense pixel indices).
-   **Hardware:** Trained on NVIDIA RTX 5090.

## Emergent Intelligence: The "ISA Instinct"

Despite its small size (2.8M params), the model developed an "ISA Instinct":
-   **Signature Matching:** It learned that `RECTF` requires 5 registers, while `STORE` requires only 2.
-   **Register Locality:** It prefers registers `r0-r15` for general logic, mimicking human-written GeOS assembly.
-   **Spatial Layout:** It learned to "paint" labels with colons and comments with semicolons in the correct geometric positions.

## Implementation Files
- `pixelflow/train_pixel_llm.py`: Model definition and training loop.
- `pixelflow/pixel_llm_pipeline.py`: Inference engine logic.
- `scripts/geos_paint.py`: User-facing CLI that executes the model.
