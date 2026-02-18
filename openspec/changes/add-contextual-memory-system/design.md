# Design Document: Contextual Memory System

**Change ID**: `add-contextual-memory-system`  
**Phase**: Phase 25 Week 3  
**Created**: January 21, 2026

---

## Overview

The Contextual Memory System enables Geometry OS to learn from user behavior and personalize proactive suggestions over time. This system builds on Week 1 (Goal Inference) and Week 2 (Proactive Assistance) to create a truly adaptive intelligent assistant.

---

## Architecture

### System Components

```
┌─────────────────────────────────────────────────────────────────┐
│                    Contextual Memory System                     │
└─────────────────────────────────────────────────────────────────┘
                              │
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
        ▼                     ▼                     ▼
┌───────────────┐    ┌───────────────┐    ┌───────────────┐
│ Contextual    │    │ Feedback      │    │ Pattern       │
│ Memory        │◄───┤ Learner       │◄───┤ Refiner       │
│ (Storage)     │    │ (Learning)    │    │ (Optimization)│
└───────────────┘    └───────────────┘    └───────────────┘
        │                     │                     │
        ▼                     ▼                     ▼
┌───────────────┐    ┌───────────────┐    ┌───────────────┐
│ Context       │    │ Personaliza-  │    │ A/B Testing   │
│ Vector        │    │ tion Engine   │    │ Framework     │
│ Generator     │    │ (User Prof.)  │    │ (Validation)  │
└───────────────┘    └───────────────┘    └───────────────┘
        │                     │                     │
        └─────────────────────┼─────────────────────┘
                              │
                              ▼
                    ┌───────────────┐
                    │ Pattern       │
                    │ Matcher       │
                    │ (Similarity)  │
                    └───────────────┘
                              │
                              ▼
                    ┌───────────────┐
                    │ Temporal      │
                    │ Decay         │
                    │ (Time)        │
                    └───────────────┘
```

### Data Flow

```
User Action → Signal Extraction → Context Vector Generation
                                            │
                                            ▼
                                    Pattern Matching
                                            │
                                            ▼
                                    Similar Patterns Found?
                                            │
                        ┌───────────────────┴───────────────────┐
                        │ YES                                    │ NO
                        ▼                                       ▼
                Retrieve Patterns                       Generate New Pattern
                        │                                       │
                        ▼                                       ▼
                Personalize Suggestions               Store New Pattern
                        │                                       │
                        ▼                                       ▼
                Generate Suggestions                      ────────┘
                        │
                        ▼
                User Feedback (Approve/Reject/Dismiss)
                        │
                        ▼
                Record Feedback
                        │
                        ▼
                Update Pattern Weights
                        │
                        ▼
                Refine Patterns
```

---

## Component Design

### 1. ContextualMemory (Storage Layer)

**Purpose**: Store and retrieve patterns using SQLite database.

**Key Methods**:
```python
class ContextualMemory:
    def __init__(self, db_path: str = "~/.geometry_os/contextual_memory.db")
    def store_pattern(self, pattern: Pattern) -> int
    def retrieve_patterns(self, context_vector: np.ndarray, 
                          threshold: float = 0.85, 
                          limit: int = 10) -> List[Pattern]
    def update_pattern(self, pattern_id: int, updates: Dict)
    def delete_pattern(self, pattern_id: int)
    def get_statistics(self) -> Dict
    def cleanup_old_patterns(self, days: int = 90)
    def export_data(self, path: str)
    def import_data(self, path: str)
```

**Database Schema**:
```sql
CREATE TABLE patterns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    context_vector BLOB NOT NULL,  -- 64-dimensional vector (256 bytes)
    goal_type TEXT NOT NULL,       -- DEBUGGING, FEATURE_DEVELOPMENT, etc.
    suggestion_type TEXT NOT NULL, -- file_prefetch, command, etc.
    acceptance_count INTEGER DEFAULT 0,
    rejection_count INTEGER DEFAULT 0,
    dismissal_count INTEGER DEFAULT 0,
    freshness_score REAL DEFAULT 1.0,
    last_seen TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(context_vector, goal_type, suggestion_type)
);

CREATE INDEX idx_context_vector ON patterns(context_vector);
CREATE INDEX idx_goal_type ON patterns(goal_type);
CREATE INDEX idx_suggestion_type ON patterns(suggestion_type);
CREATE INDEX idx_freshness ON patterns(freshness_score DESC);
```

---

### 2. ContextVectorGenerator (Feature Extraction)

**Purpose**: Generate 64-dimensional context vectors from behavioral signals.

