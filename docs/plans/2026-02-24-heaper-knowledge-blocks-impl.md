# Heaper Knowledge Blocks Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a KnowledgeBlock layer that wraps swarm entities with bidirectional linking, enabling emergent knowledge graphs for agent intelligence.

**Architecture:** KnowledgeBlock wraps existing entities (Task, Experience, Agent) as a thin linking layer. BlockRegistry manages CRUD, bidirectional linking, and queries. Integrates with existing EpisodicMemory and NEBBus systems.

**Tech Stack:** Python 3.11+, dataclasses, SHA-256 hashing, existing swarm infrastructure

---

## Phase I: Core Data Model

### Task 1: BlockType Enum and KnowledgeBlock Dataclass

**Files:**
- Create: `systems/swarm/knowledge/__init__.py`
- Create: `systems/swarm/knowledge/block.py`
- Create: `tests/swarm/knowledge/__init__.py`
- Create: `tests/swarm/knowledge/test_block.py`

**Step 1: Write the failing test**

```python
# tests/swarm/knowledge/test_block.py
"""Tests for KnowledgeBlock dataclass."""

import pytest
from systems.swarm.knowledge.block import KnowledgeBlock, BlockType


class TestBlockType:
    """Test BlockType enum values."""

    def test_block_type_values(self):
        """BlockType should have expected values."""
        assert BlockType.TASK.value == "task"
        assert BlockType.EXPERIENCE.value == "experience"
        assert BlockType.AGENT.value == "agent"
        assert BlockType.TAG.value == "tag"
        assert BlockType.CONCEPT.value == "concept"
        assert BlockType.DOCUMENT.value == "document"


class TestKnowledgeBlock:
    """Test KnowledgeBlock dataclass."""

    def test_create_task_block(self):
        """Should create a basic task block."""
        block = KnowledgeBlock(
            block_id="task-001",
            block_type=BlockType.TASK,
            content={"description": "Fix auth bug"},
            content_hash="abc123"
        )
        assert block.block_id == "task-001"
        assert block.block_type == BlockType.TASK
        assert block.mentions == []
        assert block.backlinks == []
        assert block.tags == []
        assert block.version == 1

    def test_block_with_mentions(self):
        """Should create block with mentions."""
        block = KnowledgeBlock(
            block_id="exp-001",
            block_type=BlockType.EXPERIENCE,
            content={"description": "Fixed auth bug"},
            content_hash="def456",
            mentions=["task-001", "agent-alpha"]
        )
        assert block.mentions == ["task-001", "agent-alpha"]

    def test_block_with_tags(self):
        """Should create block with tags."""
        block = KnowledgeBlock(
            block_id="exp-001",
            block_type=BlockType.EXPERIENCE,
            content={"description": "Fixed auth bug"},
            content_hash="def456",
            tags=["#bugfix", "#auth"]
        )
        assert block.tags == ["#bugfix", "#auth"]

    def test_block_default_values(self):
        """Should have sensible defaults."""
        block = KnowledgeBlock(
            block_id="test",
            block_type=BlockType.CONCEPT,
            content={},
            content_hash="hash"
        )
        assert block.mentions == []
        assert block.tags == []
        assert block.backlinks == []
        assert block.embedding == []
        assert block.pas_score == 0.0
        assert block.version == 1
        assert block.is_linked == False
        assert block.link_score == 0.0

    def test_to_dict(self):
        """Should serialize to dictionary."""
        block = KnowledgeBlock(
            block_id="task-001",
            block_type=BlockType.TASK,
            content={"description": "Test"},
            content_hash="hash123"
        )
        d = block.to_dict()
        assert d["block_id"] == "task-001"
        assert d["block_type"] == "task"
        assert d["version"] == 1

    def test_from_dict(self):
        """Should deserialize from dictionary."""
        d = {
            "block_id": "exp-001",
            "block_type": "experience",
            "content": {"description": "Test"},
            "content_hash": "hash",
            "mentions": ["task-001"],
            "tags": ["#test"],
            "backlinks": [],
            "embedding": [],
            "pas_score": 0.5,
            "author_id": "agent-alpha",
            "created_at": 1234567890.0,
            "updated_at": 1234567890.0,
            "version": 1,
            "is_linked": True,
            "link_score": 0.3
        }
        block = KnowledgeBlock.from_dict(d)
        assert block.block_id == "exp-001"
        assert block.block_type == BlockType.EXPERIENCE
        assert block.mentions == ["task-001"]
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/knowledge/test_block.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.swarm.knowledge'"

**Step 3: Create package structure**

```python
# systems/swarm/knowledge/__init__.py
"""Knowledge Block system for associative linking."""

from systems.swarm.knowledge.block import KnowledgeBlock, BlockType

__all__ = ["KnowledgeBlock", "BlockType"]
```

```python
# systems/swarm/knowledge/block.py
"""KnowledgeBlock dataclass and BlockType enum."""

import time
import hashlib
import json
from dataclasses import dataclass, field, asdict
from enum import Enum
from typing import List, Dict, Any, Optional


