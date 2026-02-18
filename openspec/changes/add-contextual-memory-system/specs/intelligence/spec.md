# Intelligence Module Specification: Contextual Memory System

**Module**: `systems/intelligence`  
**Change**: `add-contextual-memory-system`  
**Version**: 1.0  
**Created**: January 21, 2026

---

## Overview

The Contextual Memory System extends the Intelligence module with long-term pattern storage, learning capabilities, and personalization. It builds on Week 1 (Goal Inference) and Week 2 (Proactive Assistance) to create a truly adaptive intelligent assistant.

---

## ADDED Requirements

### Requirement: Contextual Memory Storage

The system SHALL provide persistent pattern storage using SQLite database with ACID compliance.

#### Scenario: Store new pattern
- **WHEN** a new behavioral pattern is detected
- **THEN** the system SHALL store the pattern with 64-dimensional context vector
- **AND** assign a unique pattern ID
- **AND** initialize acceptance/rejection/dismissal counts to zero
- **VISUAL** pattern appears as new node in neural connection graph

#### Scenario: Retrieve similar patterns
- **WHEN** a context vector is provided for matching
- **THEN** the system SHALL find patterns with cosine similarity > threshold (default 0.85)
- **AND** return up to limit patterns (default 10)
- **AND** complete retrieval in <2ms (p95)
- **VISUAL** matching patterns highlighted in memory visualization

#### Scenario: Update pattern weights
- **WHEN** user feedback is received
- **THEN** the system SHALL update acceptance/rejection/dismissal counts
- **AND** adjust pattern weight using Bayesian update
- **AND** update last_seen timestamp
- **VISUAL** node size changes to reflect new acceptance rate

#### Scenario: Delete old patterns
- **WHEN** cleanup is triggered
- **THEN** the system SHALL delete patterns older than retention period (default 90 days)
- **AND** return count of deleted patterns
- **VISUAL** faded nodes removed from graph

---

### Requirement: Context Vector Generation

The system SHALL generate 64-dimensional context vectors from behavioral signals.

#### Scenario: Generate context vector from signals
- **WHEN** behavioral signals are collected
- **THEN** the system SHALL extract 8 goal inference features (dimensions 1-8)
- **AND** extract 8 time features (dimensions 9-16)
- **AND** extract 8 file type features (dimensions 17-24)
- **AND** extract 8 command frequency features (dimensions 25-32)
- **AND** extract 8 error features (dimensions 33-40)
- **AND** extract 8 neural activity features (dimensions 41-48)
- **AND** extract 8 user intent features (dimensions 49-56)
- **AND** extract 8 velocity/frequency features (dimensions 57-64)
- **AND** complete generation in <1ms (p95)

#### Scenario: Extract goal inference features
- **WHEN** goal inference scores are available
- **THEN** the system SHALL include confidence scores for all 8 goal types
- **AND** normalize values to [0.0, 1.0] range

#### Scenario: Extract time features with cyclical encoding
- **WHEN** temporal context is needed
- **THEN** the system SHALL use sine/cosine encoding for hour and day
- **AND** include binary flags for weekend, morning, afternoon, evening
- **AND** preserve cyclical nature of time (23:59 is close to 00:00)

---

### Requirement: Pattern Matching with Cosine Similarity

The system SHALL find similar patterns using cosine similarity matching.

#### Scenario: Find patterns above similarity threshold
- **WHEN** a context vector is provided
- **THEN** the system SHALL compute cosine similarity with all stored patterns
- **AND** return patterns with similarity >= threshold
- **AND** sort results by similarity (descending)
- **AND** limit results to specified maximum
- **AND** complete matching in <5ms (p95)

#### Scenario: Cache frequently accessed patterns
- **WHEN** the same context vector is queried multiple times
- **THEN** the system SHALL use LRU cache to avoid recomputation
- **AND** maintain cache size <= 1000 entries
- **AND** improve response time by 10x for cached queries

---

### Requirement: Feedback Learning

The system SHALL learn from user feedback to improve suggestion quality.

#### Scenario: Record approval feedback
- **WHEN** user approves a suggestion
- **THEN** the system SHALL increment pattern acceptance_count
- **AND** increase pattern weight by 15% (Bayesian update)
- **AND** store feedback record with timestamp
- **VISUAL** node glows green, edge thickness increases

#### Scenario: Record rejection feedback
- **WHEN** user rejects a suggestion
- **THEN** the system SHALL increment pattern rejection_count
- **AND** decrease pattern weight by 15% (Bayesian update)
- **AND** store feedback record with timestamp
- **VISUAL** node flashes red, edge thickness decreases

#### Scenario: Record dismissal feedback
- **WHEN** user dismisses a suggestion
- **THEN** the system SHALL increment pattern dismissal_count
- **AND** decrease pattern weight by 5% (neutral feedback)
- **AND** store feedback record with timestamp
- **VISUAL** node fades slightly