**Vector Components**:
```python
@dataclass
class ContextVector:
    # Goal inference scores (dimensions 1-8)
    debugging_confidence: float      # dim 1
    feature_dev_confidence: float    # dim 2
    testing_confidence: float        # dim 3
    documentation_confidence: float  # dim 4
    exploration_confidence: float    # dim 5
    refactoring_confidence: float    # dim 6
    deployment_confidence: float     # dim 7
    maintenance_confidence: float     # dim 8
    
    # Time features (dimensions 9-16)
    hour_sin: float                  # dim 9 (hour of day, sine)
    hour_cos: float                  # dim 10 (hour of day, cosine)
    day_sin: float                   # dim 11 (day of week, sine)
    day_cos: float                   # dim 12 (day of week, cosine)
    is_weekend: float                # dim 13
    is_morning: float                # dim 14
    is_afternoon: float              # dim 15
    is_evening: float                # dim 16
    
    # File type distribution (dimensions 17-24)
    python_ratio: float              # dim 17
    rust_ratio: float                 # dim 18
    javascript_ratio: float          # dim 19
    markdown_ratio: float             # dim 20
    config_ratio: float               # dim 21
    test_ratio: float                 # dim 22
    doc_ratio: float                 # dim 23
    other_ratio: float               # dim 24
    
    # Command frequency (dimensions 25-32)
    git_frequency: float             # dim 25
    test_frequency: float            # dim 26
    build_frequency: float           # dim 27
    deploy_frequency: float          # dim 28
    debug_frequency: float           # dim 29
    search_frequency: float          # dim 30
    edit_frequency: float            # dim 31
    other_frequency: float           # dim 32
    
    # Error detection (dimensions 33-40)
    error_count: float               # dim 33
    warning_count: float             # dim 34
    syntax_error_ratio: float        # dim 35
    runtime_error_ratio: float       # dim 36
    test_failure_ratio: float        # dim 37
    build_error_ratio: float         # dim 38
    deployment_error_ratio: float    # dim 39
    other_error_ratio: float         # dim 40
    
    # Neural activity (dimensions 41-48)
    neural_activity_level: float     # dim 41 (from PredictiveCortex)
    attention_focus: float           # dim 42 (from TheoryOfMindEngine)
    engagement_level: float          # dim 43 (from TheoryOfMindEngine)
    cognitive_load: float            # dim 44 (from PredictiveCortex)
    prediction_confidence: float      # dim 45 (from PredictiveCortex)
    metacognitive_awareness: float   # dim 46 (from ConsciousnessDaemon)
    self_monitoring: float           # dim 47 (from ConsciousnessDaemon)
    reflection_depth: float          # dim 48 (from ConsciousnessDaemon)
    
    # User intent (dimensions 49-56)
    exploration_intent: float       # dim 49 (from TheoryOfMindEngine)
    focus_intent: float              # dim 50 (from TheoryOfMindEngine)
    creation_intent: float           # dim 51 (from TheoryOfMindEngine)
    analysis_intent: float           # dim 52 (from TheoryOfMindEngine)
    debugging_intent: float          # dim 53 (from TheoryOfMindEngine)
    testing_intent: float            # dim 54 (from TheoryOfMindEngine)
    deployment_intent: float         # dim 55 (from TheoryOfMindEngine)
    maintenance_intent: float        # dim 56 (from TheoryOfMindEngine)
    
    # Velocity/frequency (dimensions 57-64)
    typing_velocity: float           # dim 57
    command_velocity: float          # dim 58
    file_open_velocity: float        # dim 59
    overall_velocity: float          # dim 60
    typing_frequency: float          # dim 61
    command_frequency: float         # dim 62
    file_open_frequency: float       # dim 63
    overall_frequency: float         # dim 64
    
    def to_array(self) -> np.ndarray:
        """Convert to 64-dimensional numpy array"""
        return np.array([
            self.debugging_confidence,
            self.feature_dev_confidence,
            # ... (all 64 dimensions)
        ])
```

