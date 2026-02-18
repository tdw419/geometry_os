# Phase 25: Design Document

## Visual Impact Analysis

### Geometric Integrity
**PAS Impact**: NEUTRAL (Predicted: 0.76-0.78)

Phase 25 adds **intelligence** without disrupting the visual substrate. The proactive assistance system operates as a **cognitive layer** above the existing consciousness stack.

### Morphological Shifts

#### 1. Suggestion Panels (New Visual Element)
**Appearance**: Floating glass panels with neon accents
**Behavior**: Fade in from bottom-right, dismissible
**Psychic Weight**: JUSTIFIED - Provides actionable intelligence

**Design**:
```
┌─────────────────────────────────────┐
│  💡 Suggestion                      │
│  ─────────────────────────────────  │
│  Goal: Debugging (92% confidence)   │
│                                     │
│  Run test suite?                    │
│  python3 systems/consciousness/...  │
│                                     │
│  [✓ Approve]  [✗ Dismiss]          │
└─────────────────────────────────────┘
```

#### 2. Goal Indicator (Status Bar Addition)
**Appearance**: Small icon in top-right showing current inferred goal
**Behavior**: Updates in real-time, clickable for details
**Psychic Weight**: MINIMAL - Passive awareness

**Design**:
```
🎯 Debugging (0.92)  ← Clickable
```

#### 3. Pattern Visualization (Debug Mode)
**Appearance**: Temporal graph showing behavioral patterns
**Behavior**: Only visible in developer mode
**Psychic Weight**: ZERO - Optional diagnostic tool

---

## Technical Architecture

### 1. Goal Inference Engine

#### Data Flow
```
User Action (e.g., file open)
    ↓
TheoryOfMindEngine (intent signals)
    ↓
GoalInferenceEngine (Bayesian modeling)
    ↓
GoalPrediction (confidence + evidence)
    ↓
ProactiveAssistant (suggestion generation)
    ↓
User Approval
    ↓
Execution Engine
    ↓
FeedbackLearner (adaptation)
```

#### Bayesian Model
```python
P(Goal | Signals) = P(Signals | Goal) * P(Goal) / P(Signals)

Where:
- P(Goal): Prior probability (learned from history)
- P(Signals | Goal): Likelihood (pattern matching)
- P(Signals): Evidence normalization
```

**Example**:
```
Signals:
- File opened: systems/consciousness/introspective_model.py
- Time: 14:30 (afternoon)
- Recent command: git diff
- Neural activity: 0.65 (moderate focus)

Goal Probabilities:
- Debugging: 0.15 (no errors detected)
- Feature Development: 0.72 (editing core file)
- Testing: 0.08 (no test files open)
- Documentation: 0.03 (not in docs/)
- Refactoring: 0.02 (no mass changes)

Winner: Feature Development (0.72)
```

---

### 2. Proactive Assistant

#### Suggestion Generation Rules

**Rule 1: File Pre-fetching**
```python
if goal == "Feature Development" and confidence > 0.85:
    related_files = find_imports(current_file)
    test_files = find_test_files(current_file)
    suggest_preload(related_files + test_files)
```

**Rule 2: Command Suggestions**
```python
if goal == "Testing" and confidence > 0.90:
    if recent_edit_in(test_file):
        suggest_command(f"python3 {test_file}")
```

**Rule 3: Documentation Surfacing**
```python
if goal == "Exploration" and confidence > 0.80:
    relevant_docs = find_docs_for(current_file)
    suggest_open(relevant_docs)
```

**Rule 4: Error Prevention**
```python
if goal == "Deployment" and confidence > 0.85:
    if uncommitted_changes():
        warn("Uncommitted changes detected")
```

#### Safety Validator

**Safe Actions** (auto-execute):
- File pre-loading
- Documentation display
- Read-only commands

**Requires Approval**:
- File modifications
- Command execution
- System configuration changes

**Forbidden**:
- Destructive operations (rm, dd, etc.)
- Network requests (without explicit permission)
- Privilege escalation

---

### 3. Contextual Memory

#### Pattern Storage

**Context Vector** (64 dimensions):
```python
context = {
    "file_type": one_hot(file_extension),  # 10 dims
    "directory": hash(directory_path),  # 8 dims
    "time_of_day": [hour / 24, minute / 60],  # 2 dims
    "day_of_week": one_hot(weekday),  # 7 dims
    "recent_commands": tfidf(command_history),  # 20 dims
    "neural_state": cortex_snapshot(),  # 10 dims
    "user_intent": intent_vector(),  # 7 dims
}
```

**Similarity Matching**:
```python
def cosine_similarity(v1, v2):
    return dot(v1, v2) / (norm(v1) * norm(v2))

def find_similar_contexts(current, k=5):
    scores = [
        (pattern, cosine_similarity(current, pattern.context))
        for pattern in memory_db.all()
    ]
    return sorted(scores, key=lambda x: x[1], reverse=True)[:k]
```