#### Scenario: Calculate acceptance rate
- **WHEN** acceptance rate is requested
- **THEN** the system SHALL compute acceptance_count / total_feedback
- **AND** return value in [0.0, 1.0] range
- **AND** return 0.0 if no feedback exists

---

### Requirement: Personalization Engine

The system SHALL personalize suggestions based on user preferences.

#### Scenario: Create user profile
- **WHEN** a new user is detected
- **THEN** the system SHALL create profile with default preferences
- **AND** initialize all preference weights to 0.5 (neutral)
- **AND** store creation timestamp

#### Scenario: Update user preferences
- **WHEN** user feedback indicates preference
- **THEN** the system SHALL adjust preference weight for suggestion type
- **AND** clip values to [0.0, 1.0] range
- **AND** update profile timestamp

#### Scenario: Rank suggestions by user preferences
- **WHEN** multiple suggestions are available
- **THEN** the system SHALL score each suggestion using preference weights
- **AND** multiply by goal weights and confidence
- **AND** return suggestions sorted by score (descending)
- **VISUAL** preferred suggestions appear first in panel

---

### Requirement: A/B Testing Framework

The system SHALL validate different suggestion strategies using A/B testing.

#### Scenario: Create experiment
- **WHEN** a new strategy needs validation
- **THEN** the system SHALL create experiment with multiple variants
- **AND** assign traffic split percentages (must sum to 1.0)
- **AND** set start and end dates
- **AND** return unique experiment ID

#### Scenario: Assign user to variant
- **WHEN** user participates in experiment
- **THEN** the system SHALL randomly assign to variant based on traffic split
- **AND** persist assignment for consistency
- **AND** return variant ID

#### Scenario: Select winning variant
- **WHEN** experiment completes
- **THEN** the system SHALL compute acceptance rates for all variants
- **AND** perform statistical significance test
- **AND** return variant with highest acceptance rate if significant
- **AND** return None if insufficient data (< min_sample_size)

---

### Requirement: WebSocket Integration

The system SHALL provide real-time communication with Infinite Desktop via WebSocket.

#### Scenario: Send suggestion to client
- **WHEN** a new suggestion is generated
- **THEN** the system SHALL broadcast SUGGESTION message to all connected clients
- **AND** include suggestion type, action, safety level, confidence, evidence
- **AND** include unique suggestion ID and timestamp
- **VISUAL** glassmorphic panel fades in from bottom-right

#### Scenario: Receive approval from client
- **WHEN** client sends APPROVE_SUGGESTION message
- **THEN** the system SHALL execute the suggestion
- **AND** send SUGGESTION_EXECUTED message with result
- **AND** record approval feedback
- **VISUAL** panel shows success animation, then fades out

#### Scenario: Receive rejection from client
- **WHEN** client sends REJECT_SUGGESTION message
- **THEN** the system SHALL cancel the suggestion
- **AND** record rejection feedback
- **VISUAL** panel shows rejection animation, then fades out

#### Scenario: Receive dismissal from client
- **WHEN** client sends DISMISS_SUGGESTION message
- **THEN** the system SHALL cancel the suggestion
- **AND** record dismissal feedback
- **VISUAL** panel fades out immediately

---

### Requirement: Temporal Decay

The system SHALL apply temporal decay to pattern weights to prioritize recent behavior.

#### Scenario: Apply exponential decay
- **WHEN** pattern age is calculated
- **THEN** the system SHALL compute decay factor using exp(-decay_rate * days_old)
- **AND** use default decay rate of 0.01 per day
- **AND** update freshness_score field

#### Scenario: Schedule daily decay task
- **WHEN** system is running
- **THEN** the system SHALL apply decay to all patterns every 24 hours
- **AND** update database with new freshness scores
- **VISUAL** old patterns fade in memory graph

---

### Requirement: Pattern Refinement

The system SHALL refine patterns based on feedback to improve accuracy.

#### Scenario: Merge similar patterns
- **WHEN** multiple patterns have similarity > 0.95
- **THEN** the system SHALL average their context vectors
- **AND** sum their acceptance/rejection/dismissal counts
- **AND** create merged pattern
- **AND** delete original patterns
- **VISUAL** nodes merge into single larger node

#### Scenario: Split divergent patterns
- **WHEN** pattern has acceptance rate < 0.3 or > 0.7
- **THEN** the system SHALL create two new patterns with offset vectors
- **AND** distribute feedback counts
- **AND** delete original pattern
- **VISUAL** node splits into two smaller nodes

#### Scenario: Remove outlier patterns
- **WHEN** pattern has very low acceptance rate and high age
- **THEN** the system SHALL delete the pattern
- **VISUAL** node fades out and disappears