**Generation Pipeline**:
```python
def generate_context_vector(signals: SignalContext) -> np.ndarray:
    """Generate 64-dimensional context vector from behavioral signals"""
    vector = ContextVector()
    
    # Extract goal inference scores
    vector.debugging_confidence = extract_goal_confidence(signals, "DEBUGGING")
    vector.feature_dev_confidence = extract_goal_confidence(signals, "FEATURE_DEVELOPMENT")
    # ... (all 8 goal types)
    
    # Extract time features (cyclical encoding)
    vector.hour_sin = np.sin(2 * np.pi * signals.time_of_day / 24)
    vector.hour_cos = np.cos(2 * np.pi * signals.time_of_day / 24)
    # ... (all time features)
    
    # Extract file type distribution
    vector.python_ratio = calculate_file_type_ratio(signals, ".py")
    # ... (all file types)
    
    # Extract command frequency
    vector.git_frequency = calculate_command_frequency(signals, "git")
    # ... (all command types)
    
    # Extract error features
    vector.error_count = len(signals.recent_errors)
    # ... (all error features)
    
    # Extract neural activity (from PredictiveCortex)
    vector.neural_activity_level = signals.neural_activity
    # ... (all neural features)
    
    # Extract user intent (from TheoryOfMindEngine)
    if signals.user_intent:
        vector.exploration_intent = signals.user_intent.get("EXPLORATION", 0.0)
        # ... (all intent features)
    
    # Extract velocity/frequency
    vector.typing_velocity = calculate_typing_velocity(signals)
    # ... (all velocity features)
    
    return vector.to_array()
```

---

### 3. PatternMatcher (Similarity Search)

**Purpose**: Find similar patterns using cosine similarity.

**Algorithm**:
```python
def cosine_similarity(a: np.ndarray, b: np.ndarray) -> float:
    """Compute cosine similarity between two vectors"""
    dot_product = np.dot(a, b)
    norm_a = np.linalg.norm(a)
    norm_b = np.linalg.norm(b)
    return dot_product / (norm_a * norm_b)

class PatternMatcher:
    def __init__(self, memory: ContextualMemory):
        self.memory = memory
        self.cache = {}  # LRU cache for frequently accessed patterns
    
    def find_similar_patterns(self, 
                               context_vector: np.ndarray,
                               threshold: float = 0.85,
                               limit: int = 10) -> List[Tuple[int, float]]:
        """Find patterns with cosine similarity > threshold"""
        # Check cache first
        cache_key = hash(context_vector.tobytes())
        if cache_key in self.cache:
            return self.cache[cache_key]
        
        # Query all patterns
        patterns = self.memory.retrieve_all_patterns()
        
        # Compute cosine similarity
        similarities = []
        for pattern in patterns:
            similarity = cosine_similarity(context_vector, pattern.context_vector)
            if similarity >= threshold:
                similarities.append((pattern.id, similarity))
        
        # Sort by similarity (descending)
        similarities.sort(key=lambda x: x[1], reverse=True)
        
        # Limit results
        similarities = similarities[:limit]
        
        # Cache result
        self.cache[cache_key] = similarities
        
        return similarities
```

**Optimization Strategies**:
1. **Caching**: LRU cache for frequently accessed patterns
2. **Indexing**: B-tree indexes on context_vector
3. **Batch Processing**: Process multiple queries in batch
4. **Approximate Search**: Use locality-sensitive hashing (LSH) for large datasets

---

### 4. TemporalDecay (Time-Based Fading)

**Purpose**: Decay pattern weights over time to prioritize recent behavior.

**Decay Function**:
```python
def decay_factor(days_old: int, decay_rate: float = 0.01) -> float:
    """
    Compute decay factor based on age.
    
    Args:
        days_old: Age of pattern in days
        decay_rate: Decay rate per day (default: 0.01)
    
    Returns:
        Decay factor between 0.0 and 1.0
    """
    return np.exp(-decay_rate * days_old)

class TemporalDecay:
    def __init__(self, decay_rate: float = 0.01):
        self.decay_rate = decay_rate
    
    def apply_decay(self, pattern: Pattern) -> Pattern:
        """Apply temporal decay to pattern weights"""
        days_old = (datetime.now() - pattern.last_seen).days
        decay = decay_factor(days_old, self.decay_rate)
        pattern.freshness_score = decay
        return pattern
    
    def get_freshness_score(self, pattern: Pattern) -> float:
        """Get freshness score for pattern"""
        days_old = (datetime.now() - pattern.last_seen).days
        return decay_factor(days_old, self.decay_rate)
```

**Scheduled Decay**:
```python
def schedule_decay_task(memory: ContextualMemory, decay: TemporalDecay):
    """Schedule daily decay task"""
    while True:
        time.sleep(86400)  # 24 hours
        patterns = memory.retrieve_all_patterns()
        for pattern in patterns:
            pattern = decay.apply_decay(pattern)
            memory.update_pattern(pattern.id, {"freshness_score": pattern.freshness_score})
```

---

### 5. FeedbackLearner (Learning Engine)