class BlockType(Enum):
    """Types of knowledge blocks."""
    TASK = "task"
    EXPERIENCE = "experience"
    AGENT = "agent"
    TAG = "tag"
    CONCEPT = "concept"
    DOCUMENT = "document"


@dataclass
class KnowledgeBlock:
    """
    Atomic unit of Geometry OS intelligence.

    Wraps existing entities (Tasks, Experiences, Agents) with
    Heaper-style bidirectional linking.
    """
    block_id: str
    block_type: BlockType
    content: Dict[str, Any]
    content_hash: str

    # Heaper Linking Mechanics
    mentions: List[str] = field(default_factory=list)
    tags: List[str] = field(default_factory=list)
    backlinks: List[str] = field(default_factory=list)

    # Semantic Intelligence
    embedding: List[float] = field(default_factory=list)
    pas_score: float = 0.0

    # Provenance
    author_id: str = ""
    created_at: float = field(default_factory=time.time)
    updated_at: float = field(default_factory=time.time)
    version: int = 1

    # State
    is_linked: bool = False
    link_score: float = 0.0

    def to_dict(self) -> Dict[str, Any]:
        """Serialize to dictionary."""
        d = asdict(self)
        d["block_type"] = self.block_type.value
        return d

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "KnowledgeBlock":
        """Deserialize from dictionary."""
        data = data.copy()
        data["block_type"] = BlockType(data["block_type"])
        return cls(**data)

    def compute_link_score(self) -> float:
        """Calculate connection density (0.0-1.0)."""
        outgoing = len(self.mentions) + len(self.tags)
        incoming = len(self.backlinks)
        total = outgoing + incoming
        # Diminishing returns for very connected blocks
        return min(1.0, total / 10.0) * (1 - 0.1 * max(0, total - 10))

    def update_link_score(self) -> None:
        """Update link_score based on current connections."""
        self.link_score = self.compute_link_score()
        self.is_linked = self.link_score > 0.0
```

```python
# tests/swarm/knowledge/__init__.py
"""Tests for knowledge block system."""
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/knowledge/test_block.py -v`
Expected: 7 passed

**Step 5: Commit**

```bash
git add systems/swarm/knowledge/__init__.py systems/swarm/knowledge/block.py tests/swarm/knowledge/
git commit -m "feat(knowledge): add KnowledgeBlock dataclass and BlockType enum"
```

---

### Task 2: Content Hashing Utility

**Files:**
- Modify: `systems/swarm/knowledge/block.py`
- Modify: `tests/swarm/knowledge/test_block.py`

**Step 1: Write the failing test**

```python
# Add to tests/swarm/knowledge/test_block.py

class TestContentHashing:
    """Test content hash computation."""

    def test_compute_content_hash(self):
        """Should compute SHA-256 hash of content."""
        from systems.swarm.knowledge.block import compute_content_hash

        content = {"description": "Test content", "value": 42}
        hash1 = compute_content_hash(content)
        hash2 = compute_content_hash(content)

        assert hash1 == hash2
        assert len(hash1) == 64  # SHA-256 hex digest

    def test_different_content_different_hash(self):
        """Different content should produce different hashes."""
        from systems.swarm.knowledge.block import compute_content_hash

        hash1 = compute_content_hash({"a": 1})
        hash2 = compute_content_hash({"a": 2})

        assert hash1 != hash2

    def test_key_order_independent(self):
        """Hash should be independent of dict key order."""
        from systems.swarm.knowledge.block import compute_content_hash

        # Create dicts with same content but different order
        import json
        content1 = {"a": 1, "b": 2}
        content2 = {"b": 2, "a": 1}

        hash1 = compute_content_hash(content1)
        hash2 = compute_content_hash(content2)

        assert hash1 == hash2
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/knowledge/test_block.py::TestContentHashing -v`
Expected: FAIL with "cannot import name 'compute_content_hash'"

**Step 3: Implement content hashing**

```python
# Add to systems/swarm/knowledge/block.py

def compute_content_hash(content: Dict[str, Any]) -> str:
    """
    Compute SHA-256 hash of content dictionary.

    Uses sorted JSON serialization for deterministic hashing.

    Args:
        content: Dictionary to hash

    Returns:
        Hex digest of SHA-256 hash (64 characters)
    """
    # Sort keys for deterministic serialization
    serialized = json.dumps(content, sort_keys=True)
    return hashlib.sha256(serialized.encode()).hexdigest()
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/knowledge/test_block.py::TestContentHashing -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/swarm/knowledge/block.py tests/swarm/knowledge/test_block.py
git commit -m "feat(knowledge): add compute_content_hash for de-duplication"
```

---

## Phase II: Block Registry

### Task 3: BlockRegistry Basic CRUD

**Files:**
- Create: `systems/swarm/knowledge/registry.py`
- Create: `tests/swarm/knowledge/test_registry.py`

**Step 1: Write the failing test**

```python
# tests/swarm/knowledge/test_registry.py
"""Tests for BlockRegistry."""

