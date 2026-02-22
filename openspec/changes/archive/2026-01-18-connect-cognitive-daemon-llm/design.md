# Design: Real-Time Cognitive LLM Bridge

## Visual/Geometric Impact
- **PAS Score**: Neutral (Functional change, not structural).
- **Latency**: The `UnifiedCognitiveDaemon` is threaded; it will not block the Compositor's rendering. However, "Thought Bubbles" in the UI will appear more slowly (human-speed vs computer-speed).
- **Thought Geometry**: The `complexity` and `confidence` metrics sent to the shader will now fluctuate organically based on token probabilities, creating less predictable (more "alive") visual feedback.

## Architecture

### 1. The Connector (`LLMClient`)
We reuse the existing `systems.vectorland.llm.client.LMStudioProvider`.

### 2. Integration Points

#### A. Theory Of Mind (Fast Path)
We need a standardized prompt that takes `sensory_input` and returns JSON.

**Prompt Template:**
```text
SYSTEM: You are the Theory of Mind engine for Geometry OS. Analyze the user's behavior.
INPUT: {user_goal}, Velocity: {velocity}
OUTPUT JSON: {
  "dominant_intent": "exploration" | "focus" | "creation",
  "confidence": 0.0-1.0,
  "alignment": 0.0-1.0
}
```

#### B. RLM Reasoning (Slow Path)
The RLM needs to generate Python code to "think".

**Prompt Template:**
```text
SYSTEM: You are the Recursive Language Model. Write Python code to decide how to handle the user's request: "{goal}".
CONTEXT: Intent={intent}, Safety={safety}
OUTPUT: Python code block only.
```

## Failure Handling
- If LM Studio is offline, fall back to the existing mock logic (Graceful Degradation).
