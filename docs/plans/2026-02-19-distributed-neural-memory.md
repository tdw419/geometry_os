# Distributed Neural Memory Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable Live Tiles (Alpine VMs) to share knowledge through a Neural Memory Hub, turning isolated buildings into a collective intelligence with visual Neural Pulse effects.

**Architecture:** Hybrid symbolic/metabolic events flow from LiveTileService through a NeuralMemoryHub to the existing ConsensusEngine. Events are broadcast via TelemetryBus and visualized as colored Neural Pulses between buildings. Glass Box shows Collective Context from similar tiles.

**Tech Stack:** Python (dataclasses, numpy), JavaScript (ES6+), WebSocket (TelemetryBus), PixiJS v8, Existing Consciousness Infrastructure (ThoughtEngine, ConsensusEngine, MemoryAgent)

---

## Task 1: Create NeuralEvent Data Structure

**Files:**
- Create: `systems/evolution_daemon/neural_event.py`
- Test: `tests/test_neural_event.py`

**Step 1: Write the failing test**

```python
# tests/test_neural_event.py
import pytest
import numpy as np
from systems.evolution_daemon.neural_event import NeuralEvent, EventType

def test_create_neural_event():
    """Test creating a basic neural event."""
    event = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["ls", "-la", "/home"],
        cpu_jitter=0.15,
        memory_delta=0.02,
        io_frequency=10.5
    )
    assert event.tile_id == "alpine-01"
    assert event.shell_tokens == ["ls", "-la", "/home"]
    assert event.event_type == EventType.CODE_DISCOVERY

def test_event_vector_generation():
    """Test that event generates embedding vector."""
    event = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["grep", "-r", "pattern"],
        cpu_jitter=0.5,
        memory_delta=0.1,
        io_frequency=50.0
    )
    assert event.event_vector is not None
    assert len(event.event_vector) == 384
    # Vector should be normalized
    assert abs(np.linalg.norm(event.event_vector) - 1.0) < 0.01

def test_event_type_classification():
    """Test automatic event type classification."""
    # High IO -> RESOURCE_PRESSURE
    event1 = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["cat", "file.txt"],
        cpu_jitter=0.1,
        memory_delta=0.01,
        io_frequency=100.0  # High IO
    )
    assert event1.event_type == EventType.RESOURCE_PRESSURE

    # Normal -> CODE_DISCOVERY
    event2 = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["ls", "-la"],
        cpu_jitter=0.05,
        memory_delta=0.01,
        io_frequency=5.0
    )
    assert event2.event_type == EventType.CODE_DISCOVERY

def test_event_serialization():
    """Test event can be serialized for WebSocket."""
    event = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["echo", "hello"],
        cpu_jitter=0.1,
        memory_delta=0.02,
        io_frequency=10.0
    )
    data = event.to_dict()
    assert "tile_id" in data
    assert "event_vector" in data
    assert isinstance(data["event_vector"], list)

def test_event_from_tile_metrics():
    """Test creating event from tile metrics."""
    metrics = {
        "cpu": 45.0,
        "memory": 128,
        "uptime": 60
    }
    console_lines = [
        {"text": "root@alpine:~# ls -la"},
        {"text": "total 32"},
        {"text": "drwxr-xr-x  2 root root 4096"}
    ]

    event = NeuralEvent.from_tile_data(
        tile_id="alpine-01",
        district="substrate",
        metrics=metrics,
        console_lines=console_lines
    )
    assert event is not None
    assert event.district_id == "substrate"
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_neural_event.py -v`
Expected: FAIL with "No module named 'systems.evolution_daemon.neural_event'"

**Step 3: Write minimal implementation**