import pytest
from systems.swarm.knowledge.registry import BlockRegistry
from systems.swarm.knowledge.block import KnowledgeBlock, BlockType, compute_content_hash


class TestBlockRegistryCRUD:
    """Test basic CRUD operations."""

    def test_create_block(self):
        """Should create and store a block."""
        registry = BlockRegistry()
        block = registry.create(
            block_type=BlockType.TASK,
            content={"description": "Test task"}
        )

        assert block.block_id.startswith("task-")
        assert block.block_type == BlockType.TASK
        assert block.content == {"description": "Test task"}

    def test_get_block(self):
        """Should retrieve block by ID."""
        registry = BlockRegistry()
        created = registry.create(
            block_type=BlockType.EXPERIENCE,
            content={"description": "Test"}
        )

        retrieved = registry.get(created.block_id)
        assert retrieved.block_id == created.block_id
        assert retrieved.content == created.content

    def test_get_nonexistent_block(self):
        """Should return None for nonexistent block."""
        registry = BlockRegistry()
        result = registry.get("nonexistent")
        assert result is None

    def test_update_block(self):
        """Should update block content."""
        registry = BlockRegistry()
        block = registry.create(
            block_type=BlockType.TASK,
            content={"description": "Original"}
        )

        updated = registry.update(
            block.block_id,
            {"description": "Updated"}
        )

        assert updated.content == {"description": "Updated"}
        assert updated.version == 2

    def test_delete_block(self):
        """Should delete block."""
        registry = BlockRegistry()
        block = registry.create(
            block_type=BlockType.TASK,
            content={"description": "Test"}
        )

        assert registry.delete(block.block_id) is True
        assert registry.get(block.block_id) is None

    def test_delete_nonexistent(self):
        """Should return False for nonexistent delete."""
        registry = BlockRegistry()
        assert registry.delete("nonexistent") is False

    def test_list_all_blocks(self):
        """Should list all blocks."""
        registry = BlockRegistry()
        registry.create(BlockType.TASK, {"desc": "Task 1"})
        registry.create(BlockType.EXPERIENCE, {"desc": "Exp 1"})

        all_blocks = registry.all()
        assert len(all_blocks) == 2
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/knowledge/test_registry.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.swarm.knowledge.registry'"

**Step 3: Implement BlockRegistry**

```python
# systems/swarm/knowledge/registry.py
"""BlockRegistry for managing knowledge blocks."""

import uuid
import time
from typing import List, Optional, Dict, Any

from systems.swarm.knowledge.block import KnowledgeBlock, BlockType, compute_content_hash


class BlockRegistry:
    """
    Central registry for all knowledge blocks.

    Provides CRUD, linking, and query operations.
    """

    def __init__(self, storage_path: Optional[str] = None):
        """
        Initialize the registry.

        Args:
            storage_path: Optional path for JSON persistence (future)
        """
        self._blocks: Dict[str, KnowledgeBlock] = {}
        self._storage_path = storage_path

    def create(
        self,
        block_type: BlockType,
        content: Dict[str, Any],
        mentions: Optional[List[str]] = None,
        tags: Optional[List[str]] = None,
        author_id: str = "",
        block_id: Optional[str] = None
    ) -> KnowledgeBlock:
        """
        Create a new knowledge block.

        Args:
            block_type: Type of block
            content: Block content data
            mentions: Optional list of block IDs to mention
            tags: Optional list of tags
            author_id: ID of creating agent
            block_id: Optional custom ID (auto-generated if None)

        Returns:
            The created KnowledgeBlock
        """
        if block_id is None:
            prefix = block_type.value
            block_id = f"{prefix}-{uuid.uuid4().hex[:8]}"

        content_hash = compute_content_hash(content)

        block = KnowledgeBlock(
            block_id=block_id,
            block_type=block_type,
            content=content,
            content_hash=content_hash,
            mentions=mentions or [],
            tags=tags or [],
            author_id=author_id
        )

        self._blocks[block_id] = block
        return block

    def get(self, block_id: str) -> Optional[KnowledgeBlock]:
        """Get block by ID."""
        return self._blocks.get(block_id)

    def update(
        self,
        block_id: str,
        content: Optional[Dict[str, Any]] = None,
        mentions: Optional[List[str]] = None,
        tags: Optional[List[str]] = None
    ) -> Optional[KnowledgeBlock]:
        """
        Update a block.

        Args:
            block_id: Block to update
            content: New content (None to keep existing)
            mentions: New mentions (None to keep existing)
            tags: New tags (None to keep existing)

        Returns:
            Updated block or None if not found
        """
        block = self._blocks.get(block_id)
        if block is None:
            return None

        if content is not None:
            block.content = content
            block.content_hash = compute_content_hash(content)

        if mentions is not None:
            block.mentions = mentions

        if tags is not None:
            block.tags = tags

        block.updated_at = time.time()
        block.version += 1
        block.update_link_score()

        return block

    def delete(self, block_id: str) -> bool:
        """Delete a block by ID."""
        if block_id in self._blocks:
            del self._blocks[block_id]
            return True
        return False

    def all(self) -> List[KnowledgeBlock]:
        """Get all blocks."""
        return list(self._blocks.values())

    def count(self) -> int:
        """Get total block count."""
        return len(self._blocks)
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/knowledge/test_registry.py -v`
Expected: 7 passed

