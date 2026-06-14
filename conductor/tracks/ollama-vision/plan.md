# Implementation Plan: Local Ollama Vision Model Integration

## Objective
Integrate a local Ollama vision model (default: `llama3.2-vision:11b`) into Geometry OS to act as a dev-time accelerator and runtime perception primitive, without relying on external API costs. This turns the existing text-only Ollama agent integration into a multi-modal one capable of seeing the native Geometry OS pixel framebuffer.

## Key Files & Context
- `src/hermes.rs`: Existing Hermes agent loop and Ollama text integration. Contains config, text parser, and cURL calls.
- `src/vision.rs`: Contains PNG encoding (`encode_png_base64`), checksums, and diffs.
- `src/vm/mod.rs`: Virtual machine executor, specifically where the reserved `AI_AGENT` opcode `0xB0` lives.
- `provider.json`: Configuration for LLM providers (needs care around checked-in API keys).
- `src/bin/vision_bench.rs` (New): Benchmark harness comparing Vision vs Text accuracy/latency.

## Implementation Steps

### Phase 1: Shared Core (`call_vision_llm`)
1. **Update `ProviderConfig`**: Add an optional `vision_model: Option<String>` field (default: `"llama3.2-vision:11b"`). Parse it from `provider.json` and add it to `local_ollama()`.
2. **Implement `call_vision_llm`**: Add a new function in `src/hermes.rs` (~line 1389) that mirrors the existing `call_llm` but accepts an `image_b64` parameter and formats the payload for Ollama's vision API (`images: ["<base64>"]`). Use `/tmp/geo_hermes_vision_payload.json` for the temp file to avoid collisions.

### Phase 2: Role 1 - Closed-loop Autonomous Hermes
1. **Update Hermes Loop**: In `src/hermes.rs`, modify the context building to capture the actual screen PNG via `crate::vision::encode_png_base64(&vm.screen)` instead of an ASCII dump. Keep the non-zero pixel count log.
2. **Use Vision Wrapper**: Replace the `call_ollama` invocation with a new `call_ollama_vision` wrapper function.
3. **Verification**: Run `cargo run -- hermes` against `bouncing_ball.asm` and ask visual questions.

### Phase 3: Role 2 - Vision-vs-Text Empirical Benchmark
1. **Create Benchmark Harness**: Create `src/bin/vision_bench.rs` (~150 LOC). No `Cargo.toml` change needed.
2. **Generate Scenarios**: Programmatically generate ~10 paired scenarios (e.g., memory leak, runaway process, healthy oscillator, stuck pixel).
3. **Run Comparisons**: For each scenario, send both text and PNG prompts to the LLM. Request: "Is this system healthy? Reply YES or NO and one short reason." Record latency, agreement, and verdict.
4. **Update Log Schema**: Extend `src/episode_log.rs` with `bench_kind`, `modality`, and `verdict` fields.
5. **Verification**: `cargo run --bin vision_bench` produces a report.

### Phase 4: Role 3 - In-VM Perception Opcode (`AI_AGENT 0xB0`)
1. **Implement Executor**: In `src/vm/mod.rs`, add the executor for opcode `0xB0` (AI_AGENT).
2. **Opcode Logic**:
   - Read register operand as mode selector (0=full screen, 1=region, 2=count_color).
   - Encode screen to PNG (`encode_png_base64`).
   - Call `call_ollama_vision` with a hardcoded prompt ("Reply with one integer: how many distinct objects do you see?").
   - Parse leading integer response and write to register (use `0xFFFFFFFF` on timeout). Cap timeout at 15s.
3. **Verification**: Write a short `.asm` program that draws three squares, calls `AI_AGENT R0, 0`, halts, and assert `R0` is ~3.

## Verification & Testing
- Ensure no regressions in existing rendering or opcodes (`cargo test`).
- Verify API key in `provider.json` is handled safely (flagged if checked in).
- Verify the latency impact of `AI_AGENT` is acceptable (2-10s per inference on CPU) and mitigate with `canvas_checksum` cache if needed.

## Alternatives Considered
- Streaming responses, new HTTP clients (`reqwest`), and replacing external Claude integration were explicitly rejected to minimize scope and keep the simple `curl` subprocess pattern.
- GPU offloading is left transparently to Ollama.