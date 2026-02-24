# Heaper Knowledge Blocks: Associative Cognition for Swarm Intelligence

> **Status:** Design Approved
> **Date:** 2026-02-24
> **Inspired by:** [Heaper PKM](https://heaper.de/) - The Architecture of Associative Cognition

## Executive Summary

Integration of Heaper's post-hierarchical knowledge management principles into Geometry OS. Transforms isolated agents into a unified neural digital substrate by treating every entity (Agent, Task, Experience, Tag) as a polymorphic `KnowledgeBlock` with bidirectional linking.

**Core Innovation:** Replace hierarchical folders with emergent associative networks, making swarm intelligence visible and queryable.

---

## Problem Statement

### The Crisis of the Digital Filing Cabinet

Traditional hierarchical organization fails for swarm intelligence because:

1. **Rigid Taxonomy** - Tasks must be "filed" in one location
2. **No Cross-Pollination** - Agents can't see related work across projects
3. **Knowledge Fragmentation** - Experiences are siloed per agent
4. **Invisible Connections** - Relationships between entities are implicit

### Geometry OS Context

Current systems:
- `EpisodicMemory` - Agent experiences with embeddings
- `TaskBoard` - Work queue with status lifecycle
- `NEBBus` - Topic-based pub/sub
- `GuildAgents` - Specialized workers (Engineer, Reviewer, Architect)

**Gap:** No unified linking layer between these systems.

---

## Design: KnowledgeBlock Architecture

### Core Data Model

```python
@dataclass
class KnowledgeBlock:
    """
    Atomic unit of Geometry OS intelligence.

    Wraps existing entities (Tasks, Experiences, Agents) with
    Heaper-style bidirectional linking.
    """
    # Identity
    block_id: str                    # Unique ID (e.g., 'task-042', 'agent-delta')
    block_type: BlockType            # TASK, EXPERIENCE, AGENT, TAG, CONCEPT

    # Content (polymorphic)
    content: Dict[str, Any]          # The wrapped entity data
    content_hash: str                # SHA-256 for de-duplication

    # Heaper Linking Mechanics
    mentions: List[str]              # Outgoing @links to other block_ids
    tags: List[str]                  # Outgoing #links to tag_names
    backlinks: List[str]             # Auto-populated: who mentions ME?

    # Semantic Intelligence
    embedding: List[float]           # 128-dim vector for similarity search
    pas_score: float                 # Phase Alignment Stability (0.0-1.0)

    # Provenance
    author_id: str                   # Agent who created/modified this
    created_at: float
    updated_at: float
    version: int                     # For CRDT synchronization
```

### BlockType Registry

```python
class BlockType(Enum):
    """Types of knowledge blocks."""
    TASK = "task"                    # A task from TaskBoard
    EXPERIENCE = "experience"        # An agent experience
    AGENT = "agent"                  # Agent profile/capabilities
    TAG = "tag"                      # A #tag with its own metadata
    CONCEPT = "concept"              # Emergent concept (auto-created)
    DOCUMENT = "document"            # External reference (file, URL)
```

### Tags Are Blocks

Following Heaper's philosophy, a `#tag` is itself a block:

```python
auth_tag = KnowledgeBlock(
    block_id="tag:auth-module",
    block_type=BlockType.TAG,
    content={
        "name": "auth-module",
        "description": "Authentication module work",
        "related_projects": ["geometry-os"],
        "owner_agent": "architect-001"
    },
    mentions=["@task-042", "@experience-123"],
    backlinks=[],  # Auto-populated
    pas_score=0.85,
    ...
)
```

---

## Linking Mechanics: The Beam Engine

### Bidirectional Links

Links in Geometry OS are not just pointers - they are **Memory Beams** visible on the Infinite Map.

```
┌─────────────┐     mentions     ┌─────────────┐
│ Experience  │ ───────────────► │    Task     │
│   Block     │                  │   Block     │
│             │ ◄─────────────── │             │
└─────────────┘    backlinks     └─────────────┘
```

### Automatic Backlinking

When Agent A creates an `ExperienceBlock` mentioning `@task-123`:

1. System creates the ExperienceBlock with `mentions: ["task-123"]`
2. System automatically updates `task-123.backlinks.append(experience_id)`
3. Visual Shell renders a "beam" between the tiles

### Visual Beams

The `visual_shell` (PixiJS) renders lines between tiles based on mentions:

| Beam Property | Meaning |
|---------------|---------|
| **Thickness** | Link density (frequently used connections) |
| **Color** | Link type (task-experience, agent-task, tag-cluster) |
| **Opacity** | Recency of last interaction |
| **Animation** | Active data flow (pulses for NEB events) |

---

## Unlinked View: Entropy Management

### Orphaned Knowledge Detection

Any block with `len(mentions) == 0` and `len(backlinks) == 0` is **Orphaned Knowledge**.

```python
def get_unlinked_blocks(registry: BlockRegistry) -> List[KnowledgeBlock]:
    """Return blocks needing connection."""
    return [
        b for b in registry.all()
        if len(b.mentions) == 0 and len(b.backlinks) == 0
    ]
```

### Swarm Protocol

| Component | Responsibility |
|-----------|----------------|
| `SocraticDaemon` | Periodically queries for unlinked blocks |
| `Visual Shell` | Displays orphaned blocks in "Unsorted Heap" region |
| `GuildAgents` | Earn PAS Credits for linking orphaned blocks |

### PAS Credits (Incentive System)

```
Agent links orphaned experience → +0.1 PAS Credits
Agent creates new tag connecting 3+ blocks → +0.3 PAS Credits
Agent de-duplicates redundant blocks → +0.2 PAS Credits
```

---

## CRDT-based Swarm Sync

Since multiple agents may edit a block concurrently, we use Conflict-Free Replicated Data Types:

### Field Types

| Field | CRDT Type | Merge Strategy |
|-------|-----------|----------------|
| `summary` | LWW-Register | Last-Write-Wins (timestamp) |
| `mentions` | OR-Set | Union of all additions |
| `tags` | OR-Set | Union of all additions |
| `status` | LWW-Register | Last-Write-Wins |
| `content` | LWW-Register | Content-hash determines winner |

### OR-Set Semantics

```python
# Agent A adds #debug, Agent B adds #fix concurrently
# Result: both tags preserved
block_A.tags = {"debug"}
block_B.tags = {"fix"}
merged.tags = {"debug", "fix"}  # Union
```

### De-duplication Protocol

Before creating a new block:

1. Compute `content_hash = SHA-256(content)`
2. Query registry for existing block with same hash
3. If found: add `@mention` to existing block instead of creating new
4. If not found: proceed with creation

---

## Block Registry API

```python
class BlockRegistry:
    """
    Central registry for all knowledge blocks.

    Provides CRUD, linking, and query operations.
    """

    def create(self, block_type: BlockType, content: Dict,
               mentions: List[str] = None, tags: List[str] = None) -> KnowledgeBlock

    def get(self, block_id: str) -> Optional[KnowledgeBlock]

    def update(self, block_id: str, updates: Dict) -> KnowledgeBlock

    def delete(self, block_id: str) -> bool

    def link(self, from_id: str, to_id: str) -> bool
    """Create bidirectional link: from mentions to, to backlinks from."""

    def unlink(self, from_id: str, to_id: str) -> bool
    """Remove bidirectional link."""

    def query_by_tag(self, tag: str) -> List[KnowledgeBlock]

    def query_by_mention(self, block_id: str) -> List[KnowledgeBlock]

    def query_similar(self, embedding: List[float], k: int = 5) -> List[KnowledgeBlock]

    def get_unlinked(self) -> List[KnowledgeBlock]
    """Return blocks with no mentions or backlinks."""

    def get_tag_block(self, tag_name: str) -> KnowledgeBlock
    """Get or create a TAG block for a tag name."""

    def sync_merge(self, local_block: KnowledgeBlock,
                   remote_block: KnowledgeBlock) -> KnowledgeBlock
    """CRDT merge of two block versions."""
```

---

## Integration Points

### 1. EpisodicMemory Bridge

```python
# Before (returns raw Experience)
experience = memory.store_experience(task_type, action, outcome, description)

# After (returns KnowledgeBlock wrapper)
block = memory.store_experience(
    task_type="CODE_GEN",
    action="write",
    outcome="success",
    description="Generated auth module",
    mentions=["@task-042"],        # NEW: link to task
    tags=["#auth-module", "#bugfix"]  # NEW: categorize
)
```

### 2. TaskBoard Integration

```python
# When task is posted, create TaskBlock
task = task_board.post(task_type, description)
block = registry.create(
    block_type=BlockType.TASK,
    content=task.to_dict(),
    tags=["#pending"]
)
```

### 3. NEBBus Events

```python
# Publish block events on NEB
registry.subscribe_to_changes(
    on_create=lambda b: bus.publish("block.created", b.to_dict()),
    on_link=lambda src, tgt: bus.publish("block.linked", {"from": src, "to": tgt}),
    on_unlink=lambda src, tgt: bus.publish("block.unlinked", {"from": src, "to": tgt})
)
```

### 4. Visual Shell Rendering

```javascript
// MemoryBeamRenderer.js
class MemoryBeamRenderer {
  renderBlockLinks(blocks) {
    blocks.forEach(block => {
      block.mentions.forEach(targetId => {
        this.drawBeam(block.block_id, targetId, {
          thickness: this.calculateThickness(block, targetId),
          color: this.getLinkColor(block.block_type),
          opacity: this.getRecencyOpacity(block.updated_at)
        });
      });
    });
  }
}
```

---

## Visual Map Layout

### Hilbert Space Mapping

Linked blocks cluster spatially using Hilbert curve positioning:

```
┌────────────────────────────────────────┐
│  #auth-module neighborhood             │
│  ┌─────┐     ┌─────┐                   │
│  │Task │─────│Exp. │                   │
│  │ 042 │     │ 123 │                   │
│  └─────┘     └─────┘                   │
│      │                                   │
│      ▼                                   │
│  ┌─────┐                                │
│  │Tag  │  #auth-module                  │
│  │Block│  (cluster center)              │
│  └─────┘                                │
│                                         │
│         ┌─────────────────┐             │
│         │  Unsorted Heap  │             │
│         │  (orphaned)     │             │
│         └─────────────────┘             │
└────────────────────────────────────────┘
```

### Link Score Calculation

```python
def calculate_link_score(block: KnowledgeBlock) -> float:
    """
    Calculate connection density (0.0-1.0).

    Higher score = more integrated into knowledge graph.
    """
    outgoing = len(block.mentions) + len(block.tags)
    incoming = len(block.backlinks)
    total = outgoing + incoming

    # Diminishing returns for very connected blocks
    return min(1.0, total / 10.0) * (1 - 0.1 * max(0, total - 10))
```

---

## Implementation Roadmap

| Phase | Component | Deliverable |
|-------|-----------|-------------|
| **I** | `systems/swarm/knowledge/` | KnowledgeBlock, BlockRegistry, BlockType |
| **II** | EpisodicMemory Bridge | Update to return KnowledgeBlock with linking |
| **III** | TaskBoard Integration | Auto-create TaskBlocks on task post |
| **IV** | `visual_shell` | MemoryBeamRenderer.js for visual links |
| **V** | `infinite_map_rs` | Spatial layout optimization for linked blocks |
| **VI** | CRDT Layer | Sync/merge primitives for multi-agent collaboration |

---

## Mental Simulation: Hilbert Coherence Validation

**Scenario:** Agent Alpha generates a code fix.

1. **Create:** Alpha creates `ExperienceBlock` with `mentions: ["@task-123"]`, `tags: ["#bugfix"]`
2. **Link:** System updates `task-123.backlinks.append(alpha_exp_id)`
3. **Visual:** TaskBlock tile sprouts "backlink beam" to new experience
4. **Spatial:** User zooms out; `#bugfix` blocks form visual neighborhood
5. **Query:** User clicks `#bugfix` tag tile; sees all related work instantly

**Verification:** ✅ Emergent structure, ✅ Bidirectional navigation, ✅ Visual comprehension

---

## Success Criteria

| Metric | Target |
|--------|--------|
| Block creation latency | < 10ms |
| Backlink update latency | < 5ms |
| Unlinked query (1000 blocks) | < 50ms |
| Visual beam rendering (100 links) | 60fps |
| CRDT merge correctness | 100% (property-based tests) |

---

## References

- [Heaper PKM](https://heaper.de/) - Original inspiration
- [The Architecture of Associative Cognition](https://heaper.de/) - Design philosophy
- `MEMORY.md` - Geometry OS system index
- `systems/swarm/` - Current swarm implementation

---

*Design approved: 2026-02-24*