**Step 5: Commit**

```bash
git add systems/swarm/knowledge/registry.py tests/swarm/knowledge/test_registry.py
git commit -m "feat(knowledge): add BlockRegistry with basic CRUD"
```

---

### Task 4: Bidirectional Linking

**Files:**
- Modify: `systems/swarm/knowledge/registry.py`
- Modify: `tests/swarm/knowledge/test_registry.py`

**Step 1: Write the failing test**

```python
# Add to tests/swarm/knowledge/test_registry.py

class TestBidirectionalLinking:
    """Test bidirectional link management."""

    def test_link_blocks(self):
        """Should create bidirectional link."""
        registry = BlockRegistry()
        task = registry.create(BlockType.TASK, {"desc": "Task"})
        exp = registry.create(BlockType.EXPERIENCE, {"desc": "Exp"})

        result = registry.link(exp.block_id, task.block_id)

        assert result is True
        # Check forward link
        assert task.block_id in registry.get(exp.block_id).mentions
        # Check backlink
        assert exp.block_id in registry.get(task.block_id).backlinks

    def test_link_nonexistent_source(self):
        """Should return False for nonexistent source."""
        registry = BlockRegistry()
        target = registry.create(BlockType.TASK, {"desc": "Task"})

        assert registry.link("nonexistent", target.block_id) is False

    def test_link_nonexistent_target(self):
        """Should return False for nonexistent target."""
        registry = BlockRegistry()
        source = registry.create(BlockType.TASK, {"desc": "Task"})

        assert registry.link(source.block_id, "nonexistent") is False

    def test_unlink_blocks(self):
        """Should remove bidirectional link."""
        registry = BlockRegistry()
        task = registry.create(BlockType.TASK, {"desc": "Task"})
        exp = registry.create(BlockType.EXPERIENCE, {"desc": "Exp"})

        registry.link(exp.block_id, task.block_id)
        result = registry.unlink(exp.block_id, task.block_id)

        assert result is True
        assert task.block_id not in registry.get(exp.block_id).mentions
        assert exp.block_id not in registry.get(task.block_id).backlinks

    def test_duplicate_link_idempotent(self):
        """Duplicate link should be idempotent."""
        registry = BlockRegistry()
        task = registry.create(BlockType.TASK, {"desc": "Task"})
        exp = registry.create(BlockType.EXPERIENCE, {"desc": "Exp"})

        registry.link(exp.block_id, task.block_id)
        registry.link(exp.block_id, task.block_id)  # Second call

        # Should only appear once
        assert registry.get(exp.block_id).mentions.count(task.block_id) == 1

    def test_link_updates_link_score(self):
        """Linking should update link scores."""
        registry = BlockRegistry()
        task = registry.create(BlockType.TASK, {"desc": "Task"})
        exp = registry.create(BlockType.EXPERIENCE, {"desc": "Exp"})

        registry.link(exp.block_id, task.block_id)

        task_block = registry.get(task.block_id)
        exp_block = registry.get(exp.block_id)

        assert task_block.link_score > 0.0
        assert exp_block.link_score > 0.0
        assert task_block.is_linked is True
        assert exp_block.is_linked is True
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/knowledge/test_registry.py::TestBidirectionalLinking -v`
Expected: FAIL with "'BlockRegistry' object has no attribute 'link'"

**Step 3: Implement linking methods**

```python
# Add to BlockRegistry class in systems/swarm/knowledge/registry.py

    def link(self, from_id: str, to_id: str) -> bool:
        """
        Create bidirectional link between blocks.

        Args:
            from_id: Source block ID (adds to mentions)
            to_id: Target block ID (adds to backlinks)

        Returns:
            True if link created, False if either block not found
        """
        source = self._blocks.get(from_id)
        target = self._blocks.get(to_id)

        if source is None or target is None:
            return False

        # Add forward link (source mentions target)
        if to_id not in source.mentions:
            source.mentions.append(to_id)

        # Add backlink (target is mentioned by source)
        if from_id not in target.backlinks:
            target.backlinks.append(from_id)

        # Update link scores
        source.update_link_score()
        target.update_link_score()
        source.updated_at = time.time()
        target.updated_at = time.time()

        return True

    def unlink(self, from_id: str, to_id: str) -> bool:
        """
        Remove bidirectional link between blocks.

        Args:
            from_id: Source block ID
            to_id: Target block ID

        Returns:
            True if link removed, False if either block not found
        """
        source = self._blocks.get(from_id)
        target = self._blocks.get(to_id)

        if source is None or target is None:
            return False

        # Remove forward link
        if to_id in source.mentions:
            source.mentions.remove(to_id)

        # Remove backlink
        if from_id in target.backlinks:
            target.backlinks.remove(from_id)

        # Update link scores
        source.update_link_score()
        target.update_link_score()
        source.updated_at = time.time()
        target.updated_at = time.time()

        return True
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/knowledge/test_registry.py::TestBidirectionalLinking -v`
Expected: 5 passed

