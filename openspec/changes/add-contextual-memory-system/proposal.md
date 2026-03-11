# OpenSpec Proposal: Add Contextual Memory System

## Change ID: `add-contextual-memory-system`

**Status**: Proposed  
**Phase**: Phase 25 Week 3  
**Created**: January 21, 2026  
**Estimated Completion**: February 10, 2026

---

## Motivation

### Problem Statement

Geometry OS Week 2 delivered a complete proactive assistance system that can:
- Predict user goals (GoalInferenceEngine)
- Generate suggestions (ProactiveAssistant)
- Validate safety (SafetyValidator)
- Execute actions (ExecutionEngine)
- Track feedback (UserApprovalSystem)

**However**, the system lacks **long-term memory** and **pattern recognition** capabilities. Each session starts fresh, with no retention of:
- User preferences
- Workflow patterns
- Historical acceptance rates
- Personalized suggestion strategies

### Why This Matters

1. **Personalization**: Users have unique workflows. What works for one developer may not work for another.
2. **Efficiency**: Repeatedly suggesting the same actions wastes user attention.
3. **Adaptation**: The system should learn and improve over time.
4. **Context Awareness**: Current state should inform future suggestions.

### Proposed Solution

Implement a **ContextualMemory System** that:
- Stores patterns in SQLite database
- Uses 64-dimensional context vectors for pattern matching
- Learns from user feedback (acceptance/rejection)
- Personalizes suggestions based on historical data
- Visualizes memory patterns as neural connection graphs

---

## Technical Approach

### Why SQLite?

**Advantages**:
- Embedded database (no separate server)
- ACID compliant (data integrity)
- Fast queries (<2ms retrieval target)
- Easy backup and migration
- Mature, battle-tested

**Schema Design**:
```sql
-- Pattern storage
CREATE TABLE patterns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    context_vector BLOB NOT NULL,  -- 64-dimensional vector (256 bytes)
    goal_type TEXT NOT NULL,
    suggestion_type TEXT NOT NULL,
    acceptance_count INTEGER DEFAULT 0,
    rejection_count INTEGER DEFAULT 0,
    last_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User feedback
CREATE TABLE feedback (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pattern_id INTEGER,
    suggestion_id TEXT,
    action TEXT NOT NULL,  -- 'approved', 'rejected', 'dismissed'
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pattern_id) REFERENCES patterns(id)
);

-- Session context
CREATE TABLE sessions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    start_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_time TIMESTAMP,
    total_suggestions INTEGER DEFAULT 0,
    acceptance_rate REAL DEFAULT 0.0
);
```

### Why 64-Dimensional Context Vectors?

**Rationale**:
- Sufficient dimensionality to capture complex patterns
- Manageable memory footprint (256 bytes per vector)
- Fast cosine similarity computation
- Compatible with neural network embeddings (future expansion)

**Vector Components** (64 dimensions):
1-8: Goal inference scores (8 goal types)
9-16: Time features (hour, day of week, etc.)
17-24: File type distribution
25-32: Command frequency features
33-40: Error detection features
41-48: Neural activity patterns (from PredictiveCortex)
49-56: User intent features (from TheoryOfMindEngine)
57-64: Velocity/frequency features

### Why Cosine Similarity?