**Purpose**: Learn from user feedback to improve suggestion quality.

**Feedback Types**:
```python
@dataclass
class Feedback:
    pattern_id: int
    suggestion_id: str
    action: str  # 'approved', 'rejected', 'dismissed'
    timestamp: datetime
    context_vector: np.ndarray

class FeedbackLearner:
    def __init__(self, memory: ContextualMemory):
        self.memory = memory
    
    def record_feedback(self, feedback: Feedback):
        """Record user feedback"""
        # Store feedback in database
        self.memory.store_feedback(feedback)
        
        # Update pattern weights
        pattern = self.memory.retrieve_pattern(feedback.pattern_id)
        if feedback.action == 'approved':
            pattern.acceptance_count += 1
            # Increase pattern weight (Bayesian update)
            pattern.weight *= 1.15  # +15%
        elif feedback.action == 'rejected':
            pattern.rejection_count += 1
            # Decrease pattern weight (Bayesian update)
            pattern.weight *= 0.85  # -15%
        elif feedback.action == 'dismissed':
            pattern.dismissal_count += 1
            # Slight decrease (neutral feedback)
            pattern.weight *= 0.95  # -5%
        
        self.memory.update_pattern(pattern.id, {
            'acceptance_count': pattern.acceptance_count,
            'rejection_count': pattern.rejection_count,
            'dismissal_count': pattern.dismissal_count,
            'weight': pattern.weight
        })
    
    def get_acceptance_rate(self, pattern_id: int) -> float:
        """Calculate acceptance rate for pattern"""
        pattern = self.memory.retrieve_pattern(pattern_id)
        total = pattern.acceptance_count + pattern.rejection_count + pattern.dismissal_count
        if total == 0:
            return 0.0
        return pattern.acceptance_count / total
```

---

### 6. PatternRefiner (Optimization)

**Purpose**: Refine patterns based on feedback to improve accuracy.

**Refinement Strategies**:
```python
class PatternRefiner:
    def __init__(self, memory: ContextualMemory):
        self.memory = memory
    
    def refine_patterns(self):
        """Refine all patterns based on feedback"""
        patterns = self.memory.retrieve_all_patterns()
        
        for pattern in patterns:
            # Merge similar patterns
            similar_patterns = self.find_similar_patterns(pattern, threshold=0.95)
            if len(similar_patterns) > 1:
                self.merge_patterns(similar_patterns)
            
            # Split divergent patterns
            if self.is_divergent(pattern):
                self.split_pattern(pattern)
            
            # Remove outlier patterns
            if self.is_outlier(pattern):
                self.memory.delete_pattern(pattern.id)
    
    def merge_patterns(self, patterns: List[Pattern]):
        """Merge similar patterns into one"""
        # Average context vectors
        avg_vector = np.mean([p.context_vector for p in patterns], axis=0)
        
        # Sum acceptance/rejection counts
        total_acceptance = sum(p.acceptance_count for p in patterns)
        total_rejection = sum(p.rejection_count for p in patterns)
        total_dismissal = sum(p.dismissal_count for p in patterns)
        
        # Create merged pattern
        merged_pattern = Pattern(
            context_vector=avg_vector,
            goal_type=patterns[0].goal_type,
            suggestion_type=patterns[0].suggestion_type,
            acceptance_count=total_acceptance,
            rejection_count=total_rejection,
            dismissal_count=total_dismissal
        )
        
        # Store merged pattern
        merged_id = self.memory.store_pattern(merged_pattern)
        
        # Delete old patterns
        for pattern in patterns:
            self.memory.delete_pattern(pattern.id)
        
        return merged_id
    
    def is_divergent(self, pattern: Pattern) -> bool:
        """Check if pattern has divergent behavior"""
        acceptance_rate = pattern.acceptance_count / (pattern.acceptance_count + pattern.rejection_count + pattern.dismissal_count)
        return acceptance_rate < 0.3 or acceptance_rate > 0.7
    
    def split_pattern(self, pattern: Pattern):
        """Split divergent pattern into two"""
        # Create two new patterns with slightly different vectors
        offset = 0.01
        pattern1 = Pattern(
            context_vector=pattern.context_vector * (1 + offset),
            goal_type=pattern.goal_type,
            suggestion_type=pattern.suggestion_type,
            acceptance_count=pattern.acceptance_count,
            rejection_count=0,
            dismissal_count=0
        )
        
        pattern2 = Pattern(
            context_vector=pattern.context_vector * (1 - offset),
            goal_type=pattern.goal_type,
            suggestion_type=pattern.suggestion_type,
            acceptance_count=0,
            rejection_count=pattern.rejection_count,
            dismissal_count=pattern.dismissal_count
        )
        
        # Store new patterns
        self.memory.store_pattern(pattern1)
        self.memory.store_pattern(pattern2)
        
        # Delete old pattern
        self.memory.delete_pattern(pattern.id)
```

