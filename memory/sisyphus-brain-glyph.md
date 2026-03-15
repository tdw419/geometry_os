---
name: sisyphus-brain-glyph
description: Glyph-native Sisyphus Brain for GPU substrate cognition
type: project
---

# Sisyphus Brain Glyph

**Status:** Active Development

**What:** A glyph program that lives on the GPU substrate and performs cognitive loops:
1. PERCEIVE - Scan memory for entropy patterns
2. THINK - Query LM Studio for guidance
3. ACT - Execute commands from LM Studio

**Memory Map:**
- `0x0300-0x03FF`: Cognitive State
- `0x0300`: current_intent (32b)
- `0x0304`: thought_cycle_count (32b)
- `0x0308`: last_action (32b)
- `0x030C`: fitness_score (float bits)
- `0x0400-0x04FF`: Perception Buffer
- `0x0400`: entropy_sum (32b)
- `0x0404`: hot_addr (32b)
- `0x0408`: scan_cursor (32b)
- `0x0500-0x0FFF`: HTTP Request Buffer (3KB)
- `0x1000-0x1FFF`: HTTP Response Buffer (4KB)
- `0x2000`: CTRL_SEMAPHORE (1 = request pending)
- `0x2004`: RESPONSE_READY (1 = response available)
- `0x2008`: REQUEST_LENGTH (bytes)
- `0x8000-0xFFFF`: Self-Analysis Region

**API Endpoints:**
- `GET /brain/health` - Check LM Studio connection
- `GET /brain/state` - Read cognitive state (entropy and cycles)
- `POST /brain/inject` - Write intent to glyph memory (0x0300)

**How to use:**
1. Start LM Studio on port 1234
2. Run `cargo run --release --bin gpu_dev_daemon`
3. Load glyph: `curl -X POST http://127.0.0.1:8769/load -d "sisyphus_brain.rts.png"`
4. Monitor: `curl http://127.0.0.1:8769/brain/state`

**Why:** Enables self-aware GPU programs that can reason about their own state
and receive guidance from external LLMs without leaving the substrate.

**Related Files:**
- `systems/infinite_map_rs/src/brain_bridge.rs` - Rust MMIO bridge
- `systems/infinite_map_rs/src/bin/gpu_dev_daemon.rs` - Host daemon integration
- `systems/glyph_stratum/programs/sisyphus_brain.glyph` - Cognitive agent
- `systems/glyph_stratum/programs/test_sisyphus_brain.py` - Integration tests
