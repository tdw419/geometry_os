# Proposal: Foundry Daemon (LM Studio Bridge)

## Problem
Currently, creating "Hybrid DNA Bricks" requires manual Python coding and running the `pixel_encoder.py`. To achieve true "Geometry OS" status, the system should be able to self-construct based on high-level natural language intents.

## Solution
Implement the **Foundry Daemon**, a background process that:
1.  Watches a `foundry/intents/` directory for `.md` files.
2.  Connects to **LM Studio** (local LLM API) to generate implementation code.
3.  Uses the **Geometry OS Framework** (specifically `RtsAsset` and `HybridDNA`) to compile code into `.rts.png` bricks.
4.  Injects these bricks into the `systems/builder/queue` for immediate instantiation.

## Architecture
- **Daemon Type**: `BaseDaemon` (from new framework)
- **AI Provider**: LM Studio (OpenAI-compatible API at `localhost:1234`)
- **Context Awareness**: Initially simple prompt injection, evolving to RAG.

## Impact
- **Workflow**: "Write English -> Get Running 3D Software"
- **Velocity**: Rapid prototyping of visual tools.
- **Autonomy**: High. The system begins to build itself.

## Risks
- **Hallucinations**: LLM might generate invalid Python API calls.
  - *Mitigation*: Sandboxed "Dry Run" execution before brick creation.
- **Looping**: Auto-generated agents creating infinite bricks.
  - *Mitigation*: Depth limits and manual approval for now.

## Validation
- **Simple Test**: Create `hello_world.intent` -> Verify `hello_world.rts.png` appears and prints output.