---

### 7. PersonalizationEngine (User Profiling)

**Purpose**: Personalize suggestions based on user preferences.

**User Profile**:
```python
@dataclass
class UserProfile:
    user_id: str
    preferences: Dict[str, float]  # suggestion_type -> preference weight
    goal_weights: Dict[str, float]  # goal_type -> weight
    time_preferences: Dict[str, float]  # time_period -> preference
    created_at: datetime
    updated_at: datetime

class PersonalizationEngine:
    def __init__(self, memory: ContextualMemory):
        self.memory = memory
        self.profiles = {}  # user_id -> UserProfile
    
    def create_profile(self, user_id: str) -> UserProfile:
        """Create new user profile"""
        profile = UserProfile(
            user_id=user_id,
            preferences={},
            goal_weights={},
            time_preferences={},
            created_at=datetime.now(),
            updated_at=datetime.now()
        )
        self.profiles[user_id] = profile
        return profile
    
    def update_preferences(self, user_id: str, suggestion_type: str, delta: float):
        """Update user preference for suggestion type"""
        profile = self.profiles.get(user_id)
        if not profile:
            profile = self.create_profile(user_id)
        
        current = profile.preferences.get(suggestion_type, 0.5)
        profile.preferences[suggestion_type] = np.clip(current + delta, 0.0, 1.0)
        profile.updated_at = datetime.now()
    
    def get_personalized_suggestions(self, 
                                      user_id: str,
                                      suggestions: List[Suggestion]) -> List[Suggestion]:
        """Rank suggestions based on user preferences"""
        profile = self.profiles.get(user_id)
        if not profile:
            return suggestions
        
        # Score each suggestion
        scored = []
        for suggestion in suggestions:
            preference = profile.preferences.get(suggestion.type, 0.5)
            goal_weight = profile.goal_weights.get(suggestion.goal_type, 0.5)
            score = suggestion.confidence * preference * goal_weight
            scored.append((suggestion, score))
        
        # Sort by score (descending)
        scored.sort(key=lambda x: x[1], reverse=True)
        
        # Return ranked suggestions
        return [s[0] for s in scored]
```

---

### 8. ABTestingFramework (Validation)

**Purpose**: Validate different suggestion strategies using A/B testing.

**Experiment Design**:
```python
@dataclass
class Experiment:
    experiment_id: str
    name: str
    variants: List[Dict]  # List of variant configurations
    traffic_split: List[float]  # Traffic split for each variant
    start_date: datetime
    end_date: datetime
    status: str  # 'running', 'completed', 'paused'

@dataclass
class VariantResult:
    variant_id: str
    acceptance_count: int
    rejection_count: int
    dismissal_count: int
    acceptance_rate: float

class ABTestingFramework:
    def __init__(self, memory: ContextualMemory):
        self.memory = memory
        self.experiments = {}  # experiment_id -> Experiment
        self.assignments = {}  # user_id -> (experiment_id, variant_id)
    
    def create_experiment(self, 
                          name: str,
                          variants: List[Dict],
                          traffic_split: List[float],
                          duration_days: int = 7) -> str:
        """Create new A/B test experiment"""
        experiment_id = str(uuid.uuid4())
        experiment = Experiment(
            experiment_id=experiment_id,
            name=name,
            variants=variants,
            traffic_split=traffic_split,
            start_date=datetime.now(),
            end_date=datetime.now() + timedelta(days=duration_days),
            status='running'
        )
        self.experiments[experiment_id] = experiment
        return experiment_id
    
    def assign_variant(self, user_id: str, experiment_id: str) -> str:
        """Assign user to variant"""
        experiment = self.experiments[experiment_id]
        
        # Check if already assigned
        if user_id in self.assignments:
            return self.assignments[user_id][1]
        
        # Random assignment based on traffic split
        rand = np.random.random()
        cumulative = 0.0
        for i, split in enumerate(experiment.traffic_split):
            cumulative += split
            if rand < cumulative:
                variant_id = f"{experiment_id}_variant_{i}"
                self.assignments[user_id] = (experiment_id, variant_id)
                return variant_id
        
        # Fallback to first variant
        variant_id = f"{experiment_id}_variant_0"
        self.assignments[user_id] = (experiment_id, variant_id)
        return variant_id
    
    def get_results(self, experiment_id: str) -> List[VariantResult]:
        """Get experiment results"""
        experiment = self.experiments[experiment_id]
        results = []
        
        for i, variant in enumerate(experiment.variants):
            variant_id = f"{experiment_id}_variant_{i}"
            
            # Query feedback for this variant
            feedbacks = self.memory.query_feedback(variant_id)
            
            # Calculate statistics
            acceptance_count = sum(1 for f in feedbacks if f.action == 'approved')
            rejection_count = sum(1 for f in feedbacks if f.action == 'rejected')
            dismissal_count = sum(1 for f in feedbacks if f.action == 'dismissed')
            total = acceptance_count + rejection_count + dismissal_count
            acceptance_rate = acceptance_count / total if total > 0 else 0.0
            
            results.append(VariantResult(
                variant_id=variant_id,
                acceptance_count=acceptance_count,
                rejection_count=rejection_count,
                dismissal_count=dismissal_count,
                acceptance_rate=acceptance_rate
            ))
        
        return results
    
    def select_winner(self, experiment_id: str, min_sample_size: int = 100) -> str:
        """Select winning variant based on statistical significance"""
        results = self.get_results(experiment_id)
        
        # Check minimum sample size
        for result in results:
            total = result.acceptance_count + result.rejection_count + result.dismissal_count
            if total < min_sample_size:
                return None  # Not enough data
        
        # Perform chi-square test for statistical significance
        # (simplified - in production, use proper statistical test)
        best_result = max(results, key=lambda r: r.acceptance_rate)
        return best_result.variant_id
```

