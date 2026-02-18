# Phase 25 Week 4: Design Document

**Status**: Proposed
**Date**: January 21, 2026
**Version**: 1.0

## Architecture Overview

Week 4 extends the intelligence system with visualization, integration, optimization, and deployment capabilities.

```
┌─────────────────────────────────────────────────────────────────┐
│                    Week 4 Architecture                           │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌──────────────┐      ┌──────────────┐      ┌──────────────┐  │
│  │   UI Layer   │      │ Integration  │      │ Optimization │  │
│  │              │      │    Layer     │      │    Layer     │  │
│  │  - Inspector │      │  - Evolution │      │  - Compactor │  │
│  │  - Server    │      │  - Bridge    │      │  - Scheduler │  │
│  └──────┬───────┘      └──────┬───────┘      └──────┬───────┘  │
│         │                     │                     │           │
│         └─────────────────────┼─────────────────────┘           │
│                               │                                 │
│  ┌────────────────────────────┴──────────────────────────────┐  │
│  │              Week 3 Foundation (COMPLETE)                  │  │
│  │  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │  │
│  │  │   Core   │  │ Learning │  │  Testing │  │Orchestr. │  │  │
│  │  └──────────┘  └──────────┘  └──────────┘  └──────────┘  │  │
│  └────────────────────────────────────────────────────────────┘  │
│                                                                  │
│  ┌────────────────────────────────────────────────────────────┐  │
│  │                 Deployment Layer                            │  │
│  │  - Logging  - Monitoring  - Config  - Health Checks        │  │
│  └────────────────────────────────────────────────────────────┘  │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

## Component Design

### 1. Memory Graph Inspector UI

#### Architecture
```
┌─────────────────────────────────────────────────────────────┐
│                    Browser (Frontend)                        │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  Graph View  │  │   Controls   │  │   Details    │      │
│  │   (D3.js)    │  │   (Filters)  │  │   (Panel)    │      │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘      │
│         │                 │                 │               │
│         └─────────────────┼─────────────────┘               │
│                           │                                 │
│                      WebSocket                              │
│                           │                                 │
└───────────────────────────┼─────────────────────────────────┘
                            │
┌───────────────────────────┼─────────────────────────────────┐
│                    FastAPI Server                            │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  Pattern API │  │   Graph API  │  │  Export API  │      │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘      │
│         │                 │                 │               │
│         └─────────────────┼─────────────────┘               │
│                           │                                 │
│  ┌────────────────────────┴──────────────────────────────┐  │
│  │         MemoryGraphInspector                          │  │
│  │  - get_patterns()                                     │  │
│  │  - get_graph_data()                                   │  │
│  │  - search_similar()                                   │  │
│  │  - get_clusters()                                     │  │
│  └────────────────────────┬──────────────────────────────┘  │
│                           │                                 │
└───────────────────────────┼─────────────────────────────────┘
                            │
┌───────────────────────────┼─────────────────────────────────┐
│              Week 3 Intelligence System                      │
│  ┌────────────────────────┴──────────────────────────────┐  │
│  │         ContextualMemory + PatternMatcher             │  │
│  └───────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

#### Data Flow
```
1. User opens Memory Graph Inspector
   ↓
2. Frontend requests graph data: GET /api/memory/graph
   ↓
3. Server queries ContextualMemory for all patterns
   ↓
4. Server generates graph structure (nodes + edges)
   ↓
5. Server returns JSON: {nodes: [...], edges: [...]}
   ↓
6. Frontend renders force-directed graph with D3.js
   ↓
7. User clicks node
   ↓
8. Frontend requests pattern details: GET /api/memory/patterns/{id}
   ↓
9. Server returns pattern metadata
   ↓
10. Frontend displays in details panel
```

#### Graph Data Structure
```json
{
  "nodes": [
    {
      "id": "pattern_123",
      "label": "Edit Python file",
      "goal_category": "EDIT_CODE",
      "success_rate": 0.85,
      "access_count": 42,
      "last_accessed": 1234567890.0,
      "context_vector": [0.1, 0.2, ...],
      "size": 10
    }
  ],
  "edges": [
    {
      "source": "pattern_123",
      "target": "pattern_456",
      "similarity": 0.92,
      "weight": 5
    }
  ],
  "clusters": [
    {
      "id": "EDIT_CODE",
      "label": "Code Editing",
      "patterns": ["pattern_123", "pattern_456"],
      "color": "#00ff00"
    }
  ]
}
```