**Advantages**:
- Scale-invariant (magnitude doesn't matter)
- Fast computation (dot product)
- Well-suited for high-dimensional vectors
- Standard in recommendation systems

**Matching Algorithm**:
```python
def find_similar_patterns(context_vector, threshold=0.85):
    """
    Find patterns with cosine similarity > threshold
    Returns: List of (pattern_id, similarity_score)
    """
    # Query all patterns
    patterns = db.query("SELECT id, context_vector FROM patterns")

    # Compute cosine similarity
    similarities = []
    for pattern in patterns:
        similarity = cosine_similarity(context_vector, pattern.context_vector)
        if similarity >= threshold:
            similarities.append((pattern.id, similarity))

    # Sort by similarity (descending)
    return sorted(similarities, key=lambda x: x[1], reverse=True)
```

---

## Integration Points

### 1. Consciousness Stack Integration

**TheoryOfMindEngine**:
- Extract user intent features (EXPLORATION, FOCUS, CREATION, etc.)
- Use attention_focus and engagement_level in context vectors
- Enable metacognitive overrides for suggestions

**PredictiveCortex**:
- Extract neural activity patterns
- Use neural state for context
- Improve suggestion relevance

**ConsciousnessDaemon**:
- Enable metacognitive awareness of suggestion patterns
- Allow system to reflect on its own suggestion behavior
- Provide introspection into memory patterns

**EvolutionDaemonV8**:
- Use safety validator to gate evolutionary mutations
- Learn from user feedback to improve suggestion strategies
- Enable A/B testing of different approaches

### 2. Infinite Desktop Integration

**WebSocket Message Types**:
```typescript
// Server → Client
interface SuggestionMessage {
    type: 'SUGGESTION';
    id: string;
    suggestion: {
        type: 'file_prefetch' | 'command' | 'documentation' | 'error_prevention' | 'workflow';
        action: string;
        safety_level: 'SAFE' | 'REQUIRES_APPROVAL' | 'FORBIDDEN';
        confidence: number;
        evidence: string[];
    };
}

interface SuggestionExecutedMessage {
    type: 'SUGGESTION_EXECUTED';
    id: string;
    result: {
        success: boolean;
        output?: string;
        error?: string;
    };
}

// Client → Server
interface ApproveSuggestionMessage {
    type: 'APPROVE_SUGGESTION';
    id: string;
}

interface RejectSuggestionMessage {
    type: 'REJECT_SUGGESTION';
    id: string;
}

interface DismissSuggestionMessage {
    type: 'DISMISS_SUGGESTION';
    id: string;
}
```

**Suggestion Panel UI**:
- Floating glass panel with neon accents
- Color-coded safety badges (green/yellow/red)
- Fade-in animation from bottom-right
- Approve/Dismiss buttons
- Confidence percentage with visual gauge
- Evidence list with bullet points

### 3. PixelRTS v2 Integration

**Texture Rendering**:
- Render suggestion panels to GPU texture
- Enable 3D workspace visualization
- Display memory patterns as neural connection graphs
- Real-time updates without UI redraw

---

## Success Criteria

### Functional Requirements

- [ ] ContextualMemory class with SQLite backend
- [ ] 64-dimensional context vector generation
- [ ] Cosine similarity pattern matching
- [ ] FeedbackLearner with acceptance tracking
- [ ] Pattern refinement based on feedback
- [ ] Personalization engine
- [ ] A/B testing framework

### Performance Requirements

- [ ] Memory retrieval <2ms (target)
- [ ] Pattern matching <5ms (target)
- [ ] Total system overhead <20ms (target)
- [ ] Database size <100MB (after 1000 sessions)

### Quality Requirements

- [ ] Test coverage >85%
- [ ] All safety validations 100% accurate
- [ ] No data loss (ACID compliance)
- [ ] Graceful degradation if database unavailable

### Integration Requirements

- [ ] TheoryOfMindEngine integration complete
- [ ] PredictiveCortex integration complete
- [ ] ConsciousnessDaemon integration complete
- [ ] EvolutionDaemonV8 integration complete
- [ ] Infinite Desktop WebSocket integration complete
- [ ] PixelRTS v2 texture rendering complete

---

## Implementation Plan

### Week 1: Core Memory System (January 28 - February 3)

**Tasks**:
1. Create SQLite database schema
2. Implement ContextualMemory class
3. Implement 64-dimensional context vector generation
4. Implement cosine similarity matching
5. Add temporal decay function (old patterns fade)
6. Write unit tests (>85% coverage)
7. Create visual demo of pattern matching

### Week 2: Learning & Integration (February 4 - February 10)

**Tasks**:
1. Implement FeedbackLearner class
2. Add acceptance tracking
3. Implement pattern refinement
4. Add personalization engine
5. Implement A/B testing framework
6. Integrate with Consciousness Stack
7. Integrate with Infinite Desktop (WebSocket)
8. Integrate with PixelRTS v2 (texture rendering)
9. Write integration tests
10. Create end-to-end demo

---

## Visual Impact

### Memory Visualization

**Neural Connection Graphs**:
- Render patterns as nodes in a graph
- Edge thickness = similarity strength
- Node size = acceptance rate
- Color = goal type (8 distinct colors)
- Interactive: hover to see pattern details

**Example Visualization**:
```
         Feature Development (86%)
                /      \
           [0.92]    [0.87]
              /          \
    Testing (75%)      Debugging (68%)
         |                  |
      [0.85]             [0.79]
         |                  |
    Documentation       Exploration
      (62%)              (55%)
```

### Suggestion Panel UI

**Glassmorphic Design**:
- Semi-transparent background (rgba(0, 0, 0, 0.7))
- Blur effect (backdrop-filter: blur(10px))
- Neon accent borders (cyan, magenta)
- Smooth animations (0.3s ease-in-out)
- Hover effects on buttons

**Color-Coded Safety Badges**:
- 🟢 Green: SAFE (auto-execute)
- 🟡 Yellow: REQUIRES_APPROVAL (ask user)
- 🔴 Red: FORBIDDEN (blocked)

---

## Risks & Mitigations

### Risk 1: Database Performance Degradation

**Mitigation**:
- Index frequently queried columns
- Implement query optimization
- Add database maintenance tasks (vacuum, analyze)
- Monitor query performance

### Risk 2: Privacy Concerns

**Mitigation**:
- Store only anonymized patterns (no file paths, no commands)
- Provide data export functionality
- Implement data deletion on request
- Document data retention policy

### Risk 3: Overfitting to User Patterns

**Mitigation**:
- Implement temporal decay (old patterns fade)
- Add exploration (occasionally suggest novel actions)
- Use A/B testing to validate improvements
- Provide reset functionality

### Risk 4: Integration Complexity

**Mitigation**:
- Modular design (each component independent)
- Clear interface contracts
- Integration tests for each connection
- Incremental rollout (test each integration separately)

---

## Open Questions

1. **Data Retention**: How long should patterns be retained? (Proposed: 90 days with decay)
2. **Pattern Size Limit**: Maximum number of patterns to store? (Proposed: 10,000)
3. **Similarity Threshold**: Minimum similarity for matching? (Proposed: 0.85)
4. **A/B Testing**: How to handle conflicting strategies? (Proposed: Majority vote with confidence weighting)
5. **Privacy**: Should users be able to opt out of memory? (Proposed: Yes, with clear UI)

---

## Dependencies

### Required
- SQLite3 (Python built-in)
- NumPy (for vector operations)
- Existing components: GoalInferenceEngine, ProactiveAssistant

### Optional
- TheoryOfMindEngine (for user intent features)
- PredictiveCortex (for neural activity features)
- ConsciousnessDaemon (for metacognitive awareness)
- EvolutionDaemonV8 (for A/B testing)

---

## Timeline

**Duration**: 2 weeks (January 28 - February 10, 2026)

**Milestones**:
- Week 1: Core memory system complete
- Week 2: Learning & integration complete

**Confidence**: 0.95 (Very High)

---

## Sign-Off

**Proposed by**: Kilo Code  
**Phase**: Phase 25 Week 3  
**Status**: Ready for implementation

---

*This proposal follows the Spec-First Development principle and maintains Glass Box AI transparency.*