**Step 5: Commit**

```bash
git add systems/swarm/knowledge/registry.py tests/swarm/knowledge/test_registry.py
git commit -m "feat(knowledge): add bidirectional linking to BlockRegistry"
```

---

### Task 5: Tag and Query Operations

**Files:**
- Modify: `systems/swarm/knowledge/registry.py`
- Modify: `tests/swarm/knowledge/test_registry.py`

**Step 1: Write the failing test**

```python
# Add to tests/swarm/knowledge/test_registry.py

class TestTagAndQuery:
    """Test tag and query operations."""

    def test_query_by_tag(self):
        """Should find blocks by tag."""
        registry = BlockRegistry()
        registry.create(BlockType.TASK, {"desc": "Task 1"}, tags=["#auth"])
        registry.create(BlockType.TASK, {"desc": "Task 2"}, tags=["#auth", "#urgent"])
        registry.create(BlockType.TASK, {"desc": "Task 3"}, tags=["#ui"])

        results = registry.query_by_tag("#auth")

        assert len(results) == 2
        assert all("#auth" in b.tags for b in results)

    def test_query_by_mention(self):
        """Should find blocks that mention a specific block."""
        registry = BlockRegistry()
        target = registry.create(BlockType.TASK, {"desc": "Target"})
        registry.create(BlockType.EXPERIENCE, {"desc": "Exp 1"}, mentions=[target.block_id])
        registry.create(BlockType.EXPERIENCE, {"desc": "Exp 2"}, mentions=[target.block_id])
        registry.create(BlockType.EXPERIENCE, {"desc": "Exp 3"})

        # Apply the links
        for block in registry.all():
            for mentioned_id in block.mentions:
                registry.link(block.block_id, mentioned_id)

        results = registry.query_by_mention(target.block_id)

        assert len(results) == 2

    def test_get_unlinked_blocks(self):
        """Should find blocks with no connections."""
        registry = BlockRegistry()
        linked = registry.create(BlockType.TASK, {"desc": "Linked"})
        registry.create(BlockType.EXPERIENCE, {"desc": "Linked exp"}, mentions=[linked.block_id])
        registry.create(BlockType.TASK, {"desc": "Orphan 1"})
        registry.create(BlockType.TASK, {"desc": "Orphan 2"})

        # Apply links
        for block in registry.all():
            for mentioned_id in block.mentions:
                registry.link(block.block_id, mentioned_id)

        unlinked = registry.get_unlinked()

        assert len(unlinked) == 2
        assert all(b.link_score == 0.0 for b in unlinked)

    def test_get_tag_block_creates_if_missing(self):
        """Should create tag block if it doesn't exist."""
        registry = BlockRegistry()

        tag_block = registry.get_tag_block("#auth")

        assert tag_block.block_type == BlockType.TAG
        assert tag_block.content.get("name") == "#auth"
        assert tag_block.block_id == "tag:auth"

    def test_get_tag_block_returns_existing(self):
        """Should return existing tag block."""
        registry = BlockRegistry()

        first = registry.get_tag_block("#auth")
        second = registry.get_tag_block("#auth")

        assert first.block_id == second.block_id

    def test_query_by_type(self):
        """Should filter blocks by type."""
        registry = BlockRegistry()
        registry.create(BlockType.TASK, {"desc": "Task 1"})
        registry.create(BlockType.TASK, {"desc": "Task 2"})
        registry.create(BlockType.EXPERIENCE, {"desc": "Exp 1"})

        tasks = registry.query_by_type(BlockType.TASK)

        assert len(tasks) == 2
        assert all(b.block_type == BlockType.TASK for b in tasks)
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/knowledge/test_registry.py::TestTagAndQuery -v`
Expected: FAIL with "'BlockRegistry' object has no attribute 'query_by_tag'"

**Step 3: Implement query methods**

```python
# Add to BlockRegistry class in systems/swarm/knowledge/registry.py

    def query_by_tag(self, tag: str) -> List[KnowledgeBlock]:
        """
        Find blocks with a specific tag.

        Args:
            tag: Tag to search for (e.g., "#auth")

        Returns:
            List of blocks with the tag
        """
        return [b for b in self._blocks.values() if tag in b.tags]

    def query_by_mention(self, block_id: str) -> List[KnowledgeBlock]:
        """
        Find blocks that mention a specific block.

        Args:
            block_id: Block ID being mentioned

        Returns:
            List of blocks that mention the given block
        """
        return [b for b in self._blocks.values() if block_id in b.mentions]

    def query_by_type(self, block_type: BlockType) -> List[KnowledgeBlock]:
        """
        Find blocks of a specific type.

        Args:
            block_type: Type to filter by

        Returns:
            List of blocks of that type
        """
        return [b for b in self._blocks.values() if b.block_type == block_type]

    def get_unlinked(self) -> List[KnowledgeBlock]:
        """
        Get blocks with no connections.

        Returns:
            List of blocks with no mentions or backlinks
        """
        return [
            b for b in self._blocks.values()
            if len(b.mentions) == 0 and len(b.backlinks) == 0
        ]

    def get_tag_block(self, tag_name: str) -> KnowledgeBlock:
        """
        Get or create a TAG block for a tag name.

        Args:
            tag_name: Tag name (e.g., "#auth")

        Returns:
            The tag block
        """
        # Normalize tag ID (remove # if present)
        normalized = tag_name.lstrip("#")
        block_id = f"tag:{normalized}"

        existing = self._blocks.get(block_id)
        if existing:
            return existing

        # Create new tag block
        return self.create(
            block_type=BlockType.TAG,
            content={"name": tag_name},
            block_id=block_id
        )
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/knowledge/test_registry.py::TestTagAndQuery -v`
Expected: 6 passed