---

## Integration Design

### Infinite Desktop WebSocket Integration

**Message Protocol**:
```typescript
// Server → Client: Send suggestion to user
interface SuggestionMessage {
    type: 'SUGGESTION';
    id: string;
    suggestion: {
        type: 'file_prefetch' | 'command' | 'documentation' | 'error_prevention' | 'workflow';
        action: string;
        safety_level: 'SAFE' | 'REQUIRES_APPROVAL' | 'FORBIDDEN';
        confidence: number;
        evidence: string[];
        goal_type: string;
    };
    timestamp: string;
}

// Server → Client: Notify that suggestion was executed
interface SuggestionExecutedMessage {
    type: 'SUGGESTION_EXECUTED';
    id: string;
    result: {
        success: boolean;
        output?: string;
        error?: string;
    };
    timestamp: string;
}

// Client → Server: User approves suggestion
interface ApproveSuggestionMessage {
    type: 'APPROVE_SUGGESTION';
    id: string;
    timestamp: string;
}

// Client → Server: User rejects suggestion
interface RejectSuggestionMessage {
    type: 'REJECT_SUGGESTION';
    id: string;
    timestamp: string;
}

// Client → Server: User dismisses suggestion
interface DismissSuggestionMessage {
    type: 'DISMISS_SUGGESTION';
    id: string;
    timestamp: string;
}
```

**WebSocket Server**:
```python
import asyncio
import websockets
import json

class SuggestionWebSocketServer:
    def __init__(self, assistant: ProactiveAssistant):
        self.assistant = assistant
        self.clients = set()
    
    async def register(self, websocket):
        """Register new client"""
        self.clients.add(websocket)
        print(f"Client connected: {websocket.remote_address}")
    
    async def unregister(self, websocket):
        """Unregister client"""
        self.clients.remove(websocket)
        print(f"Client disconnected: {websocket.remote_address}")
    
    async def send_suggestion(self, suggestion: Suggestion):
        """Send suggestion to all clients"""
        message = {
            'type': 'SUGGESTION',
            'id': suggestion.id,
            'suggestion': {
                'type': suggestion.type.value,
                'action': suggestion.action,
                'safety_level': suggestion.safety_level.value,
                'confidence': suggestion.confidence,
                'evidence': suggestion.evidence,
                'goal_type': suggestion.goal_type
            },
            'timestamp': datetime.now().isoformat()
        }
        
        # Send to all clients
        if self.clients:
            await asyncio.gather(
                *[client.send(json.dumps(message)) for client in self.clients]
            )
    
    async def handle_message(self, websocket, message: str):
        """Handle incoming message from client"""
        data = json.loads(message)
        
        if data['type'] == 'APPROVE_SUGGESTION':
            # User approved suggestion
            suggestion_id = data['id']
            result = await self.assistant.execute_suggestion(suggestion_id)
            
            # Send execution result
            result_message = {
                'type': 'SUGGESTION_EXECUTED',
                'id': suggestion_id,
                'result': {
                    'success': result.success,
                    'output': result.output,
                    'error': result.error
                },
                'timestamp': datetime.now().isoformat()
            }
            await websocket.send(json.dumps(result_message))
        
        elif data['type'] == 'REJECT_SUGGESTION':
            # User rejected suggestion
            suggestion_id = data['id']
            self.assistant.reject_suggestion(suggestion_id)
        
        elif data['type'] == 'DISMISS_SUGGESTION':
            # User dismissed suggestion
            suggestion_id = data['id']
            self.assistant.dismiss_suggestion(suggestion_id)
    
    async def handler(self, websocket, path):
        """WebSocket connection handler"""
        await self.register(websocket)
        try:
            async for message in websocket:
                await self.handle_message(websocket, message)
        finally:
            await self.unregister(websocket)
    
    async def start(self, host: str = 'localhost', port: int = 8765):
        """Start WebSocket server"""
        async with websockets.serve(self.handler, host, port):
            print(f"WebSocket server started on ws://{host}:{port}")
            await asyncio.Future()  # Run forever
```