---

### Requirement: Performance Targets

The system SHALL meet specified performance targets for all operations.

#### Scenario: Memory retrieval latency
- **WHEN** retrieving patterns from database
- **THEN** the system SHALL complete operation in <2ms (p95)

#### Scenario: Pattern matching latency
- **WHEN** finding similar patterns
- **THEN** the system SHALL complete operation in <5ms (p95)

#### Scenario: Total system overhead
- **WHEN** processing a complete suggestion cycle
- **THEN** the system SHALL add <20ms overhead (p95)

#### Scenario: Database size growth
- **WHEN** storing 1000 sessions of patterns
- **THEN** the database SHALL remain <100MB in size

---

### Requirement: Security and Privacy

The system SHALL protect user data and comply with GDPR requirements.

#### Scenario: Anonymize stored data
- **WHEN** storing patterns
- **THEN** the system SHALL NOT store file paths, commands, or user identifiers
- **AND** store only aggregate statistical features

#### Scenario: Export user data (GDPR compliance)
- **WHEN** user requests data export
- **THEN** the system SHALL export all patterns and feedback as JSON
- **AND** include timestamps and metadata

#### Scenario: Delete user data (GDPR compliance)
- **WHEN** user requests data deletion
- **THEN** the system SHALL delete all patterns and feedback for that user
- **AND** return confirmation

#### Scenario: Enforce data retention policy
- **WHEN** data exceeds retention period (default 90 days)
- **THEN** the system SHALL automatically delete old data
- **AND** log deletion operations

---

## Module Structure

```
systems/intelligence/
├── __init__.py                      # Module initialization
├── goal_inference_engine.py         # Week 1: Goal inference (existing)
├── test_goal_inference.py           # Week 1: Tests (existing)
├── visual_goal_inference_demo.py    # Week 1: Demo (existing)
├── proactive_assistant.py           # Week 2: Proactive assistance (existing)
├── test_proactive_assistant.py     # Week 2: Tests (existing)
├── visual_proactive_assistant_demo.py  # Week 2: Demo (existing)
├── contextual_memory_db.py          # Week 3: Database layer (NEW)
├── contextual_memory.py             # Week 3: Memory storage (NEW)
├── context_vector_generator.py      # Week 3: Vector generation (NEW)
├── pattern_matcher.py               # Week 3: Similarity matching (NEW)
├── temporal_decay.py                # Week 3: Time-based fading (NEW)
├── feedback_learner.py              # Week 3: Learning engine (NEW)
├── pattern_refiner.py               # Week 3: Pattern optimization (NEW)
├── personalization_engine.py        # Week 3: User profiling (NEW)
├── ab_testing.py                    # Week 3: A/B testing (NEW)
├── integration_theory_of_mind.py    # Week 3: TheoryOfMind integration (NEW)
├── integration_predictive_cortex.py # Week 3: PredictiveCortex integration (NEW)
├── integration_consciousness.py     # Week 3: ConsciousnessDaemon integration (NEW)
├── integration_evolution.py        # Week 3: EvolutionDaemonV8 integration (NEW)
├── websocket_integration.py          # Week 3: WebSocket server (NEW)
├── suggestion_panel_ui.py            # Week 3: UI components (NEW)
├── pixelrts_integration.py          # Week 3: PixelRTS rendering (NEW)
├── memory_visualizer.py             # Week 3: Memory graphs (NEW)
├── test_contextual_memory.py        # Week 3: Unit tests (NEW)
├── test_integrations.py             # Week 3: Integration tests (NEW)
├── benchmarks.py                    # Week 3: Performance tests (NEW)
└── visual_week3_demo.py             # Week 3: End-to-end demo (NEW)
```

---

## API Specification

### ContextualMemory Class

**Purpose**: Store and retrieve patterns using SQLite database.

**File**: `systems/intelligence/contextual_memory.py`