**Step 5: Commit**

```bash
git add systems/swarm/knowledge/registry.py tests/swarm/knowledge/test_registry.py
git commit -m "feat(knowledge): add tag and query operations to BlockRegistry"
```

---

### Task 6: De-duplication

**Files:**
- Modify: `systems/swarm/knowledge/registry.py`
- Modify: `tests/swarm/knowledge/test_registry.py`

**Step 1: Write the failing test**

```python
# Add to tests/swarm/knowledge/test_registry.py

class TestDeduplication:
    """Test content de-duplication."""

    def test_find_by_content_hash(self):
        """Should find block by content hash."""
        registry = BlockRegistry()
        block = registry.create(BlockType.TASK, {"desc": "Test"})

        found = registry.find_by_content_hash(block.content_hash)

        assert found is not None
        assert found.block_id == block.block_id

    def test_find_by_content_hash_not_found(self):
        """Should return None for unknown hash."""
        registry = BlockRegistry()

        result = registry.find_by_content_hash("nonexistent_hash")

        assert result is None

    def test_create_or_link_creates_new(self):
        """Should create new block if no duplicate."""
        registry = BlockRegistry()

        block, is_new = registry.create_or_link(
            block_type=BlockType.TASK,
            content={"desc": "Unique content"}
        )

        assert is_new is True
        assert block.block_id.startswith("task-")

    def test_create_or_link_links_existing(self):
        """Should link to existing block if duplicate found."""
        registry = BlockRegistry()
        existing = registry.create(
            BlockType.TASK,
            content={"desc": "Duplicate"},
            author_id="agent-alpha"
        )

        # Try to create duplicate with different author
        block, is_new = registry.create_or_link(
            block_type=BlockType.TASK,
            content={"desc": "Duplicate"},
            author_id="agent-beta"
        )

        assert is_new is False
        assert block.block_id == existing.block_id
        # Should have backlink from beta
        assert "agent-beta" in block.backlinks or any(
            "agent-beta" in b.author_id for b in [block]
        )
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/knowledge/test_registry.py::TestDeduplication -v`
Expected: FAIL with "'BlockRegistry' object has no attribute 'find_by_content_hash'"

**Step 3: Implement de-duplication**

```python
# Add to BlockRegistry class in systems/swarm/knowledge/registry.py

    def find_by_content_hash(self, content_hash: str) -> Optional[KnowledgeBlock]:
        """
        Find block by content hash.

        Args:
            content_hash: SHA-256 hash to search for

        Returns:
            Block with matching hash, or None
        """
        for block in self._blocks.values():
            if block.content_hash == content_hash:
                return block
        return None

    def create_or_link(
        self,
        block_type: BlockType,
        content: Dict[str, Any],
        author_id: str = "",
        mentions: Optional[List[str]] = None,
        tags: Optional[List[str]] = None
    ) -> tuple[KnowledgeBlock, bool]:
        """
        Create block or link to existing if duplicate.

        Implements Heaper-style de-duplication: if content hash
        matches existing block, return existing and add reference.

        Args:
            block_type: Type of block
            content: Block content
            author_id: Creating agent ID
            mentions: Optional mentions
            tags: Optional tags

        Returns:
            Tuple of (block, is_new) where is_new is True if created
        """
        content_hash = compute_content_hash(content)
        existing = self.find_by_content_hash(content_hash)

        if existing:
            # Record that this author also has this content
            # (For now, just return existing - future: track all authors)
            return existing, False

        # No duplicate, create new
        block = self.create(
            block_type=block_type,
            content=content,
            author_id=author_id,
            mentions=mentions,
            tags=tags
        )
        return block, True
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/knowledge/test_registry.py::TestDeduplication -v`
Expected: 4 passed

**Step 5: Commit**

```bash
git add systems/swarm/knowledge/registry.py tests/swarm/knowledge/test_registry.py
git commit -m "feat(knowledge): add content-based de-duplication"
```

---

## Phase III: EpisodicMemory Integration

### Task 7: Memory Block Bridge

**Files:**
- Create: `systems/swarm/knowledge/memory_bridge.py`
- Create: `tests/swarm/knowledge/test_memory_bridge.py`

**Step 1: Write the failing test**

