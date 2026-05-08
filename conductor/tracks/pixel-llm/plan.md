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

## Strategic Pivot: Structured Generation
To make PixelGPT viable for self-hosted AI code generation, we must pivot away from free-form autoregressive generation.

**Next Steps (Phase 2):**
1. **Constrained Decoding Engine**: Build a robust, grammar-aware decoding wrapper that intercepts model logits and enforces the GeOS ISA state machine. If an opcode expects 3 registers, the model can *only* output 3 registers.
2. **Synthetic Instruction-Tuning Dataset**: Generate a massive (100k+ samples) dataset of minimal, single-purpose GeOS programs paired with exact, concise descriptions to train the model on semantic mapping without overfitting.
3. **Chain-of-Thought (CoT)**: Restructure prompts so the model first generates a semantic "Plan" as a comment, then the structured assembly code.