**Interface**:
```python
from dataclasses import dataclass
from typing import List, Dict, Optional
import numpy as np
from datetime import datetime

@dataclass
class Pattern:
    """Represents a stored pattern"""
    id: Optional[int]
    context_vector: np.ndarray  # 64-dimensional vector
    goal_type: str  # DEBUGGING, FEATURE_DEVELOPMENT, etc.
    suggestion_type: str  # file_prefetch, command, etc.
    acceptance_count: int
    rejection_count: int
    dismissal_count: int
    weight: float  # Pattern weight (0.0 - 1.0)
    freshness_score: float  # Temporal decay score (0.0 - 1.0)
    last_seen: datetime
    created_at: datetime

class ContextualMemory:
    """
    Contextual memory system for pattern storage and retrieval.
    
    Uses SQLite database for persistent storage with ACID compliance.
    """
    
    def __init__(self, db_path: str = "~/.geometry_os/contextual_memory.db"):
        """
        Initialize contextual memory.
        
        Args:
            db_path: Path to SQLite database file
        """
        pass
    
    def store_pattern(self, pattern: Pattern) -> int:
        """
        Store a pattern in the database.
        
        Args:
            pattern: Pattern to store
        
        Returns:
            Pattern ID
        """
        pass
    
    def retrieve_pattern(self, pattern_id: int) -> Optional[Pattern]:
        """
        Retrieve a pattern by ID.
        
        Args:
            pattern_id: Pattern ID
        
        Returns:
            Pattern or None if not found
        """
        pass
    
    def retrieve_patterns(self, 
                          context_vector: np.ndarray,
                          threshold: float = 0.85,
                          limit: int = 10) -> List[Pattern]:
        """
        Retrieve patterns similar to context vector.
        
        Args:
            context_vector: 64-dimensional context vector
            threshold: Minimum cosine similarity (0.0 - 1.0)
            limit: Maximum number of patterns to return
        
        Returns:
            List of similar patterns
        """
        pass
    
    def update_pattern(self, pattern_id: int, updates: Dict) -> bool:
        """
        Update a pattern.
        
        Args:
            pattern_id: Pattern ID
            updates: Dictionary of fields to update
        
        Returns:
            True if updated, False if not found
        """
        pass
    
    def delete_pattern(self, pattern_id: int) -> bool:
        """
        Delete a pattern.
        
        Args:
            pattern_id: Pattern ID
        
        Returns:
            True if deleted, False if not found
        """
        pass
    
    def get_statistics(self) -> Dict:
        """
        Get memory statistics.
        
        Returns:
            Dictionary with statistics:
            - total_patterns: Total number of patterns
            - average_acceptance_rate: Average acceptance rate
            - most_common_goal_type: Most common goal type
            - most_common_suggestion_type: Most common suggestion type
        """
        pass
    
    def cleanup_old_patterns(self, days: int = 90) -> int:
        """
        Delete patterns older than specified days.
        
        Args:
            days: Age threshold in days
        
        Returns:
            Number of patterns deleted
        """
        pass
    
    def export_data(self, path: str) -> bool:
        """
        Export all data to JSON file.
        
        Args:
            path: Output file path
        
        Returns:
            True if successful
        """
        pass
    
    def import_data(self, path: str) -> bool:
        """
        Import data from JSON file.
        
        Args:
            path: Input file path
        
        Returns:
            True if successful
        """
        pass
```

---

### ContextVectorGenerator Class

**Purpose**: Generate 64-dimensional context vectors from behavioral signals.

**File**: `systems/intelligence/context_vector_generator.py`