```python
# tests/swarm/knowledge/test_memory_bridge.py
"""Tests for MemoryBlockBridge."""

import pytest
from systems.swarm.knowledge.memory_bridge import MemoryBlockBridge
from systems.swarm.knowledge.registry import BlockRegistry
from systems.swarm.knowledge.block import BlockType


class TestMemoryBlockBridge:
    """Test EpisodicMemory to KnowledgeBlock bridging."""

    def test_store_experience_creates_block(self):
        """Should create KnowledgeBlock for experience."""
        registry = BlockRegistry()
        bridge = MemoryBlockBridge(registry, agent_id="agent-alpha")

        block = bridge.store_experience(
            task_type="CODE_GEN",
            action="write",
            outcome="success",
            description="Generated auth module",
            mentions=["task-001"],
            tags=["#auth", "#bugfix"]
        )

        assert block.block_type == BlockType.EXPERIENCE
        assert "task-001" in block.mentions
        assert "#auth" in block.tags
        assert block.author_id == "agent-alpha"

    def test_find_similar_experiences(self):
        """Should find similar experience blocks."""
        registry = BlockRegistry()
        bridge = MemoryBlockBridge(registry, agent_id="agent-alpha")

        # Store some experiences
        bridge.store_experience("CODE_GEN", "write", "success", "auth module fix")
        bridge.store_experience("CODE_GEN", "write", "failure", "auth module error")
        bridge.store_experience("REVIEW", "check", "success", "code review")

        # Find similar to auth
        similar = bridge.find_similar("auth module", k=2)

        assert len(similar) <= 2
        # Should find the auth-related experiences first
        if similar:
            assert "auth" in similar[0].content.get("description", "").lower()

    def test_get_agent_experiences(self):
        """Should get all experiences for an agent."""
        registry = BlockRegistry()
        bridge_alpha = MemoryBlockBridge(registry, agent_id="agent-alpha")
        bridge_beta = MemoryBlockBridge(registry, agent_id="agent-beta")

        bridge_alpha.store_experience("CODE_GEN", "write", "success", "Task 1")
        bridge_alpha.store_experience("CODE_GEN", "write", "success", "Task 2")
        bridge_beta.store_experience("REVIEW", "check", "success", "Task 3")

        alpha_exps = bridge_alpha.get_my_experiences()

        assert len(alpha_exps) == 2
        assert all(e.author_id == "agent-alpha" for e in alpha_exps)
```

**Step 2: Run test to verify it fails**

Run: `pytest tests/swarm/knowledge/test_memory_bridge.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.swarm.knowledge.memory_bridge'"

**Step 3: Implement MemoryBlockBridge**

```python
# systems/swarm/knowledge/memory_bridge.py
"""Bridge between EpisodicMemory and KnowledgeBlock system."""

from typing import List, Optional, Dict, Any

from systems.swarm.knowledge.registry import BlockRegistry
from systems.swarm.knowledge.block import KnowledgeBlock, BlockType
from systems.swarm.memory import generate_embedding


class MemoryBlockBridge:
    """
    Bridges EpisodicMemory concepts to KnowledgeBlock system.

    Provides a Heaper-style interface for storing agent experiences
    as linked knowledge blocks.
    """

    def __init__(
        self,
        registry: BlockRegistry,
        agent_id: str
    ):
        """
        Initialize the bridge.

        Args:
            registry: BlockRegistry to store blocks in
            agent_id: ID of the agent using this bridge
        """
        self.registry = registry
        self.agent_id = agent_id

    def store_experience(
        self,
        task_type: str,
        action: str,
        outcome: str,
        description: str,
        mentions: Optional[List[str]] = None,
        tags: Optional[List[str]] = None,
        metadata: Optional[Dict[str, Any]] = None
    ) -> KnowledgeBlock:
        """
        Store an experience as a KnowledgeBlock.

        Args:
            task_type: Type of task (e.g., "CODE_GEN")
            action: Action taken (e.g., "write")
            outcome: Result ("success", "failure", "partial")
            description: Human-readable description
            mentions: Optional block IDs to mention
            tags: Optional tags
            metadata: Optional additional context

        Returns:
            The created KnowledgeBlock
        """
        content = {
            "task_type": task_type,
            "action": action,
            "outcome": outcome,
            "description": description,
            "metadata": metadata or {}
        }

        # Generate embedding for semantic search
        embedding = generate_embedding(description)

        block = self.registry.create(
            block_type=BlockType.EXPERIENCE,
            content=content,
            author_id=self.agent_id,
            mentions=mentions,
            tags=tags
        )

        # Add embedding after creation
        block.embedding = embedding

        # Create bidirectional links for mentions
        for mentioned_id in (mentions or []):
            self.registry.link(block.block_id, mentioned_id)

        # Link to tag blocks
        for tag in (tags or []):
            tag_block = self.registry.get_tag_block(tag)
            self.registry.link(block.block_id, tag_block.block_id)

        return block

    def find_similar(
        self,
        query: str,
        outcome_filter: Optional[str] = None,
        k: int = 5
    ) -> List[KnowledgeBlock]:
        """
        Find similar experience blocks.

        Args:
            query: Text to search for
            outcome_filter: Optional filter for outcome type
            k: Maximum results

        Returns:
            List of similar KnowledgeBlocks
        """
        query_embedding = generate_embedding(query)
        experiences = self.registry.query_by_type(BlockType.EXPERIENCE)

        # Filter by outcome if specified
        if outcome_filter:
            experiences = [
                e for e in experiences
                if e.content.get("outcome") == outcome_filter
            ]

        # Calculate similarities
        scored = []
        for exp in experiences:
            if exp.embedding:
                similarity = self._cosine_similarity(query_embedding, exp.embedding)
                scored.append((exp, similarity))

        # Sort by similarity descending
        scored.sort(key=lambda x: x[1], reverse=True)

        return [exp for exp, _ in scored[:k]]

    def get_my_experiences(self) -> List[KnowledgeBlock]:
        """Get all experiences for this agent."""
        experiences = self.registry.query_by_type(BlockType.EXPERIENCE)
        return [e for e in experiences if e.author_id == self.agent_id]

    @staticmethod
    def _cosine_similarity(a: List[float], b: List[float]) -> float:
        """Calculate cosine similarity between two vectors."""
        import math

        if len(a) != len(b):
            return 0.0

        dot = sum(x * y for x, y in zip(a, b))
        mag_a = math.sqrt(sum(x * x for x in a))
        mag_b = math.sqrt(sum(x * x for x in b))

        if mag_a == 0 or mag_b == 0:
            return 0.0

        return dot / (mag_a * mag_b)