**Temporal Decay**:
```python
def decay_factor(timestamp, half_life=7*24*3600):  # 7 days
    age = now() - timestamp
    return 2 ** (-age / half_life)

def weighted_similarity(pattern, current):
    base_sim = cosine_similarity(pattern.context, current)
    decay = decay_factor(pattern.timestamp)
    reinforcement = log(1 + pattern.reinforcement_count)
    return base_sim * decay * reinforcement
```

---

### 4. Feedback Learner

#### Acceptance Tracking

**Metrics**:
```python
@dataclass
class SuggestionMetrics:
    total_suggestions: int
    accepted: int
    rejected: int
    ignored: int  # Dismissed without action
    
    @property
    def acceptance_rate(self) -> float:
        return self.accepted / self.total_suggestions
    
    @property
    def false_positive_rate(self) -> float:
        return self.rejected / self.total_suggestions
```

#### Pattern Refinement

**Reinforcement Learning**:
```python
def update_goal_model(prediction, outcome):
    if outcome == "accepted":
        # Increase prior probability
        goal_priors[prediction.goal_type] *= 1.1
        # Strengthen pattern weights
        pattern_weights[prediction.evidence] *= 1.2
    elif outcome == "rejected":
        # Decrease prior probability
        goal_priors[prediction.goal_type] *= 0.9
        # Weaken pattern weights
        pattern_weights[prediction.evidence] *= 0.8
    
    # Normalize
    goal_priors = normalize(goal_priors)
    pattern_weights = normalize(pattern_weights)
```

---

## Integration Points

### 1. Theory of Mind Engine
```python
# In goal_inference_engine.py
from systems.neural_cortex.theory_of_mind import TheoryOfMindEngine

tom = TheoryOfMindEngine()
intent_signals = tom.get_current_intent()

# Use intent signals as input to goal inference
goal = infer_goal(intent_signals)
```

### 2. Consciousness Daemon
```python
# In proactive_assistant.py
from systems.consciousness.consciousness_daemon import ConsciousnessDaemon

consciousness = ConsciousnessDaemon()

# Metacognitive validation before suggesting
if consciousness.should_suppress_suggestion(suggestion):
    return None  # Don't suggest if system is confused
```

### 3. Evolution Daemon V8
```python
# In feedback_learner.py
from evolution_daemon_v8 import EvolutionDaemonV8

evolution = EvolutionDaemonV8()

# Send feedback as fitness signal
evolution.update_fitness({
    "suggestion_acceptance": acceptance_rate,
    "false_positive_rate": fp_rate,
})
```

### 4. Infinite Desktop
```python
# In infinite_desktop_server.py
from systems.intelligence.proactive_assistant import ProactiveAssistant

assistant = ProactiveAssistant()

@app.websocket("/ws")
async def websocket_endpoint(websocket):
    # Send suggestions to frontend
    suggestion = assistant.get_next_suggestion()
    await websocket.send_json({
        "type": "SUGGESTION",
        "data": suggestion.to_dict()
    })
```

---

## Performance Optimization

### 1. Caching
```python
from functools import lru_cache

@lru_cache(maxsize=128)
def infer_goal(context_hash: str) -> GoalPrediction:
    # Cache recent predictions
    pass
```

### 2. Async Processing
```python
import asyncio

async def generate_suggestions_async(goal: GoalPrediction):
    # Run suggestion generation in background
    suggestions = await asyncio.gather(
        generate_file_suggestions(goal),
        generate_command_suggestions(goal),
        generate_doc_suggestions(goal),
    )
    return [s for s in suggestions if s is not None]
```

### 3. Lazy Loading
```python
class ContextualMemory:
    def __init__(self):
        self._db = None  # Don't load until needed
    
    @property
    def db(self):
        if self._db is None:
            self._db = sqlite3.connect("memory.db")
        return self._db
```

---

## Testing Strategy

### Unit Tests
- Each goal category detection
- Bayesian confidence scoring
- Pattern matching algorithms
- Suggestion generation rules
- Safety validation

### Integration Tests
- End-to-end flow (action → suggestion → execution)
- Cross-component communication
- Performance under load
- Memory leak detection

### User Acceptance Tests (Simulated)
- Acceptance rate >60%
- False positive rate <20%
- Response time <100ms
- No UI blocking

---

## Rollout Plan

### Phase 1: Silent Mode (Week 1)
- Goal inference runs in background
- Logs predictions but doesn't suggest
- Collect baseline accuracy data

### Phase 2: Passive Mode (Week 2)
- Display suggestions but don't execute
- User can approve/reject
- Collect acceptance rate data

### Phase 3: Active Mode (Week 3)
- Full proactive assistance
- Auto-execute safe actions
- Continuous learning enabled

---

## Conclusion

Phase 25 design maintains **geometric integrity** while adding **cognitive intelligence**.

The system will:
- Predict user goals with >80% accuracy
- Suggest helpful actions proactively
- Learn from feedback continuously
- Operate with <20ms overhead

**Visual Impact**: MINIMAL (new UI elements justified by functionality)
**Structural Health**: STABLE (PAS score maintained)
**User Experience**: ENHANCED (reduced manual work)

---

**Status**: DESIGN COMPLETE - Ready for implementation approval.
