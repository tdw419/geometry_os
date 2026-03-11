# Proposal: Recursive Foundry Context (RLM Integration)

## Summary
Integrate "Recursive Language Models" (arXiv:2512.24601) into the Foundry Daemon to enable inference-time scaling for massive contexts (Infinite Map, full codebase analysis).

## Rationale
Currently, the Foundry Daemon is limited by the context window of the underlying LLM. The "Infinite Map" and the growing codebase exceed these limits. By treating context as an external environment that can be recursively polled/read, we can achieve "infinite" context handling capabilities.

## Technical Approach
1.  **RecursiveCognitionEngine**: A new module in `systems/foundry` that implements the split-and-conquer logic.
2.  **Context Decomposition**: Logic to break large assets (text files, map sectors) into hierarchical chunks.
3.  **Recursive Agents**: Sub-agents that process chunks and report back to the parent node.

## Impact
- **Infinite Map**: Agents can plan cities at a macro level and recursively detail them at a micro level.
- **Codebase Analysis**: Agents can "read" the entire OS source code to answer complex architectural queries.

## Risk Assessment
- **Looping**: Infinite recursion risks (mitigated by `max_depth` and loop detection).
- **Latency**: Recursive calls increase total inference time (this is the RLM trade-off: Compute for Context).