```

**Step 4: Run test to verify it passes**

Run: `pytest tests/swarm/knowledge/test_memory_bridge.py -v`
Expected: 3 passed

**Step 5: Commit**

```bash
git add systems/swarm/knowledge/memory_bridge.py tests/swarm/knowledge/test_memory_bridge.py
git commit -m "feat(knowledge): add MemoryBlockBridge for EpisodicMemory integration"
```

---

## Phase IV: Package Export and Documentation

### Task 8: Update Package Exports

**Files:**
- Modify: `systems/swarm/knowledge/__init__.py`
- Modify: `systems/swarm/__init__.py`

**Step 1: Update knowledge package exports**

```python
# systems/swarm/knowledge/__init__.py
"""Knowledge Block system for associative linking.

This module provides Heaper-style knowledge management:
- KnowledgeBlock: Atomic unit with bidirectional linking
- BlockRegistry: CRUD, linking, and query operations
- MemoryBlockBridge: Integration with EpisodicMemory
"""

from systems.swarm.knowledge.block import KnowledgeBlock, BlockType, compute_content_hash
from systems.swarm.knowledge.registry import BlockRegistry
from systems.swarm.knowledge.memory_bridge import MemoryBlockBridge

__all__ = [
    "KnowledgeBlock",
    "BlockType",
    "compute_content_hash",
    "BlockRegistry",
    "MemoryBlockBridge",
]
```

**Step 2: Update swarm package exports**

```python
# Add to systems/swarm/__init__.py (append to existing exports)
from systems.swarm.knowledge import (
    KnowledgeBlock,
    BlockType,
    BlockRegistry,
    MemoryBlockBridge,
    compute_content_hash,
)
```

**Step 3: Run all knowledge tests**

Run: `pytest tests/swarm/knowledge/ -v`
Expected: All tests pass

**Step 4: Commit**

```bash
git add systems/swarm/knowledge/__init__.py systems/swarm/__init__.py
git commit -m "feat(knowledge): export KnowledgeBlock components from swarm package"
```

---

### Task 9: Run Full Test Suite

**Step 1: Run all swarm tests**

Run: `pytest tests/swarm/ -v --tb=short`
Expected: All existing tests + new knowledge tests pass

**Step 2: Fix any integration issues**

If any tests fail due to the new module, investigate and fix.

**Step 3: Final commit**

```bash
git add -A
git commit -m "feat(knowledge): complete Heaper Knowledge Blocks Phase I

Implements core KnowledgeBlock system:
- KnowledgeBlock dataclass with bidirectional linking
- BlockType enum (TASK, EXPERIENCE, AGENT, TAG, CONCEPT, DOCUMENT)
- BlockRegistry with CRUD, linking, and query operations
- MemoryBlockBridge for EpisodicMemory integration
- Content-based de-duplication via SHA-256

Design: docs/plans/2026-02-24-heaper-knowledge-blocks.md

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Phase | Tasks | Tests |
|-------|-------|-------|
| I: Core Data Model | 2 | 10 |
| II: Block Registry | 4 | 22 |
| III: Memory Integration | 1 | 3 |
| IV: Package Export | 2 | - |
| **Total** | **9** | **35** |

## Future Phases (Out of Scope)

- **Phase V:** Visual Shell MemoryBeamRenderer
- **Phase VI:** CRDT sync/merge primitives
- **Phase VII:** NEBBus event publishing
- **Phase VIII:** Infinite Map spatial layout

---

*Plan created: 2026-02-24*
