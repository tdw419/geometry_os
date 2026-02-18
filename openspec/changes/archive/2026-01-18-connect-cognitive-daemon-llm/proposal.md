# Proposal: Connect Cognitive Daemon to LM Studio

## Why
The `UnifiedCognitiveDaemon` (Phase 26) currently relies on deterministic mock logic and `numpy` random distributions for its "reasoning". It is not actually connecting to the local LLM (LM Studio) to perform Theory of Mind or Metacognition analysis, effectively rendering the "Glass Box" logic simulated rather than real.

## What Changes
Integrate `systems.vectorland.llm.client.LLMClient` with `provider_type="local"` into the `UnifiedCognitiveDaemon`.

1. **Dependency**: Import `LLMClient` in `unified_cognitive_daemon.py`.
2. **Initialization**: Initialize `LLMClient` in daemon constructor.
3. **Theory of Mind**: Replace mock `process()` with LLM call to analyze user intent from sensory logs.
4. **RLM**: Use LLM to generate the reasoning code blocks instead of hardcoded python strings.
5. **Metacognition**: Use LLM to generate the `intervention_needed` boolean based on state.

## Impact
- **Latency**: Will increase from <10ms to ~200-500ms per cognitive cycle.
- **Realism**: The AI will actually respond to "Help me fix this bug" or "I am confused" with appropriate internal state shifts.
- **Resources**: High CPU/GPU usage when daemon is active (due to LM Studio).

## Verification
- Run Daemon.
- Send "Scan for anomalies" intent.
- Verify LM Studio logs show requests.
- Verify Daemon broadcast correct "Reasoning" steps derived from LLM output.