### 2. Evolution Daemon V8 Integration

#### Architecture
```
┌─────────────────────────────────────────────────────────────┐
│              Intelligence System                             │
│  ┌──────────────────────────────────────────────────────┐   │
│  │         PersonalizationEngine                        │   │
│  │  - Generates personalized suggestions                │   │
│  │  - Tracks acceptance/rejection rates                 │   │
│  └────────────────────┬─────────────────────────────────┘   │
│                       │                                      │
│  ┌────────────────────┴─────────────────────────────────┐   │
│  │         EvolutionAdapter                             │   │
│  │  - send_effectiveness_data()                         │   │
│  │  - receive_reflections()                             │   │
│  │  - maintain_connection()                             │   │
│  └────────────────────┬─────────────────────────────────┘   │
│                       │                                      │
└───────────────────────┼──────────────────────────────────────┘
                        │
                   Unix Socket
                /tmp/evolution_daemon.sock
                        │
┌───────────────────────┼──────────────────────────────────────┐
│              Evolution Daemon V8                             │
│  ┌────────────────────┴─────────────────────────────────┐   │
│  │         ConsciousnessDaemon                          │   │
│  │  - Receives PERSONALIZATION_EFFECTIVENESS            │   │
│  │  - Generates METACOGNITIVE_REFLECTION                │   │
│  │  - Sends reflection back to intelligence             │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

#### Message Flow
```
1. PersonalizationEngine generates suggestion
   ↓
2. User accepts/rejects suggestion
   ↓
3. ABTestingEngine calculates effectiveness
   ↓
4. EvolutionAdapter sends PERSONALIZATION_EFFECTIVENESS
   {
     "type": "PERSONALIZATION_EFFECTIVENESS",
     "data": {
       "lift": 0.295,
       "p_value": 0.0000,
       "is_significant": true
     }
   }
   ↓
5. ConsciousnessDaemon receives message
   ↓
6. ConsciousnessDaemon generates reflection
   "Personalization shows 29.5% lift - continue strategy"
   ↓
7. ConsciousnessDaemon sends METACOGNITIVE_REFLECTION
   {
     "type": "METACOGNITIVE_REFLECTION",
     "data": {
       "reflection": "...",
       "suggestions": [...]
     }
   }
   ↓
8. EvolutionAdapter receives reflection
   ↓
9. PersonalizationEngine adjusts strategy
```

### 3. Context Compaction

#### Architecture
```
┌─────────────────────────────────────────────────────────────┐
│              ContextCompactor                                │
│  ┌──────────────────────────────────────────────────────┐   │
│  │  compact_patterns(patterns, threshold=0.95)          │   │
│  │                                                       │   │
│  │  1. Group by goal category                           │   │
│  │  2. Sort by access count (most accessed first)       │   │
│  │  3. Merge similar patterns (similarity > threshold)  │   │
│  │  4. Preserve metadata (merged_patterns list)         │   │
│  │  5. Return compacted patterns                        │   │
│  └──────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

#### Compaction Algorithm
```python
def compact_patterns(patterns: List[Pattern], threshold: float = 0.95) -> List[Pattern]:
    # Group by goal category
    by_goal = defaultdict(list)
    for pattern in patterns:
        by_goal[pattern.goal_category].append(pattern)
    
    compacted = []
    for goal, goal_patterns in by_goal.items():
        # Sort by access count (most accessed first)
        sorted_patterns = sorted(goal_patterns, 
                               key=lambda p: p.access_count, 
                               reverse=True)
        
        # Merge similar patterns
        merged = []
        for pattern in sorted_patterns:
            # Check if similar to any already merged
            similar = [p for p in merged 
                      if cosine_similarity(pattern.context_vector, p.context_vector) > threshold]
            
            if similar:
                # Merge into most similar pattern
                similar[0].metadata['merged_patterns'] = similar[0].metadata.get('merged_patterns', []) + [pattern.id]
                similar[0].access_count += pattern.access_count
            else:
                merged.append(pattern)
        
        compacted.extend(merged)
    
    return compacted
```

#### Compaction Scheduler
```python
class CompactionScheduler:
    def __init__(self, compactor: ContextCompactor, trigger_count: int = 1000):
        self.compactor = compactor
        self.trigger_count = trigger_count
        self.pattern_count = 0
        
    def on_pattern_added(self, pattern: Pattern):
        self.pattern_count += 1
        if self.pattern_count >= self.trigger_count:
            self.run_compaction()
            self.pattern_count = 0
    
    def run_compaction(self):
        # Backup current patterns
        backup = self.compactor.backup_patterns()
        
        # Run compaction
        compacted = self.compactor.compact_patterns()
        
        # Verify no data loss
        if self.compactor.verify_compaction(backup, compacted):
            self.compactor.save_compacted(compacted)
        else:
            self.compactor.restore_from_backup(backup)
```