**Interface**:
```python
from dataclasses import dataclass
from typing import List, Dict
import numpy as np

@dataclass
class SignalContext:
    """Behavioral signals for context generation"""
    file_path: Optional[str]
    file_type: Optional[str]
    directory: Optional[str]
    recent_commands: List[str]
    time_of_day: float  # 0.0 - 24.0
    day_of_week: int  # 0 = Monday, 6 = Sunday
    recent_errors: List[str]
    neural_activity: float  # From PredictiveCortex
    user_intent: Optional[Dict[str, float]]  # From TheoryOfMindEngine
    velocity: float  # Input velocity
    frequency: float  # Command frequency

@dataclass
class ContextVector:
    """64-dimensional context vector"""
    # Goal inference scores (dimensions 1-8)
    debugging_confidence: float
    feature_dev_confidence: float
    testing_confidence: float
    documentation_confidence: float
    exploration_confidence: float
    refactoring_confidence: float
    deployment_confidence: float
    maintenance_confidence: float
    
    # Time features (dimensions 9-16)
    hour_sin: float
    hour_cos: float
    day_sin: float
    day_cos: float
    is_weekend: float
    is_morning: float
    is_afternoon: float
    is_evening: float
    
    # File type distribution (dimensions 17-24)
    python_ratio: float
    rust_ratio: float
    javascript_ratio: float
    markdown_ratio: float
    config_ratio: float
    test_ratio: float
    doc_ratio: float
    other_ratio: float
    
    # Command frequency (dimensions 25-32)
    git_frequency: float
    test_frequency: float
    build_frequency: float
    deploy_frequency: float
    debug_frequency: float
    search_frequency: float
    edit_frequency: float
    other_frequency: float
    
    # Error detection (dimensions 33-40)
    error_count: float
    warning_count: float
    syntax_error_ratio: float
    runtime_error_ratio: float
    test_failure_ratio: float
    build_error_ratio: float
    deployment_error_ratio: float
    other_error_ratio: float
    
    # Neural activity (dimensions 41-48)
    neural_activity_level: float
    attention_focus: float
    engagement_level: float
    cognitive_load: float
    prediction_confidence: float
    metacognitive_awareness: float
    self_monitoring: float
    reflection_depth: float
    
    # User intent (dimensions 49-56)
    exploration_intent: float
    focus_intent: float
    creation_intent: float
    analysis_intent: float
    debugging_intent: float
    testing_intent: float
    deployment_intent: float
    maintenance_intent: float
    
    # Velocity/frequency (dimensions 57-64)
    typing_velocity: float
    command_velocity: float
    file_open_velocity: float
    overall_velocity: float
    typing_frequency: float
    command_frequency: float
    file_open_frequency: float
    overall_frequency: float
    
    def to_array(self) -> np.ndarray:
        """Convert to 64-dimensional numpy array"""
        pass

class ContextVectorGenerator:
    """
    Generate 64-dimensional context vectors from behavioral signals.
    """
    
    def __init__(self):
        """Initialize context vector generator"""
        pass
    
    def generate(self, signals: SignalContext) -> np.ndarray:
        """
        Generate context vector from signals.
        
        Args:
            signals: Behavioral signals
        
        Returns:
            64-dimensional numpy array
        """
        pass
    
    def extract_goal_features(self, 
                               signals: SignalContext,
                               goal_inference: GoalInferenceEngine) -> np.ndarray:
        """
        Extract goal inference features (dimensions 1-8).
        
        Args:
            signals: Behavioral signals
            goal_inference: Goal inference engine
        
        Returns:
            8-dimensional array
        """
        pass
    
    def extract_time_features(self, signals: SignalContext) -> np.ndarray:
        """
        Extract time features (dimensions 9-16).
        
        Args:
            signals: Behavioral signals
        
        Returns:
            8-dimensional array
        """
        pass
    
    def extract_file_type_features(self, signals: SignalContext) -> np.ndarray:
        """
        Extract file type distribution (dimensions 17-24).
        
        Args:
            signals: Behavioral signals
        
        Returns:
            8-dimensional array
        """
        pass
    
    def extract_command_frequency_features(self, 
                                           signals: SignalContext) -> np.ndarray:
        """
        Extract command frequency features (dimensions 25-32).
        
        Args:
            signals: Behavioral signals
        
        Returns:
            8-dimensional array
        """
        pass
    
    def extract_error_features(self, signals: SignalContext) -> np.ndarray:
        """
        Extract error features (dimensions 33-40).
        
        Args:
            signals: Behavioral signals
        
        Returns:
            8-dimensional array
        """
        pass
    
    def extract_neural_activity_features(self, 
                                          signals: SignalContext) -> np.ndarray:
        """
        Extract neural activity features (dimensions 41-48).
        
        Args:
            signals: Behavioral signals
        
        Returns:
            8-dimensional array
        """
        pass
    
    def extract_user_intent_features(self, 
                                      signals: SignalContext) -> np.ndarray:
        """
        Extract user intent features (dimensions 49-56).
        
        Args:
            signals: Behavioral signals
        
        Returns:
            8-dimensional array
        """
        pass
    
    def extract_velocity_frequency_features(self, 
                                             signals: SignalContext) -> np.ndarray:
        """
        Extract velocity/frequency features (dimensions 57-64).
        
        Args:
            signals: Behavioral signals
        
        Returns:
            8-dimensional array
        """
        pass
```

---

### PatternMatcher Class

**Purpose**: Find similar patterns using cosine similarity.

**File**: `systems/intelligence/pattern_matcher.py`

**Interface**:
```python
from typing import List, Tuple
import numpy as np
from functools import lru_cache

class PatternMatcher:
    """
    Find similar patterns using cosine similarity.
    """
    
    def __init__(self, memory: ContextualMemory, cache_size: int = 1000):
        """
        Initialize pattern matcher.
        
        Args:
            memory: Contextual memory instance
            cache_size: LRU cache size
        """
        pass
    
    def find_similar_patterns(self, 
                               context_vector: np.ndarray,
                               threshold: float = 0.85,
                               limit: int = 10) -> List[Tuple[int, float]]:
        """
        Find patterns with cosine similarity > threshold.
        
        Args:
            context_vector: 64-dimensional context vector
            threshold: Minimum cosine similarity (0.0 - 1.0)
            limit: Maximum number of patterns to return
        
        Returns:
            List of (pattern_id, similarity_score) tuples
        """
        pass
    
    @staticmethod
    def cosine_similarity(a: np.ndarray, b: np.ndarray) -> float:
        """
        Compute cosine similarity between two vectors.
        
        Args:
            a: First vector
            b: Second vector
        
        Returns:
            Cosine similarity (-1.0 to 1.0)
        """
        pass
    
    def clear_cache(self):
        """Clear LRU cache"""
        pass
```