---

### PixelRTS v2 Texture Rendering

**Texture Generation**:
```python
import numpy as np
from PIL import Image, ImageDraw, ImageFont

class SuggestionTextureRenderer:
    def __init__(self):
        self.font = ImageFont.truetype("DejaVuSans.ttf", 16)
        self.title_font = ImageFont.truetype("DejaVuSans-Bold.ttf", 18)
    
    def render_suggestion_panel(self, suggestion: Suggestion) -> np.ndarray:
        """Render suggestion panel to GPU texture"""
        # Panel dimensions
        width = 400
        height = 300
        
        # Create image with transparency
        image = Image.new('RGBA', (width, height), (0, 0, 0, 0))
        draw = ImageDraw.Draw(image)
        
        # Draw glassmorphic background
        draw.rounded_rectangle(
            [(10, 10), (width - 10, height - 10)],
            radius=15,
            fill=(0, 0, 0, 180),  # Semi-transparent black
            outline=(0, 255, 255, 255),  # Cyan border
            width=2
        )
        
        # Draw safety badge
        if suggestion.safety_level == SafetyLevel.SAFE:
            badge_color = (0, 255, 0, 255)  # Green
        elif suggestion.safety_level == SafetyLevel.REQUIRES_APPROVAL:
            badge_color = (255, 255, 0, 255)  # Yellow
        else:
            badge_color = (255, 0, 0, 255)  # Red
        
        draw.rounded_rectangle(
            [(width - 100, 20), (width - 20, 40)],
            radius=5,
            fill=badge_color
        )
        draw.text((width - 90, 25), suggestion.safety_level.value, 
                 fill=(0, 0, 0, 255), font=self.font)
        
        # Draw suggestion type
        draw.text((30, 30), suggestion.type.value.replace('_', ' ').title(),
                 fill=(255, 255, 255, 255), font=self.title_font)
        
        # Draw action
        draw.text((30, 70), f"Action: {suggestion.action}",
                 fill=(200, 200, 200, 255), font=self.font)
        
        # Draw confidence
        draw.text((30, 100), f"Confidence: {suggestion.confidence:.1%}",
                 fill=(200, 200, 200, 255), font=self.font)
        
        # Draw evidence
        draw.text((30, 130), "Evidence:",
                 fill=(200, 200, 200, 255), font=self.font)
        y = 155
        for evidence in suggestion.evidence[:3]:  # Show max 3 evidence items
            draw.text((40, y), f"• {evidence}",
                     fill=(150, 150, 150, 255), font=self.font)
            y += 25
        
        # Draw buttons
        draw.rounded_rectangle(
            [(30, height - 60), (180, height - 30)],
            radius=5,
            fill=(0, 255, 255, 255)
        )
        draw.text((60, height - 55), "Approve",
                 fill=(0, 0, 0, 255), font=self.font)
        
        draw.rounded_rectangle(
            [(200, height - 60), (350, height - 30)],
            radius=5,
            fill=(255, 0, 255, 255)
        )
        draw.text((230, height - 55), "Dismiss",
                 fill=(0, 0, 0, 255), font=self.font)
        
        # Convert to numpy array
        texture = np.array(image)
        
        return texture
```

---

## Performance Optimization

### Query Optimization

