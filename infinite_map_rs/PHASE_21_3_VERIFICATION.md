# Phase 21.3: Verification & Testing — Receipt

**Date:** 2026-07-15
**Scope:** End-to-end verification of the Phase 21 neural pattern generation pipeline (NeuralPrompter → Ollama → PatternMaterializer → TournamentManager injection) against a live Ollama instance.

**Environment:** Ollama serving `qwen2.5-coder:14b` (17 GB, 100% GPU, RTX 5090 Laptop 24 GB), endpoint `http://localhost:11434/v1/chat/completions`.

---

## Headline result

The pipeline now works end-to-end against real Ollama: **10/10 patterns generated, validated, and materialized** in the standalone harness, and a live evolution run detected a fitness plateau at generation 7 and **injected 14 neural circuits** into the population.

However, verification found that **the pipeline had never actually worked before**: two fatal bugs meant Phase 21.2's "integration complete" status was compile-verified only.

## Defects found and fixed

| # | Severity | Defect | Fix |
|---|----------|--------|-----|
| 1 | Fatal | `generate_circuit_from_prompt` parsed the raw HTTP body as the pattern JSON instead of extracting `choices[0].message.content` from the OpenAI-style envelope — every real request failed with a parse error | Parse `ChatResponse` envelope, then extract the payload (`neural_prompter.rs`) |
| 2 | Fatal | `NeuralPrompter::new()` builds a `reqwest::blocking::Client` on the tokio runtime thread — `generative_evolution_viz` panicked at startup (`Cannot drop a runtime...`) | Wrap construction and batch generation in `tokio::task::block_in_place` (`generative_evolution_viz.rs`) |
| 3 | High | `generate_patterns` aborted the whole 16-pattern batch on any single failure (`?` in loop) | Skip-and-log individual failures; error only if all fail. Verified live: 2 timeouts + 1 JSON error absorbed without losing the batch |
| 4 | High | Rationale discarded — `metadata.rationale` hardcoded to `""`, so the roadmap's "rationale extraction" had no data | Rationale parsed from the LLM's JSON response and carried through `NeuralPattern.rationale`; `tokens_used` and `finish_reason` now real too |
| 5 | Medium | Default 30s timeout too tight: measured latency is 11–45s per pattern, live batch lost 2/16 to timeouts | Default timeout raised to 120s |
| 6 | Medium | Partial materialization misaligned injection: `inject_neural_seeds` got mismatched lengths (returned 0) while `sandbox_variants` was replaced anyway | Truncate targets to the number of successfully materialized circuits |
| 7 | Medium | "Worst sandbox" selection was actually "first 16 indices except best" — `TournamentManager` fitness records were never updated, so `get_worst_sandboxes()` couldn't work | Sync per-generation fitness into `TournamentManager`; select via `get_worst_sandboxes()` |
| 8 | Low | `warp::path("")` panic killed the WebSocket streaming task at startup | `warp::path::end()` (`evolution_stream.rs`) |
| 9 | Low | Pre-existing test-compile errors in `circuit_executor.rs` / `evolution_stream.rs` blocked the entire lib test suite | Updated stale test code to the current `CellState` API |
| 10 | Medium | Final statistics panicked (`unwrap()` on `None`) after a full run: the outer `fitness_scores` vec was shadowed by a fresh one inside the generation loop, so it was empty at the end | Inner loop now reuses (clears) the outer vec; verified with a short full run |

## Test inventory (all passing)

- **Stagnation detection** (`tournament_manager.rs`, 12 tests): flat/slow-growth plateaus trigger; steady improvement, short history, empty history, exact-threshold do not; zero-baseline safe; worst-sandbox ordering; injection bookkeeping. One test documents that a sharp fitness *decline* is treated as non-stagnant (`|improvement|` is used) — flagged as a design question, not silently changed.
- **Robustness** (`neural_prompter.rs`, 13 tests): mock HTTP server exercises the real client path — envelope parsing with markdown fences, non-JSON content rejected, missing `cells` field rejected, out-of-bounds cells rejected, connection-refused returns a graceful error, partial batch failure tolerated. Plus 4 payload-extraction tests (bare / fenced / fenced-no-language / commentary-wrapped JSON).
- **Materializer** (`pattern_materializer.rs`, 9 pre-existing tests): bounds, duplicates, unknown opcodes, missing data values.

## Measurements (live Ollama, qwen2.5-coder:14b)

**Standalone e2e (`cargo run --example neural_e2e`, 10 attempts):**

| Metric | Value |
|--------|-------|
| Generation success | 10/10 (100%) |
| Materialization success | 10/10 (100%) |
| Latency min / median / mean / max | 11.5s / 18.9s / 21.5s / 44.2s |
| Tokens per response | 1,247–2,491 |
| Materialization time | 45–130µs (negligible) |
| Pattern sizes | 10–49 cells on a 32×32 grid |

**Live evolution loop (`generative_evolution_viz`, 256 sandboxes, 10 generations):**

| Metric | Value |
|--------|-------|
| Generation time without injection | 152–160ms |
| Generation time with injection (gen 7) | 252.2s |
| Injection batch outcomes (gens 7–10) | 14/16, 14/16, 13/16, 12/16 — 53/64 (83%) under the old 30s timeout; failures were timeouts plus occasional invalid JSON from the model, all skipped gracefully |
| Plateau detection | Triggered at every eligible generation (7–10) as designed (>5 gens, <5% improvement over 3) |
| Injected patterns reaching apex fitness | Yes — gens 8 and 9 had best circuit in a just-injected sandbox, tying (not beating) the incumbent 20000004.00 |

Note: best fitness was exactly 20000004.00 in every generation across many different circuits — the fitness metric saturates at a cap, which is why "improves fitness over baseline" cannot be concluded from this run.

`MAX_GENERATIONS=n` env var added to `generative_evolution_viz` for short verification runs (default 10).

The roadmap's estimates (2–5s per pattern, 30–80s per 16-pattern injection) were optimistic by roughly 5×, even at 100% GPU. A stagnation event costs ~4–5 minutes of wall time with serial requests.

## Known gaps / follow-ups

1. **Fitness improvement unproven** — the roadmap test "neural patterns improve fitness over baseline" remains unchecked. In the observed run the incumbent best (fitness 2.0e7) was not beaten by injected patterns. Needs a controlled A/B experiment (fixed seed, injection on/off).
2. **Pareto frontier does not prune** — every circuit is non-dominated under the current metric spread, so all 256 circuits are persisted every generation (5,000+ files in `evolution_palace/` per run) and the dominance check is O(frontier) and growing.
3. **Serial injection batch** — 16 sequential Ollama calls; batching or concurrent requests would cut the ~4min stagnation penalty substantially.
4. **Stagnation semantics** — a sharp fitness decline reads as "not stagnant" because the improvement delta is taken as absolute value. Possibly intended, worth a decision.