---

### FeedbackLearner Class

**Purpose**: Learn from user feedback to improve suggestion quality.

**File**: `systems/intelligence/feedback_learner.py`

**Interface**:
```python
from dataclasses import dataclass
from typing import Dict
from datetime import datetime
import numpy as np

@dataclass
class Feedback:
    """User feedback on a suggestion"""
    pattern_id: int
    suggestion_id: str
    action: str  # 'approved', 'rejected', 'dismissed'
    timestamp: datetime
    context_vector: np.ndarray

class FeedbackLearner:
    """
    Learn from user feedback to improve suggestion quality.
    """
    
    def __init__(self, memory: ContextualMemory):
        """
        Initialize feedback learner.
        
        Args:
            memory: Contextual memory instance
        """
        pass
    
    def record_feedback(self, feedback: Feedback):
        """
        Record user feedback.
        
        Args:
            feedback: Feedback to record
        """
        pass
    
    def get_acceptance_rate(self, pattern_id: int) -> float:
        """
        Calculate acceptance rate for pattern.
        
        Args:
            pattern_id: Pattern ID
        
        Returns:
            Acceptance rate (0.0 - 1.0)
        """
        pass
    
    def get_rejection_rate(self, pattern_id: int) -> float:
        """
        Calculate rejection rate for pattern.
        
        Args:
            pattern_id: Pattern ID
        
        Returns:
            Rejection rate (0.0 - 1.0)
        """
        pass
    
    def get_dismissal_rate(self, pattern_id: int) -> float:
        """
        Calculate dismissal rate for pattern.
        
        Args:
            pattern_id: Pattern ID
        
        Returns:
            Dismissal rate (0.0 - 1.0)
        """
        pass
    
    def get_statistics(self) -> Dict:
        """
        Get feedback statistics.
        
        Returns:
            Dictionary with statistics:
            - total_feedback: Total number of feedback records
            - overall_acceptance_rate: Overall acceptance rate
            - most_accepted_suggestion_type: Most accepted suggestion type
            - most_rejected_suggestion_type: Most rejected suggestion type
        """
        pass
```

---

### PersonalizationEngine Class

**Purpose**: Personalize suggestions based on user preferences.

**File**: `systems/intelligence/personalization_engine.py`

**Interface**:
```python
from dataclasses import dataclass
from typing import Dict, List
from datetime import datetime
from systems.intelligence.proactive_assistant import Suggestion

@dataclass
class UserProfile:
    """User profile for personalization"""
    user_id: str
    preferences: Dict[str, float]  # suggestion_type -> preference weight
    goal_weights: Dict[str, float]  # goal_type -> weight
    time_preferences: Dict[str, float]  # time_period -> preference
    created_at: datetime
    updated_at: datetime

class PersonalizationEngine:
    """
    Personalize suggestions based on user preferences.
    """
    
    def __init__(self, memory: ContextualMemory):
        """
        Initialize personalization engine.
        
        Args:
            memory: Contextual memory instance
        """
        pass
    
    def create_profile(self, user_id: str) -> UserProfile:
        """
        Create new user profile.
        
        Args:
            user_id: User ID
        
        Returns:
            User profile
        """
        pass
    
    def get_profile(self, user_id: str) -> Optional[UserProfile]:
        """
        Get user profile.
        
        Args:
            user_id: User ID
        
        Returns:
            User profile or None if not found
        """
        pass
    
    def update_preferences(self, 
                           user_id: str, 
                           suggestion_type: str, 
                           delta: float):
        """
        Update user preference for suggestion type.
        
        Args:
            user_id: User ID
            suggestion_type: Suggestion type
            delta: Change in preference (-1.0 to 1.0)
        """
        pass
    
    def get_personalized_suggestions(self, 
                                      user_id: str,
                                      suggestions: List[Suggestion]) -> List[Suggestion]:
        """
        Rank suggestions based on user preferences.
        
        Args:
            user_id: User ID
            suggestions: List of suggestions
        
        Returns:
            Ranked list of suggestions
        """
        pass
    
    def export_profile(self, user_id: str) -> Dict:
        """
        Export user profile (GDPR compliance).
        
        Args:
            user_id: User ID
        
        Returns:
            User profile as dictionary
        """
        pass
    
    def delete_profile(self, user_id: str) -> bool:
        """
        Delete user profile (GDPR compliance).
        
        Args:
            user_id: User ID
        
        Returns:
            True if deleted
        """
        pass
```

---

### ABTestingFramework Class

**Purpose**: Validate different suggestion strategies using A/B testing.

**File**: `systems/intelligence/ab_testing.py`