**Indexing Strategy**:
```sql
-- Index on context vector for fast similarity search
CREATE INDEX idx_context_vector ON patterns(context_vector);

-- Index on goal type for filtering
CREATE INDEX idx_goal_type ON patterns(goal_type);

-- Index on suggestion type for filtering
CREATE INDEX idx_suggestion_type ON patterns(suggestion_type);

-- Index on freshness score for sorting
CREATE INDEX idx_freshness ON patterns(freshness_score DESC);

-- Composite index for common queries
CREATE INDEX idx_goal_suggestion_freshness 
ON patterns(goal_type, suggestion_type, freshness_score DESC);
```

**Caching Strategy**:
```python
from functools import lru_cache

class CachedPatternMatcher:
    def __init__(self, memory: ContextualMemory, cache_size: int = 1000):
        self.memory = memory
        self.cache_size = cache_size
    
    @lru_cache(maxsize=1000)
    def find_similar_patterns_cached(self, 
                                     context_vector_hash: int,
                                     threshold: float,
                                     limit: int) -> List[Tuple[int, float]]:
        """Cached version of pattern matching"""
        # Retrieve from cache or compute
        context_vector = self._decode_hash(context_vector_hash)
        return self._find_similar_patterns(context_vector, threshold, limit)
    
    def _encode_hash(self, context_vector: np.ndarray) -> int:
        """Encode context vector to hash"""
        return hash(context_vector.tobytes())
    
    def _decode_hash(self, hash_value: int) -> np.ndarray:
        """Decode hash to context vector (simplified)"""
        # In production, implement proper encoding/decoding
        return np.zeros(64)
```

---

## Security & Privacy

### Data Anonymization

**Anonymization Strategy**:
```python
def anonymize_context_vector(vector: ContextVector) -> ContextVector:
    """Anonymize sensitive information from context vector"""
    # Remove file paths (not stored in vector)
    # Remove command history (not stored in vector)
    # Remove user identifiers (not stored in vector)
    
    # Keep only aggregate statistics
    return vector
```

### Data Retention

**Retention Policy**:
```python
class DataRetentionPolicy:
    def __init__(self, memory: ContextualMemory):
        self.memory = memory
    
    def cleanup_old_data(self, retention_days: int = 90):
        """Delete data older than retention period"""
        cutoff_date = datetime.now() - timedelta(days=retention_days)
        self.memory.delete_patterns_before(cutoff_date)
        self.memory.delete_feedback_before(cutoff_date)
    
    def export_user_data(self, user_id: str) -> Dict:
        """Export all data for a user (GDPR compliance)"""
        patterns = self.memory.query_patterns_by_user(user_id)
        feedback = self.memory.query_feedback_by_user(user_id)
        return {
            'patterns': patterns,
            'feedback': feedback
        }
    
    def delete_user_data(self, user_id: str):
        """Delete all data for a user (GDPR compliance)"""
        self.memory.delete_patterns_by_user(user_id)
        self.memory.delete_feedback_by_user(user_id)
```

---

## Testing Strategy

### Unit Tests

**Test Coverage Target**: >85%

**Test Categories**:
1. Database operations (store, retrieve, update, delete)
2. Context vector generation (all 64 dimensions)
3. Cosine similarity matching
4. Temporal decay function
5. Feedback learning
6. Pattern refinement
7. Personalization
8. A/B testing

### Integration Tests

**Test Scenarios**:
1. ContextualMemory + FeedbackLearner
2. ContextualMemory + PersonalizationEngine
3. ContextualMemory + A/B Testing
4. TheoryOfMindEngine integration
5. PredictiveCortex integration
6. ConsciousnessDaemon integration
7. EvolutionDaemonV8 integration
8. Infinite Desktop WebSocket integration
9. PixelRTS v2 integration

### Performance Tests

**Performance Targets**:
- Memory retrieval: <2ms
- Pattern matching: <5ms
- Total system overhead: <20ms
- Database size: <100MB (after 1000 sessions)

---

## Conclusion

The Contextual Memory System provides a robust foundation for long-term learning and personalization in Geometry OS. The design follows Glass Box AI principles (transparent reasoning) and maintains architectural coherence with the existing Consciousness Stack.

**Key Strengths**:
- SQLite-based storage (embedded, ACID compliant)
- 64-dimensional context vectors (sufficient complexity, manageable size)
- Cosine similarity matching (fast, scale-invariant)
- Temporal decay (prioritizes recent behavior)
- Feedback learning (adapts to user preferences)
- Pattern refinement (optimizes over time)
- Personalization (tailors to individual users)
- A/B testing (validates improvements)

**Next Steps**: Implement according to the task list in `tasks.md`.

---

*This design document follows the Spec-First Development principle and maintains Glass Box AI transparency.*
