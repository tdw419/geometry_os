# PixelGPT: Architectural Deep-Dive & Generative Logic

PixelGPT represents a seminal moment in Geometry OS: a transition from text-centric models to architectures that synthesize executable machine logic through geometric primitives. As the primary transformer model powering the Pixel-LLM, it autoregressively "paints" executable programs by treating the 32-bit pixel seeds of the Geometry OS substrate as its native vocabulary.

## Theoretical Framework: The Pixel Substrate

In Geometry OS, the "Pixel Substrate" collapses the distinction between the graphical interface and underlying machine code. The fundamental unit is the 32-bit pixel seed (RGBA), acting as a dense container for opcodes, register identifiers, and immediate values.

### The Information Geometry of Pixel Seeds
The mapping of these 32-bit seeds into a latent space is governed by principles of information geometry. PixelGPT navigates a high-dimensional Output-Space Search (OS-Search), predicting the most probable subsequent seed. The relationship between these tokens is defined within a 128-dimensional continuous vector space. Proximity indicates functional similarity—for example, arithmetic operations like `ADD` and `SUB` are clustered due to their shared relationship to register-based logic.

### Hybrid Atomic-BPE Tokenization
Geometry OS has transitioned from raw pixel-packing to a **Hybrid Atomic-BPE** substrate. This bridges the gap between machine logic and natural language documentation.

*   **Atomic Opcodes (IDs 0-267):** Instructions, registers, and structural tokens are preserved as discrete atomic units. This prevents syntax hallucinations and ensures high-fidelity code generation.
*   **BPE Literals & Prose (IDs 300+):** English documentation, comments, and ASM literals (Numbers, Labels, Strings) are routed through a Byte-Pair Encoding (BPE) model. 
*   **The Benefit:** This architecture allows for **Geometric RAG**. Documentation pixels and code opcodes share the same latent space, enabling the model to "read" descriptions to inform its "painting" of code.

## Core Architecture and Hyperparameters

PixelGPT uses a GPT-2 style decoder-only transformer architecture.

### Model Parameterization (Bilingual Version)
The Bilingual version scales the model to support semantic understanding:
- **Total Parameters:** ~15 Million (Target)
- **Layers (Blocks):** 6-12
- **Attention Heads:** 8-12
- **Embedding Dimension:** 384-512
- **Vocabulary Size:** ~3,300 (268 Atomic + 3,000 BPE)
- **Context Window:** 1024 Pixels

## The Data Pipeline: From Pixels to Latent Embeddings

The transformation of raw pixels into tokens uses **Strategy 0x4 (Neural Pack)**. Each 32-bit pixel encodes up to three 9-bit token IDs from the Bilingual Tokenizer (0x4_ID1_ID2_ID3). This allows the OS kernel to expand a single visual pixel into three discrete neural instructions (Opcodes or BPE subwords).

The pipeline uses the **Bilingual Tokenizer** to map source code and documentation into a dense index space (0-3300). The embedding layer then projects these IDs into a continuous vector space (384-512 dimensions), where functional similarity is learned through autoregressive prediction on the Bilingual Corpus (211 annotated programs + synthetic descriptions).

## The Transformer Block Mechanics

Each transformer block contains two primary sub-layers:

### 1. Causal Self-Attention
For each pixel in the context window, the model generates Query, Key, and Value vectors. Attention scores are constrained by a **Causal Mask** (a lower triangular matrix) preventing the model from "looking ahead." This forces it to learn the "grammar" of the pixels sequentially, emulating human geometry learning. Each of the 8-12 heads specializes in structural aspects of the GeOS ISA (e.g., matching `RECTF` with its 5 required registers).

### 2. Feed-Forward Network (MLP)
Following the attention mechanism, a 2-layer linear network with **GELU** activation processes each token independently. This models the complex, non-linear relationships between opcodes (e.g., `LDI` typically preceding a register).

## Emergent Behavior: The "ISA Instinct"

Through autoregressive training (AdamW, 3e-4 LR with Cosine Annealing on RTX 5090), the 2.8M parameter model developed an "ISA Instinct":
- **Signature Recognition:** Correct operand counts (arity) for opcodes like `RECTF` (5 args) vs `STORE` (2 args).
- **Register Affinity:** Preferential use of common register blocks (`r0-r15`), mimicking human logic.
- **Syntactic Placement:** Correct layout of punctuation (colons, semicolons) in geometric space.

## Runtime Execution and Stability

The inference engine (`pixelflow/pixel_llm_pipeline.py` and `geos_paint.py`) handles execution. Because the model outputs native Geometry OS 32-bit seeds, the execution mechanism is essentially a direct "readout" from the pixel substrate. This results in highly stable, native bytecode execution compared to traditional code generation that requires secondary compilation.

## Cross-Disciplinary Parallels of the Pixel Seed

PixelGPT's architecture echoes concepts from other advanced scientific fields:
- **High-Energy Physics:** "Pixel tracking seeds" in CMS detectors reconstruct particle paths based on sequential layer hits, much like PixelGPT propagates logic sequentially.
- **Remote Sensing:** "Region seeds" are used for image classification by growing regions outward based on similarity, analogous to how PixelGPT expands a program from a prompt seed.
- **Hardware Engineering:** Just as a physical CMOS pixel substrate requires optical clarity, the PixelGPT software substrate requires logical clarity and freedom from "geometric drift."

## Conclusion
PixelGPT is not merely "painting programs"; it is defining a new geometry of intelligence. By internalizing the ISA into geometric predictions and overcoming the geometry bottleneck, it provides a stable, machine-readable, and executable framework for autonomous engineering within Geometry OS.