**Interface**:
```python
from dataclasses import dataclass
from typing import List, Dict, Optional
from datetime import datetime
import uuid

@dataclass
class Experiment:
    """A/B test experiment"""
    experiment_id: str
    name: str
    variants: List[Dict]  # List of variant configurations
    traffic_split: List[float]  # Traffic split for each variant
    start_date: datetime
    end_date: datetime
    status: str  # 'running', 'completed', 'paused'

@dataclass
class VariantResult:
    """A/B test variant result"""
    variant_id: str
    acceptance_count: int
    rejection_count: int
    dismissal_count: int
    acceptance_rate: float

class ABTestingFramework:
    """
    Validate different suggestion strategies using A/B testing.
    """
    
    def __init__(self, memory: ContextualMemory):
        """
        Initialize A/B testing framework.
        
        Args:
            memory: Contextual memory instance
        """
        pass
    
    def create_experiment(self, 
                          name: str,
                          variants: List[Dict],
                          traffic_split: List[float],
                          duration_days: int = 7) -> str:
        """
        Create new A/B test experiment.
        
        Args:
            name: Experiment name
            variants: List of variant configurations
            traffic_split: Traffic split for each variant (must sum to 1.0)
            duration_days: Experiment duration in days
        
        Returns:
            Experiment ID
        """
        pass
    
    def get_experiment(self, experiment_id: str) -> Optional[Experiment]:
        """
        Get experiment by ID.
        
        Args:
            experiment_id: Experiment ID
        
        Returns:
            Experiment or None if not found
        """
        pass
    
    def assign_variant(self, user_id: str, experiment_id: str) -> str:
        """
        Assign user to variant.
        
        Args:
            user_id: User ID
            experiment_id: Experiment ID
        
        Returns:
            Variant ID
        """
        pass
    
    def get_results(self, experiment_id: str) -> List[VariantResult]:
        """
        Get experiment results.
        
        Args:
            experiment_id: Experiment ID
        
        Returns:
            List of variant results
        """
        pass
    
    def select_winner(self, 
                      experiment_id: str, 
                      min_sample_size: int = 100) -> Optional[str]:
        """
        Select winning variant based on statistical significance.
        
        Args:
            experiment_id: Experiment ID
            min_sample_size: Minimum sample size per variant
        
        Returns:
            Winning variant ID or None if not enough data
        """
        pass
    
    def pause_experiment(self, experiment_id: str) -> bool:
        """
        Pause experiment.
        
        Args:
            experiment_id: Experiment ID
        
        Returns:
            True if paused
        """
        pass
    
    def resume_experiment(self, experiment_id: str) -> bool:
        """
        Resume experiment.
        
        Args:
            experiment_id: Experiment ID
        
        Returns:
            True if resumed
        """
        pass
    
    def complete_experiment(self, experiment_id: str) -> bool:
        """
        Complete experiment.
        
        Args:
            experiment_id: Experiment ID
        
        Returns:
            True if completed
        """
        pass
```

---

### WebSocket Integration

**Purpose**: Real-time communication with Infinite Desktop.

**File**: `systems/intelligence/websocket_integration.py`

**Interface**:
```python
import asyncio
import websockets
import json
from typing import Set, Dict, Any
from datetime import datetime
from systems.intelligence.proactive_assistant import Suggestion, ExecutionResult

class SuggestionWebSocketServer:
    """
    WebSocket server for real-time suggestion communication.
    """
    
    def __init__(self, 
                 assistant: 'ProactiveAssistant',
                 host: str = 'localhost',
                 port: int = 8765):
        """
        Initialize WebSocket server.
        
        Args:
            assistant: Proactive assistant instance
            host: Server host
            port: Server port
        """
        pass
    
    async def start(self):
        """Start WebSocket server"""
        pass
    
    async def stop(self):
        """Stop WebSocket server"""
        pass
    
    async def send_suggestion(self, suggestion: Suggestion):
        """
        Send suggestion to all connected clients.
        
        Args:
            suggestion: Suggestion to send
        """
        pass
    
    async def send_execution_result(self, 
                                     suggestion_id: str, 
                                     result: ExecutionResult):
        """
        Send execution result to all connected clients.
        
        Args:
            suggestion_id: Suggestion ID
            result: Execution result
        """
        pass
    
    async def handle_message(self, 
                              websocket, 
                              message: str):
        """
        Handle incoming message from client.
        
        Args:
            websocket: WebSocket connection
            message: Message string
        """
        pass
```

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

---

## Performance Requirements

### Latency Targets

- **Memory retrieval**: <2ms (p95)
- **Pattern matching**: <5ms (p95)
- **Context vector generation**: <1ms (p95)
- **Feedback recording**: <1ms (p95)
- **Total system overhead**: <20ms (p95)

### Throughput Targets

- **Pattern storage**: >1000 patterns/second
- **Pattern retrieval**: >1000 patterns/second
- **WebSocket messages**: >1000 messages/second