### 4. Production Deployment

#### Logging Architecture
```
┌─────────────────────────────────────────────────────────────┐
│              Application Code                                │
│  logger.info("Pattern retrieved", extra={                    │
│      "pattern_id": pattern.id,                               │
│      "goal_category": pattern.goal_category,                 │
│      "latency_ms": 2.5                                       │
│  })                                                          │
└────────────────────────┬────────────────────────────────────┘
                         │
┌────────────────────────┴────────────────────────────────────┐
│              Structured Logger                               │
│  {                                                           │
│    "timestamp": "2026-01-21T14:00:00Z",                      │
│    "level": "INFO",                                          │
│    "module": "contextual_memory",                            │
│    "message": "Pattern retrieved",                           │
│    "pattern_id": "pattern_123",                              │
│    "goal_category": "EDIT_CODE",                             │
│    "latency_ms": 2.5                                         │
│  }                                                           │
└────────────────────────┬────────────────────────────────────┘
                         │
┌────────────────────────┴────────────────────────────────────┐
│              Log Rotation                                    │
│  - Daily rotation                                            │
│  - 30-day retention                                          │
│  - Compression after 7 days                                  │
└─────────────────────────────────────────────────────────────┘
```

#### Monitoring Architecture
```
┌─────────────────────────────────────────────────────────────┐
│              Health Check Endpoint                           │
│  GET /health                                                 │
│  {                                                           │
│    "status": "healthy",                                      │
│    "checks": {                                               │
│      "database": "ok",                                       │
│      "evolution_daemon": "ok",                               │
│      "memory_usage": "ok",                                   │
│      "performance": "ok"                                     │
│    },                                                        │
│    "metrics": {                                              │
│      "pattern_count": 1234,                                  │
│      "avg_latency_ms": 2.5,                                  │
│      "error_rate": 0.001,                                    │
│      "uptime_seconds": 86400                                 │
│    }                                                         │
│  }                                                           │
└─────────────────────────────────────────────────────────────┘
```

## Performance Considerations

### Memory Graph Inspector
- **Rendering**: Use canvas for >1000 nodes (better performance than SVG)
- **Data Loading**: Implement pagination for large datasets
- **Caching**: Cache graph data for 5 minutes
- **Updates**: Use WebSocket for real-time updates

### Evolution Daemon Integration
- **Connection Pooling**: Maintain single persistent connection
- **Message Batching**: Batch multiple messages to reduce overhead
- **Async I/O**: Use asyncio for non-blocking communication
- **Retry Logic**: Exponential backoff on connection failures

### Context Compaction
- **Incremental Compaction**: Only compact new patterns
- **Background Processing**: Run compaction in separate thread
- **Memory Efficiency**: Stream patterns instead of loading all
- **Verification**: Quick sanity checks before committing

### Production Deployment
- **Lazy Loading**: Load modules only when needed
- **Connection Pooling**: Reuse database connections
- **Caching**: Cache frequently accessed data
- **Monitoring Overhead**: <1% of total runtime

## Security Considerations

### API Security
- **Authentication**: API key required for all endpoints
- **Rate Limiting**: 100 requests/minute per client
- **Input Validation**: Strict schema validation
- **CORS**: Whitelist allowed origins

### Data Security
- **Encryption**: Encrypt sensitive pattern data
- **Access Control**: Role-based access to patterns
- **Audit Logging**: Log all data access
- **Backup**: Encrypted backups every 24 hours

## Visual Impact

### Geometric Integrity
- **Graph Layout**: Force-directed layout maintains spatial relationships
- **Color Coding**: Goal categories use consistent color palette
- **Node Sizing**: Size represents access frequency (visual weight)
- **Edge Thickness**: Thickness represents similarity strength

### PAS Score Impact
- **Symmetry**: +0.05 (UI layer adds balanced structure)
- **Stability**: +0.10 (Monitoring and error handling)
- **Integrity**: +0.05 (Data validation and backup)
- **Overall PAS**: +0.07 (local improvement)

---

**Status**: Ready for Implementation
**Foundation**: Week 3 Complete ✅
**Timeline**: January 22-24, 2026