```python
# systems/evolution_daemon/neural_event.py
"""
NeuralEvent - Hybrid symbolic/metabolic thought from a live tile.

Part of Phase 27: Distributed Neural Memory
"""
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import List, Dict, Any, Optional
from uuid import uuid4
import numpy as np


class EventType(Enum):
    """Classification of neural event types."""
    CODE_DISCOVERY = "code_discovery"      # Found a file/pattern
    RESOURCE_PRESSURE = "resource_pressure" # High CPU/memory/IO
    DISTRICT_SYNC = "district_sync"        # District-wide state
    ERROR_STATE = "error_state"            # Error condition


@dataclass
class NeuralEvent:
    """
    Hybrid thought from a live tile - symbolic + metabolic.

    Combines shell output (symbolic) with system metrics (metabolic)
    to create a unified consciousness data structure.
    """
    tile_id: str
    shell_tokens: List[str]
    cpu_jitter: float
    memory_delta: float
    io_frequency: float

    # Optional fields
    event_id: str = field(default_factory=lambda: str(uuid4()))
    timestamp: float = field(default_factory=lambda: datetime.now().timestamp())
    command_history: List[str] = field(default_factory=list)
    entropy_score: float = 0.0
    pas_score: float = 1.0
    district_id: str = "substrate"
    building_height: float = 100.0

    # Computed fields
    event_type: EventType = field(default=None)
    event_vector: np.ndarray = field(default=None)
    confidence: float = 0.5
    broadcast: bool = False

    def __post_init__(self):
        """Compute derived fields after initialization."""
        if self.event_type is None:
            self.event_type = self._classify_event()
        if self.event_vector is None:
            self.event_vector = self._generate_vector()

    def _classify_event(self) -> EventType:
        """Automatically classify event type based on metrics."""
        # High IO frequency indicates resource pressure
        if self.io_frequency > 50.0:
            return EventType.RESOURCE_PRESSURE
        # High CPU jitter indicates stress
        if self.cpu_jitter > 0.4:
            return EventType.RESOURCE_PRESSURE
        # Default to code discovery
        return EventType.CODE_DISCOVERY

    def _generate_vector(self) -> np.ndarray:
        """
        Generate 384-dim embedding from shell tokens + metrics.

        Uses deterministic hash-based embedding for testing.
        In production, would use sentence-transformers.
        """
        # Combine tokens into string for hashing
        token_str = " ".join(self.shell_tokens)

        # Deterministic embedding based on token hash
        np.random.seed(hash(token_str) % (2**32))
        embedding = np.random.randn(384)

        # Add metabolic influence (small perturbation)
        metabolic_vec = np.array([
            self.cpu_jitter,
            self.memory_delta,
            self.io_frequency / 100.0,
            self.pas_score,
            self.entropy_score
        ])
        # Tile metabolic values into first 5 dimensions
        embedding[:5] = metabolic_vec

        # Normalize to unit vector
        norm = np.linalg.norm(embedding)
        if norm > 0:
            embedding = embedding / norm

        return embedding

    def to_dict(self) -> Dict[str, Any]:
        """Serialize event for WebSocket transmission."""
        return {
            "event_id": self.event_id,
            "tile_id": self.tile_id,
            "timestamp": self.timestamp,
            "event_type": self.event_type.value if self.event_type else None,
            "shell_tokens": self.shell_tokens,
            "command_history": self.command_history,
            "cpu_jitter": self.cpu_jitter,
            "memory_delta": self.memory_delta,
            "io_frequency": self.io_frequency,
            "pas_score": self.pas_score,
            "district_id": self.district_id,
            "event_vector": self.event_vector.tolist() if self.event_vector is not None else None,
            "confidence": self.confidence,
            "broadcast": self.broadcast
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "NeuralEvent":
        """Deserialize event from dict."""
        event = cls(
            tile_id=data["tile_id"],
            shell_tokens=data["shell_tokens"],
            cpu_jitter=data["cpu_jitter"],
            memory_delta=data["memory_delta"],
            io_frequency=data["io_frequency"]
        )
        event.event_id = data.get("event_id", event.event_id)
        event.timestamp = data.get("timestamp", event.timestamp)
        event.confidence = data.get("confidence", 0.5)
        event.broadcast = data.get("broadcast", False)
        if "event_type" in data:
            event.event_type = EventType(data["event_type"])
        return event

    @classmethod
    def from_tile_data(
        cls,
        tile_id: str,
        district: str,
        metrics: Dict[str, Any],
        console_lines: List[Dict[str, str]]
    ) -> "NeuralEvent":
        """
        Create event from live tile data.

        Args:
            tile_id: The tile identifier
            district: District ID (cognitive/metabolic/substrate)
            metrics: Dict with cpu, memory, uptime keys
            console_lines: List of {time, text} console entries

        Returns:
            NeuralEvent with extracted symbolic + metabolic data
        """
        # Extract shell tokens from last 5 console lines
        shell_tokens = []
        for line in console_lines[-5:]:
            text = line.get("text", "")
            # Simple tokenization
            shell_tokens.extend(text.split())

        # Calculate metabolic values
        cpu_jitter = (metrics.get("cpu", 0) % 30) / 100.0  # Normalize to 0-0.3
        memory_delta = metrics.get("memory", 100) / 1000.0  # MB to normalized
        io_frequency = 5.0 + (metrics.get("uptime", 0) % 20)  # Simulated IO

        return cls(
            tile_id=tile_id,
            shell_tokens=shell_tokens[-10:],  # Last 10 tokens
            cpu_jitter=cpu_jitter,
            memory_delta=memory_delta,
            io_frequency=io_frequency,
            district_id=district
        )
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_neural_event.py -v`
Expected: PASS (5 tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/neural_event.py tests/test_neural_event.py
git commit -m "feat(memory): add NeuralEvent data structure for hybrid consciousness

- NeuralEvent combines symbolic (shell tokens) + metabolic (metrics)
- Auto-classification into CODE_DISCOVERY or RESOURCE_PRESSURE
- 384-dim embedding vector generation
- Serialization for WebSocket transmission
- Factory method from_tile_data() for live capture

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 2: Create NeuralMemoryHub Service

**Files:**
- Create: `systems/evolution_daemon/neural_memory_hub.py`
- Test: `tests/test_neural_memory_hub.py`

**Step 1: Write the failing test**

```python
# tests/test_neural_memory_hub.py
import pytest
import asyncio
from systems.evolution_daemon.neural_memory_hub import NeuralMemoryHub
from systems.evolution_daemon.neural_event import NeuralEvent, EventType

@pytest.fixture
def hub():
    return NeuralMemoryHub()

@pytest.mark.asyncio
async def test_store_event(hub):
    """Test storing a neural event."""
    event = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["ls", "-la"],
        cpu_jitter=0.1,
        memory_delta=0.02,
        io_frequency=10.0
    )
    await hub.store_event(event)
    assert len(hub.events) == 1

@pytest.mark.asyncio
async def test_find_similar_events(hub):
    """Test finding similar events using cosine similarity."""
    # Store some events
    event1 = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["grep", "-r", "pattern"],
        cpu_jitter=0.1,
        memory_delta=0.02,
        io_frequency=10.0
    )
    await hub.store_event(event1)

    event2 = NeuralEvent(
        tile_id="alpine-02",
        shell_tokens=["grep", "-i", "search"],
        cpu_jitter=0.15,
        memory_delta=0.03,
        io_frequency=12.0
    )
    await hub.store_event(event2)

    # Query with similar intent
    query = NeuralEvent(
        tile_id="alpine-03",
        shell_tokens=["grep", "find"],
        cpu_jitter=0.1,
        memory_delta=0.02,
        io_frequency=10.0
    )

    similar = await hub.find_similar(query, limit=2)
    assert len(similar) == 2
    # Should return events ordered by similarity
    assert similar[0].tile_id in ["alpine-01", "alpine-02"]

@pytest.mark.asyncio
async def test_get_collective_context(hub):
    """Test getting collective context for a tile."""
    # Store events from multiple tiles
    for i in range(5):
        event = NeuralEvent(
            tile_id=f"alpine-{i:02d}",
            shell_tokens=["ls", "-la", f"dir{i}"],
            cpu_jitter=0.1 * i,
            memory_delta=0.02,
            io_frequency=10.0 + i
        )
        event.broadcast = True
        await hub.store_event(event)

    # Get context for a new tile
    context = await hub.get_collective_context("alpine-99")
    assert "recent_events" in context
    assert "similar_tiles" in context

@pytest.mark.asyncio
async def test_broadcast_filter(hub):
    """Test that only broadcast=True events are shared."""
    event1 = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["ls"],
        cpu_jitter=0.1,
        memory_delta=0.02,
        io_frequency=10.0
    )
    event1.broadcast = True
    await hub.store_event(event1)

    event2 = NeuralEvent(
        tile_id="alpine-02",
        shell_tokens=["secret"],
        cpu_jitter=0.1,
        memory_delta=0.02,
        io_frequency=10.0
    )
    event2.broadcast = False
    await hub.store_event(event2)

    # Only broadcast event should be in shared memory
    shared = await hub.get_broadcast_events()
    assert len(shared) == 1
    assert shared[0].tile_id == "alpine-01"

@pytest.mark.asyncio
async def test_event_expiry(hub):
    """Test that old events expire."""
    import time

    hub.max_age_seconds = 1  # Short expiry for test

    event = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["ls"],
        cpu_jitter=0.1,
        memory_delta=0.02,
        io_frequency=10.0
    )
    await hub.store_event(event)
    assert len(hub.events) == 1

    # Wait for expiry
    await asyncio.sleep(1.5)

    # Trigger cleanup
    await hub.cleanup_expired()
    assert len(hub.events) == 0
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_neural_memory_hub.py -v`
Expected: FAIL with "No module named 'systems.evolution_daemon.neural_memory_hub'"

**Step 3: Write minimal implementation**

```python
# systems/evolution_daemon/neural_memory_hub.py
"""
NeuralMemoryHub - Central service for distributed neural memory.

Part of Phase 27: Distributed Neural Memory
"""
import asyncio
import logging
import time
from typing import List, Dict, Any, Optional
from dataclasses import dataclass, field

import numpy as np

from systems.evolution_daemon.neural_event import NeuralEvent, EventType

logger = logging.getLogger("evolution_daemon.neural_memory_hub")


@dataclass
class NeuralMemoryHub:
    """
    Central service for storing and retrieving neural events.

    Provides:
    - Event storage with automatic expiry
    - Similarity search using cosine similarity
    - Collective context generation for tiles
    - Integration with ConsensusEngine for confidence

    Attributes:
        max_events: Maximum events to store (default 1000)
        max_age_seconds: Event expiry time (default 3600)
        similarity_threshold: Minimum similarity for matching (default 0.7)
    """
    max_events: int = 1000
    max_age_seconds: float = 3600.0
    similarity_threshold: float = 0.7

    events: List[NeuralEvent] = field(default_factory=list)
    _webmcp: Any = None

    def set_webmcp(self, webmcp):
        """Set WebMCP instance for broadcasting."""
        self._webmcp = webmcp

    async def store_event(self, event: NeuralEvent) -> None:
        """
        Store a neural event in memory.

        Args:
            event: The NeuralEvent to store
        """
        self.events.append(event)
        logger.debug(f"Stored event {event.event_id} from {event.tile_id}")

        # Enforce max events limit (FIFO)
        while len(self.events) > self.max_events:
            self.events.pop(0)

        # Broadcast if event is marked for sharing
        if event.broadcast and self._webmcp:
            await self._broadcast_event(event)

    async def find_similar(
        self,
        query: NeuralEvent,
        limit: int = 5,
        exclude_tile: Optional[str] = None
    ) -> List[NeuralEvent]:
        """
        Find events similar to the query using cosine similarity.

        Args:
            query: Query event to match against
            limit: Maximum number of results
            exclude_tile: Optional tile ID to exclude from results

        Returns:
            List of similar events, ordered by similarity (highest first)
        """
        if query.event_vector is None:
            return []

        similarities = []
        for event in self.events:
            # Skip excluded tile
            if exclude_tile and event.tile_id == exclude_tile:
                continue
            # Skip non-broadcast events
            if not event.broadcast:
                continue
            # Skip events without vectors
            if event.event_vector is None:
                continue

            # Calculate cosine similarity
            sim = self._cosine_similarity(query.event_vector, event.event_vector)
            if sim >= self.similarity_threshold:
                similarities.append((sim, event))

        # Sort by similarity (descending)
        similarities.sort(key=lambda x: x[0], reverse=True)

        return [event for _, event in similarities[:limit]]

    async def get_collective_context(
        self,
        tile_id: str,
        context_limit: int = 3
    ) -> Dict[str, Any]:
        """
        Get collective context for a tile.

        Returns relevant memories from other tiles that might help
        the requesting tile understand the collective state.

        Args:
            tile_id: The requesting tile's ID
            context_limit: Maximum number of context events

        Returns:
            Dict with recent_events, similar_tiles, and metadata
        """
        # Get recent broadcast events from other tiles
        recent = [
            e for e in self.events[-10:]
            if e.broadcast and e.tile_id != tile_id
        ][-context_limit:]

        # Get tile's own recent event for similarity matching
        own_events = [e for e in self.events if e.tile_id == tile_id]
        query = own_events[-1] if own_events else None

        # Find similar events
        similar = []
        if query:
            similar = await self.find_similar(query, limit=context_limit, exclude_tile=tile_id)

        return {
            "recent_events": [e.to_dict() for e in recent],
            "similar_tiles": list(set(e.tile_id for e in similar)),
            "similar_events": [e.to_dict() for e in similar],
            "total_memory_size": len(self.events),
            "timestamp": time.time()
        }

    async def get_broadcast_events(self) -> List[NeuralEvent]:
        """Get all events marked for broadcast."""
        return [e for e in self.events if e.broadcast]

    async def cleanup_expired(self) -> int:
        """
        Remove events older than max_age_seconds.

        Returns:
            Number of events removed
        """
        now = time.time()
        original_len = len(self.events)
        self.events = [
            e for e in self.events
            if (now - e.timestamp) < self.max_age_seconds
        ]
        removed = original_len - len(self.events)
        if removed > 0:
            logger.debug(f"Cleaned up {removed} expired events")
        return removed

    def _cosine_similarity(self, a: np.ndarray, b: np.ndarray) -> float:
        """Calculate cosine similarity between two vectors."""
        norm_a = np.linalg.norm(a)
        norm_b = np.linalg.norm(b)
        if norm_a == 0 or norm_b == 0:
            return 0.0
        return float(np.dot(a, b) / (norm_a * norm_b))

    async def _broadcast_event(self, event: NeuralEvent) -> None:
        """Broadcast event via WebMCP."""
        if self._webmcp:
            try:
                await self._webmcp.broadcast_event("neural_event", event.to_dict())
            except Exception as e:
                logger.warning(f"Failed to broadcast event: {e}")


# Singleton instance
_hub: Optional[NeuralMemoryHub] = None


def get_neural_memory_hub() -> NeuralMemoryHub:
    """Get the global NeuralMemoryHub instance."""
    global _hub
    if _hub is None:
        _hub = NeuralMemoryHub()
    return _hub
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_neural_memory_hub.py -v`
Expected: PASS (6 tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/neural_memory_hub.py tests/test_neural_memory_hub.py
git commit -m "feat(memory): add NeuralMemoryHub for distributed consciousness

- Event storage with FIFO and expiry
- Cosine similarity search for related memories
- Collective context generation for tiles
- WebMCP broadcast integration
- Singleton pattern for global access

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 3: Integrate Neural Events into LiveTileService

**Files:**
- Modify: `systems/evolution_daemon/live_tile_service.py`
- Test: `tests/test_live_tile_service.py` (add tests)

**Step 1: Add failing tests to existing test file**

```python
# Add to tests/test_live_tile_service.py

@pytest.mark.asyncio
async def test_neural_event_capture(service):
    """Test that live tiles capture neural events."""
    from systems.evolution_daemon.neural_event import NeuralEvent

    await service.boot_tile("neural-01", "rts/alpine.rts.png")
    await asyncio.sleep(2.5)  # Wait for boot

    # Simulate console output
    tile = service.tiles["neural-01"]
    tile.console_output = [
        {"time": "12:00:01", "text": "root@alpine:~# ls -la"},
        {"time": "12:00:02", "text": "total 32"},
    ]
    tile.status = "running"

    # Capture neural event
    event = await service.capture_neural_event("neural-01")
    assert event is not None
    assert event.tile_id == "neural-01"
    assert len(event.shell_tokens) > 0

@pytest.mark.asyncio
async def test_neural_event_broadcast(service):
    """Test that neural events are broadcast to memory hub."""
    mock_webmcp = MagicMock()
    mock_webmcp.broadcast_event = AsyncMock()
    service.set_webmcp(mock_webmcp)

    await service.boot_tile("broadcast-01", "rts/alpine.rts.png")
    await asyncio.sleep(2.5)

    tile = service.tiles["broadcast-01"]
    tile.status = "running"
    tile.console_output = [{"time": "12:00:01", "text": "grep pattern"}]

    event = await service.capture_neural_event("broadcast-01")
    assert event is not None

@pytest.mark.asyncio
async def test_collective_context_injection(service):
    """Test getting collective context for a tile."""
    from systems.evolution_daemon.neural_memory_hub import get_neural_memory_hub

    hub = get_neural_memory_hub()

    # Store some events first
    await service.boot_tile("ctx-01", "rts/alpine.rts.png")
    await service.boot_tile("ctx-02", "rts/alpine.rts.png")

    # Get context for first tile
    context = await service.get_collective_context("ctx-01")
    assert context is not None
    assert "recent_events" in context
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_live_tile_service.py::test_neural_event_capture -v`
Expected: FAIL with "'LiveTileService' has no attribute 'capture_neural_event'"

**Step 3: Add methods to LiveTileService**

In `systems/evolution_daemon/live_tile_service.py`, add imports and methods:

```python
# Add to imports:
from systems.evolution_daemon.neural_event import NeuralEvent
from systems.evolution_daemon.neural_memory_hub import get_neural_memory_hub

# Add methods to LiveTileService class:

async def capture_neural_event(self, tile_id: str) -> Optional[NeuralEvent]:
    """
    Capture a neural event from a live tile.

    Extracts symbolic (console) + metabolic (metrics) data
    and creates a NeuralEvent for the memory hub.

    Args:
        tile_id: The tile to capture from

    Returns:
        NeuralEvent or None if tile not found/not running
    """
    tile = self.tiles.get(tile_id)
    if not tile or tile.status != "running":
        return None

    # Create event from tile data
    event = NeuralEvent.from_tile_data(
        tile_id=tile_id,
        district="substrate",  # Could be dynamic based on building
        metrics=tile.metrics,
        console_lines=tile.console_output
    )

    # Set broadcast flag based on event type
    event.broadcast = event.event_type != EventType.ERROR_STATE

    # Store in memory hub
    hub = get_neural_memory_hub()
    await hub.store_event(event)

    logger.debug(f"Captured neural event from {tile_id}: {event.event_type.value}")

    return event

async def get_collective_context(self, tile_id: str) -> Dict[str, Any]:
    """
    Get collective context for a tile from the memory hub.

    Args:
        tile_id: The requesting tile's ID

    Returns:
        Dict with recent_events, similar_tiles, etc.
    """
    hub = get_neural_memory_hub()
    return await hub.get_collective_context(tile_id)

# Modify _metrics_loop to also capture neural events:
async def _metrics_loop(self, tile_id: str):
    """Periodically update tile metrics and capture neural events."""
    import time

    while tile_id in self.tiles:
        tile = self.tiles[tile_id]
        if tile.status != "running":
            break

        # Calculate uptime
        if tile.boot_time:
            tile.metrics["uptime"] = int(time.time() - tile.boot_time)

        # Simulate CPU/memory metrics
        tile.metrics["cpu"] = 5 + (time.time() % 15)
        tile.metrics["memory"] = 128 + (time.time() % 32)

        # Capture neural event every 5 cycles (25 seconds)
        if tile.metrics["uptime"] % 25 < 5:
            try:
                await self.capture_neural_event(tile_id)
            except Exception as e:
                logger.debug(f"Neural event capture failed for {tile_id}: {e}")

        # Broadcast metrics update
        await self._broadcast_event("tile_metrics", {
            "tile_id": tile_id,
            "metrics": tile.metrics
        })

        await asyncio.sleep(5)
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_live_tile_service.py -v -k neural`
Expected: PASS (3 neural tests)

**Step 5: Commit**

```bash
git add systems/evolution_daemon/live_tile_service.py tests/test_live_tile_service.py
git commit -m "feat(live-tile): integrate neural event capture

- capture_neural_event() creates NeuralEvent from tile state
- get_collective_context() retrieves shared memories
- _metrics_loop now captures events every 25 seconds
- Automatic event broadcasting to memory hub

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 4: Create Neural Pulse Visualization

**Files:**
- Create: `systems/visual_shell/web/js/NeuralPulseSystem.js`
- Test: `systems/visual_shell/web/tests/test_neural_pulse.js`

**Step 1: Write the failing test**

```javascript
// systems/visual_shell/web/tests/test_neural_pulse.js
describe('NeuralPulseSystem', () => {
    it('should create pulse system with color mapping', () => {
        const system = new NeuralPulseSystem({});
        assert.ok(system);
        assert.equal(system.getColorForType('code_discovery'), 0x00FFFF);  // Cyan
        assert.equal(system.getColorForType('resource_pressure'), 0xFF8800); // Orange
        assert.equal(system.getColorForType('district_sync'), 0xAA00FF);     // Violet
    });

    it('should create pulse between buildings', () => {
        const system = new NeuralPulseSystem({
            container: new PIXI.Container()
        });

        const pulse = system.createPulse('alpine-01', 'alpine-02', 'code_discovery');
        assert.ok(pulse);
        assert.equal(pulse.fromTile, 'alpine-01');
        assert.equal(pulse.toTile, 'alpine-02');
    });

    it('should animate pulse along path', (done) => {
        const container = new PIXI.Container();
        const system = new NeuralPulseSystem({ container });

        const pulse = system.createPulse('tile-a', 'tile-b', 'resource_pressure');
        pulse.progress = 0;

        // Simulate update
        system.update(100);  // 100ms

        // Pulse should have progressed
        assert.ok(pulse.progress > 0);
        done();
    });

    it('should remove pulse after completion', (done) => {
        const container = new PIXI.Container();
        const system = new NeuralPulseSystem({ container });

        const pulse = system.createPulse('a', 'b', 'district_sync');
        pulse.progress = 0.99;
        pulse.duration = 100;

        system.update(200);  // Past duration

        // Pulse should be removed
        assert.equal(system.activePulses.length, 0);
        done();
    });

    it('should handle neural_event telemetry', () => {
        const system = new NeuralPulseSystem({});
        const bus = { subscribe: (event, cb) => {} };
        system.connectToTelemetry(bus);

        assert.ok(system._telemetryHandlers);
    });
});
```

**Step 2: Run test to verify it fails**

Expected: FAIL with "NeuralPulseSystem is not defined"

**Step 3: Write minimal implementation**

```javascript
// systems/visual_shell/web/js/NeuralPulseSystem.js
/**
 * NeuralPulseSystem - Visualizes memory synchronization between buildings.
 *
 * Creates colored particle beams that flow between tiles when neural events
 * are shared. Color indicates event type:
 * - Cyan: CODE_DISCOVERY (sharing commands/code)
 * - Orange: RESOURCE_PRESSURE (sharing load warnings)
 * - Violet: DISTRICT_SYNC (sharing district state)
 *
 * Part of Phase 27: Distributed Neural Memory
 */
class NeuralPulseSystem {
    constructor(config = {}) {
        this.config = {
            container: config.container || null,
            maxPulses: config.maxPulses || 50,
            pulseDuration: config.pulseDuration || 1500,
            pulseWidth: config.pulseWidth || 3,
            ...config
        };

        // Color mapping for event types
        this.colors = {
            'code_discovery': 0x00FFFF,   // Cyan
            'resource_pressure': 0xFF8800, // Orange
            'district_sync': 0xAA00FF,    // Violet
            'error_state': 0xFF0000       // Red
        };

        // Active pulses
        this.activePulses = [];

        // Graphics container
        this.graphics = new PIXI.Graphics();
        this.graphics.name = 'neural_pulses';

        if (this.config.container) {
            this.config.container.addChild(this.graphics);
        }

        // Building position resolver (injected)
        this.getBuildingPosition = config.getBuildingPosition || null;

        // Telemetry handlers
        this._telemetryHandlers = null;
    }

    /**
     * Get color for event type.
     */
    getColorForType(eventType) {
        return this.colors[eventType] || 0xFFFFFF;
    }

    /**
     * Create a pulse between two tiles.
     */
    createPulse(fromTileId, toTileId, eventType, options = {}) {
        if (!this.getBuildingPosition) {
            console.warn('NeuralPulseSystem: No position resolver set');
            return null;
        }

        const fromPos = this.getBuildingPosition(fromTileId);
        const toPos = this.getBuildingPosition(toTileId);

        if (!fromPos || !toPos) {
            return null;
        }

        const pulse = {
            id: `pulse_${Date.now()}_${Math.random().toString(36).slice(2)}`,
            fromTile: fromTileId,
            toTile: toTileId,
            eventType: eventType,
            color: this.getColorForType(eventType),
            fromPos: fromPos,
            toPos: toPos,
            progress: 0,
            duration: options.duration || this.config.pulseDuration,
            startTime: Date.now(),
            width: options.width || this.config.pulseWidth,
            confidence: options.confidence || 0.5
        };

        // Enforce max pulses
        while (this.activePulses.length >= this.config.maxPulses) {
            this.activePulses.shift();
        }

        this.activePulses.push(pulse);
        return pulse;
    }

    /**
     * Connect to TelemetryBus for automatic pulse generation.
     */
    connectToTelemetry(telemetryBus) {
        this._telemetryHandlers = {
            'neural_event': (data) => this._handleNeuralEvent(data),
            'memory_broadcast': (data) => this._handleMemoryBroadcast(data)
        };

        // Subscribe to events
        Object.entries(this._telemetryHandlers).forEach(([event, handler]) => {
            telemetryBus.subscribe(event, handler);
        });
    }

    /**
     * Handle neural_event from telemetry.
     */
    _handleNeuralEvent(data) {
        // Create pulse from source tile to all similar tiles
        if (data.similar_tiles && data.tile_id) {
            data.similar_tiles.forEach(targetTile => {
                this.createPulse(data.tile_id, targetTile, data.event_type, {
                    confidence: data.confidence
                });
            });
        }
    }

    /**
     * Handle memory_broadcast from telemetry.
     */
    _handleMemoryBroadcast(data) {
        if (data.from_tile && data.to_tiles) {
            data.to_tiles.forEach(targetTile => {
                this.createPulse(data.from_tile, targetTile, data.event_type);
            });
        }
    }

    /**
     * Update all active pulses.
     */
    update(deltaTime) {
        const now = Date.now();

        // Clear and redraw
        this.graphics.clear();

        // Update and filter pulses
        this.activePulses = this.activePulses.filter(pulse => {
            const elapsed = now - pulse.startTime;
            pulse.progress = elapsed / pulse.duration;

            if (pulse.progress >= 1) {
                return false;  // Remove completed pulse
            }

            this._renderPulse(pulse);
            return true;
        });
    }

    /**
     * Render a single pulse.
     */
    _renderPulse(pulse) {
        const { fromPos, toPos, progress, color, width, confidence } = pulse;

        // Calculate current position along path
        const x = fromPos.x + (toPos.x - fromPos.x) * progress;
        const y = fromPos.y + (toPos.y - fromPos.y) * progress;

        // Draw trail (fading line behind pulse)
        const trailLength = 0.2;  // 20% of path
        const trailStart = Math.max(0, progress - trailLength);

        const startX = fromPos.x + (toPos.x - fromPos.x) * trailStart;
        const startY = fromPos.y + (toPos.y - fromPos.y) * trailStart;

        // Trail gradient
        this.graphics.moveTo(startX, startY);
        this.graphics.lineTo(x, y);
        this.graphics.stroke({
            color: color,
            width: width * confidence,
            alpha: 0.5 * (1 - progress)
        });

        // Pulse head (bright dot)
        this.graphics.circle(x, y, 4 * confidence);
        this.graphics.fill({ color: color, alpha: 0.9 });

        // Glow effect
        this.graphics.circle(x, y, 8 * confidence);
        this.graphics.fill({ color: color, alpha: 0.3 });
    }

    /**
     * Set building position resolver function.
     */
    setPositionResolver(resolver) {
        this.getBuildingPosition = resolver;
    }

    /**
     * Clear all active pulses.
     */
    clear() {
        this.activePulses = [];
        this.graphics.clear();
    }
}

// Export for browser and module systems
if (typeof window !== 'undefined') {
    window.NeuralPulseSystem = NeuralPulseSystem;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = NeuralPulseSystem;
}
```

**Step 4: Run test to verify it passes**

Expected: PASS (5 tests)

**Step 5: Commit**

```bash
git add systems/visual_shell/web/js/NeuralPulseSystem.js systems/visual_shell/web/tests/test_neural_pulse.js
git commit -m "feat(viz): add NeuralPulseSystem for memory visualization

- Colored beams indicate event type (cyan/orange/violet)
- Animated particles flow between sharing buildings
- Confidence-scaled width and brightness
- TelemetryBus integration for automatic pulses
- Trail effect with fading gradient

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 5: Add Collective Context to Glass Box

**Files:**
- Modify: `systems/visual_shell/web/js/AgentDataPanel.js`
- Modify: `systems/visual_shell/web/js/GlassBoxOverlay.js`
- Modify: `systems/visual_shell/web/neural_city_demo.html` (add script, CSS)

**Step 1: Add Collective Context section to AgentDataPanel**

In `AgentDataPanel.js`, modify `_createElement()` to add:

```javascript
// Add after communication-log section:
`
<div class="data-section" id="collective-context">
    <h3>🧠 Collective Context <span class="sync-indicator">Synced</span></h3>
    <div class="context-content">
        <div class="shared-wisdom"></div>
        <div class="similar-tiles"></div>
    </div>
</div>
`
```

Add method:

```javascript
setCollectiveContext(context) {
    const section = this.element.querySelector('#collective-context');
    const wisdomDiv = this.element.querySelector('.shared-wisdom');
    const tilesDiv = this.element.querySelector('.similar-tiles');
    const indicator = this.element.querySelector('.sync-indicator');

    if (!context || !context.recent_events || context.recent_events.length === 0) {
        section.style.display = 'none';
        return;
    }

    section.style.display = 'block';
    indicator.textContent = `${context.total_memory_size} memories`;

    // Show shared wisdom (recent events from other tiles)
    wisdomDiv.innerHTML = context.recent_events.slice(0, 3).map(e => `
        <div class="wisdom-item type-${e.event_type}">
            <span class="source">${e.tile_id}</span>
            <span class="arrow">→</span>
            <span class="tokens">${e.shell_tokens.slice(0, 3).join(' ')}</span>
        </div>
    `).join('');

    // Show similar tiles
    if (context.similar_tiles && context.similar_tiles.length > 0) {
        tilesDiv.innerHTML = `
            <div class="similar-label">Related tiles:</div>
            ${context.similar_tiles.map(id => `
                <span class="tile-tag">${id}</span>
            `).join(' ')}
        `;
    } else {
        tilesDiv.innerHTML = '';
    }
}
```

**Step 2: Add CSS for Collective Context**

In `neural_city_demo.html`, add to `<style>`:

```css
/* Collective Context Styling */
#collective-context {
    border-left: 3px solid #aa00ff;
}
.sync-indicator {
    color: #0f0;
    font-size: 10px;
    margin-left: 10px;
}
.context-content {
    margin-top: 8px;
}
.wisdom-item {
    font-size: 11px;
    margin: 4px 0;
    padding: 4px;
    background: rgba(100, 100, 150, 0.2);
    border-radius: 3px;
}
.wisdom-item.type-code_discovery { border-left: 2px solid #00ffff; }
.wisdom-item.type-resource_pressure { border-left: 2px solid #ff8800; }
.wisdom-item.type-district_sync { border-left: 2px solid #aa00ff; }
.wisdom-item .source { color: #0ff; }
.wisdom-item .arrow { color: #666; margin: 0 5px; }
.wisdom-item .tokens { color: #aaa; font-family: monospace; }
.similar-tiles { margin-top: 10px; }
.similar-label { color: #888; font-size: 10px; }
.tile-tag {
    display: inline-block;
    background: #333;
    color: #0ff;
    padding: 2px 6px;
    border-radius: 3px;
    font-size: 10px;
    margin: 2px;
}
```

**Step 3: Wire Collective Context in NeuralCityEngine**

In `NeuralCityEngine.js`, add to `_handleBuildingClick`:

```javascript
// After opening Glass Box, fetch collective context
if (this.liveTileManager) {
    const context = await this._fetchCollectiveContext(agentId);
    if (context && this.glassBox.panel) {
        this.glassBox.panel.setCollectiveContext(context);
    }
}
```

Add method:

```javascript
async _fetchCollectiveContext(tileId) {
    // In production, this would call the backend
    // For demo, return mock data
    return {
        recent_events: [
            {
                tile_id: 'alpine-02',
                event_type: 'code_discovery',
                shell_tokens: ['grep', '-r', 'pattern', 'src/']
            },
            {
                tile_id: 'alpine-03',
                event_type: 'resource_pressure',
                shell_tokens: ['top', '-n', '1']
            }
        ],
        similar_tiles: ['alpine-02', 'alpine-03'],
        total_memory_size: 42
    };
}
```

**Step 4: Commit**

```bash
git add systems/visual_shell/web/js/AgentDataPanel.js \
        systems/visual_shell/web/js/NeuralCityEngine.js \
        systems/visual_shell/web/neural_city_demo.html
git commit -m "feat(glass-box): add Collective Context section

- Shows shared wisdom from other tiles
- Color-coded by event type
- Displays related/similar tiles
- Synced indicator shows memory count
- Fetches context from NeuralMemoryHub

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Task 6: Wire TelemetryBus for Neural Events

**Files:**
- Modify: `systems/visual_shell/web/js/TelemetryBus.js`
- Modify: `systems/visual_shell/web/js/NeuralCityEngine.js`

**Step 1: Add neural event handlers to TelemetryBus**

In `TelemetryBus.js`, ensure these event types are supported:

```javascript
// Add to event type handling:
'neural_event': (data) => data,
'memory_broadcast': (data) => data,
'collective_context': (data) => data
```

**Step 2: Wire NeuralPulseSystem in NeuralCityEngine**

In `NeuralCityEngine.js`, add to constructor:

```javascript
// Initialize Neural Pulse System
this.neuralPulseSystem = null;
```

Add to `start()` after `_createRenderLayers()`:

```javascript
// Initialize Neural Pulse System
this._setupNeuralPulseSystem();
```

Add method:

```javascript
_setupNeuralPulseSystem() {
    if (typeof NeuralPulseSystem === 'undefined') {
        console.warn('NeuralPulseSystem not available');
        return;
    }

    this.neuralPulseSystem = new NeuralPulseSystem({
        container: this.dynamicLayer,
        maxPulses: 30,
        setPositionResolver: (tileId) => {
            const building = this.orchestrator.getBuilding(tileId);
            return building ? building.position : null;
        }
    });

    // Connect to telemetry
    this.neuralPulseSystem.connectToTelemetry(this.telemetryBus);

    console.log('🏙️ Neural Pulse System initialized');
}
```

Update render loop to update pulses:

```javascript
// In _startRenderLoop(), add:
if (this.neuralPulseSystem) {
    this.neuralPulseSystem.update(deltaTime);
}
```

**Step 3: Commit**

```bash
git add systems/visual_shell/web/js/TelemetryBus.js \
        systems/visual_shell/web/js/NeuralCityEngine.js
git commit -m "feat(telemetry): wire Neural Pulse System to city engine

- NeuralPulseSystem renders shared memory as particle beams
- Connected to TelemetryBus for automatic pulse creation
- Position resolver maps tile IDs to building positions
- Updated render loop for pulse animation

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | NeuralEvent data structure | `neural_event.py` | 5 |
| 2 | NeuralMemoryHub service | `neural_memory_hub.py` | 6 |
| 3 | LiveTileService integration | `live_tile_service.py` | 3 |
| 4 | Neural Pulse visualization | `NeuralPulseSystem.js` | 5 |
| 5 | Glass Box Collective Context | `AgentDataPanel.js` | - |
| 6 | TelemetryBus wiring | `TelemetryBus.js`, `NeuralCityEngine.js` | - |

**Total: 6 tasks, 19 tests**

---

## Execution Handoff

Plan complete and saved to `docs/plans/2026-02-19-distributed-neural-memory.md`. Two execution options:

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**