### Memory Targets

- **Database size**: <100MB (after 1000 sessions)
- **Runtime memory**: <50MB
- **Cache size**: <10MB

---

## Security Requirements

### Data Privacy

- Anonymize all stored data (no file paths, no commands)
- Provide data export functionality (GDPR compliance)
- Provide data deletion functionality (GDPR compliance)
- Document data retention policy (90 days default)

### Access Control

- Database file permissions: 600 (owner read/write only)
- WebSocket authentication (optional, for production)
- Rate limiting (prevent abuse)

### Audit Logging

- Log all pattern storage operations
- Log all feedback recording operations
- Log all personalization updates
- Log all A/B test assignments

---

## Testing Requirements

### Unit Tests

**Coverage Target**: >85%

**Test Files**:
- `test_contextual_memory.py` - ContextualMemory tests
- `test_context_vector_generator.py` - ContextVectorGenerator tests
- `test_pattern_matcher.py` - PatternMatcher tests
- `test_feedback_learner.py` - FeedbackLearner tests
- `test_personalization_engine.py` - PersonalizationEngine tests
- `test_ab_testing.py` - ABTestingFramework tests

### Integration Tests

**Test File**: `test_integrations.py`

**Test Scenarios**:
1. ContextualMemory + FeedbackLearner integration
2. ContextualMemory + PersonalizationEngine integration
3. ContextualMemory + ABTestingFramework integration
4. TheoryOfMindEngine integration
5. PredictiveCortex integration
6. ConsciousnessDaemon integration
7. EvolutionDaemonV8 integration
8. WebSocket integration

### Performance Tests

**Test File**: `benchmarks.py`

**Benchmark Scenarios**:
1. Memory retrieval latency
2. Pattern matching latency
3. Context vector generation latency
4. Feedback recording latency
5. Total system overhead
6. Database size growth
7. WebSocket message latency

---

## Dependencies

### Required Dependencies

- `sqlite3` (Python built-in)
- `numpy` (for vector operations)
- `websockets` (for WebSocket server)
- `asyncio` (Python built-in)
- `dataclasses` (Python built-in)
- `typing` (Python built-in)

### Optional Dependencies

- `PIL` / `Pillow` (for texture rendering)
- `matplotlib` (for visualization)
- `pytest` (for testing)
- `pytest-asyncio` (for async testing)

### Internal Dependencies

- `systems.intelligence.goal_inference_engine` (Week 1)
- `systems.intelligence.proactive_assistant` (Week 2)
- `systems.consciousness.theory_of_mind_engine` (Phase 24)
- `systems.consciousness.predictive_cortex` (Phase 23)
- `systems.consciousness.consciousness_daemon` (Phase 23)
- `systems.evolution.evolution_daemon_v8` (Phase 22)

---

## Version History

### Version 1.0 (January 21, 2026)

- Initial specification
- ContextualMemory API
- ContextVectorGenerator API
- PatternMatcher API
- FeedbackLearner API
- PersonalizationEngine API
- ABTestingFramework API
- WebSocket integration API

---

## Future Enhancements

### Potential Future Features

1. **Neural Network Embeddings**: Use neural networks to generate context vectors
2. **Hierarchical Memory**: Implement hierarchical pattern storage (short-term, medium-term, long-term)
3. **Cross-User Learning**: Aggregate patterns across users (with anonymization)
4. **Reinforcement Learning**: Use RL for suggestion strategy optimization
5. **Explainable AI**: Provide explanations for personalized suggestions
6. **Multi-Modal Context**: Include audio, video, and other modalities in context vectors

---

## Compliance

### GDPR Compliance

- Right to access: `export_profile()`
- Right to deletion: `delete_profile()`
- Right to portability: `export_data()`, `import_data()`
- Data minimization: Store only anonymized patterns

### Accessibility

- Provide alternative UI for suggestion display
- Support keyboard navigation
- Support screen readers

---

## Conclusion

This specification defines the API and requirements for the Contextual Memory System, extending the Intelligence module with long-term pattern storage, learning capabilities, and personalization. The system follows Glass Box AI principles (transparent reasoning) and maintains architectural coherence with the existing Consciousness Stack.

**Key Features**:
- SQLite-based storage (embedded, ACID compliant)
- 64-dimensional context vectors (sufficient complexity, manageable size)
- Cosine similarity matching (fast, scale-invariant)
- Temporal decay (prioritizes recent behavior)
- Feedback learning (adapts to user preferences)
- Pattern refinement (optimizes over time)
- Personalization (tailors to individual users)
- A/B testing (validates improvements)
- WebSocket integration (real-time communication)

**Next Steps**: Implement according to task list in `tasks.md`.

---

*This specification follows the Spec-First Development principle and maintains Glass Box AI transparency.*
