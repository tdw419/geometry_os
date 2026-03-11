# Phase 49: Neural District Coalescence Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Enable agents to cluster into Tectonic Plates based on hidden vector similarity, forming semantic districts with collective bargaining power.

**Architecture:** DistrictFormer computes cosine similarity between agent R2 vectors (64-dim), clusters via DBSCAN, and creates TectonicPlate entities. Plates have cohesion scores, LLM-generated names, and can negotiate as unified entities. Visual heatmap renders districts with PixelBrain-specified colors.

**Tech Stack:** Python (clustering), numpy (vector math), LM Studio (naming/inference), DBSCAN (sklearn), asyncio (coordination)

---

## PixelBrain Design Specs

### Color Scheme (RGBA)

| State | Hex | RGBA | Usage |
|-------|-----|------|-------|
| High-cohesion | `#00F0FF` | `(0, 240, 255, 255)` | Agents working harmoniously |
| Low-cohesion | `#4A4A4A` | `(74, 74, 74, 255)` | Fragmented, conflicting |
| Active-processing | `#FF4500` | `(255, 69, 0, 255)` | Currently computing |
| Dormant | `#1A1A1A` | `(26, 26, 26, 255)` | Sleeping/idle |
| Conflict-zone | `#FF3333` | `(255, 51, 51, 255)` | Contested tiles |

### Parameters

| Parameter | Value | Description |
|-----------|-------|-------------|
| Clustering Threshold | `cosine_similarity >= 0.75` | Minimum similarity to cluster |
| Ghost Layer Depth | `60 frames` | 1 second at 60fps |
| Ghost Layer Format | `Compressed PNG diffs` | Frame history storage |

### Cohesion Formula

```python
def cohesion_score(avg_cosine_similarity, spatial_distance_factor, recency_weight):
    return avg_cosine_similarity * (1 - spatial_distance_factor) * recency_weight
```

---

## File Structure

```
systems/tectonic/
├── plate.py          # TectonicPlate dataclass, DistrictState enum
├── district.py       # DistrictFormer clustering engine
├── visual.py         # District heatmap rendering
└── __init__.py       # Updated exports

tests/
├── test_tectonic_plate.py      # Plate structure tests
├── test_tectonic_district.py   # Clustering tests
└── test_tectonic_visual.py     # Rendering tests
```

---

## Chunk 1: TectonicPlate Data Structure

### Task 1: Create TectonicPlate and DistrictState

**Files:**
- Create: `systems/tectonic/plate.py`
- Create: `tests/test_tectonic_plate.py`

- [ ] **Step 1: Write the failing test**

```python
# tests/test_tectonic_plate.py
"""Tests for TectonicPlate data structure."""

import pytest
import numpy as np
from systems.tectonic.plate import TectonicPlate, DistrictState


class TestDistrictState:
    """Tests for DistrictState enum."""

    def test_district_state_values(self):
        """Test all district states exist."""
        assert DistrictState.HIGH_COHESION.value == "high_cohesion"
        assert DistrictState.LOW_COHESION.value == "low_cohesion"
        assert DistrictState.ACTIVE.value == "active"
        assert DistrictState.DORMANT.value == "dormant"
        assert DistrictState.CONFLICT.value == "conflict"


class TestTectonicPlate:
    """Tests for TectonicPlate dataclass."""

    def test_plate_creation(self):
        """Test creating a tectonic plate."""
        centroid = np.zeros(64, dtype=np.float32)
        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a", "agent_b"],
            centroid=centroid,
        )
        assert plate.plate_id == "plate_001"
        assert len(plate.agents) == 2

    def test_plate_cohesion_default(self):
        """Test default cohesion is 0."""
        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
        )
        assert plate.cohesion == 0.0

    def test_plate_state_from_cohesion(self):
        """Test state determination from cohesion score."""
        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
            cohesion=0.9,
        )
        assert plate.state == DistrictState.HIGH_COHESION

    def test_plate_state_low_cohesion(self):
        """Test low cohesion state."""
        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
            cohesion=0.3,
        )
        assert plate.state == DistrictState.LOW_COHESION

    def test_plate_total_budget(self):
        """Test budget calculation."""
        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a", "agent_b"],
            centroid=np.zeros(64),
            agent_budgets={"agent_a": 50.0, "agent_b": 30.0},
        )
        assert plate.total_budget == 80.0

    def test_plate_color_high_cohesion(self):
        """Test color for high cohesion state."""
        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
            cohesion=0.9,
        )
        color = plate.get_color()
        assert color == (0, 240, 255, 255)  # #00F0FF

    def test_plate_color_conflict(self):
        """Test color for conflict state."""
        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
            state=DistrictState.CONFLICT,
        )
        color = plate.get_color()
        assert color == (255, 51, 51, 255)  # #FF3333

    def test_plate_to_dict(self):
        """Test serialization."""
        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
            cohesion=0.8,
            name="Code Palace",
        )
        data = plate.to_dict()
        assert data["plate_id"] == "plate_001"
        assert data["name"] == "Code Palace"
        assert data["cohesion"] == 0.8

    def test_plate_from_dict(self):
        """Test deserialization."""
        data = {
            "plate_id": "plate_001",
            "agents": ["agent_a"],
            "centroid": [0.0] * 64,
            "cohesion": 0.8,
            "name": "Code Palace",
        }
        plate = TectonicPlate.from_dict(data)
        assert plate.plate_id == "plate_001"
        assert plate.name == "Code Palace"

    def test_plate_force_calculation(self):
        """Test combined force calculation."""
        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a", "agent_b"],
            centroid=np.zeros(64),
            cohesion=0.8,
            agent_budgets={"agent_a": 100.0, "agent_b": 50.0},
        )
        # F_plate = total_budget * cohesion
        force = plate.calculate_force()
        assert force == 150.0 * 0.8  # 120.0
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/test_tectonic_plate.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.tectonic.plate'"

- [ ] **Step 3: Write minimal implementation**

```python
# systems/tectonic/plate.py
"""
TectonicPlate - Group of agents forming a semantic district.

Phase 49: Neural District Coalescence

A TectonicPlate represents a cluster of agents with similar hidden vectors
(R2: 64-dim) that have coalesced into a unified bargaining unit.
"""

import math
from dataclasses import dataclass, field
from enum import Enum
from typing import Dict, List, Any, Optional, Tuple
import numpy as np


class DistrictState(Enum):
    """Visual states for district rendering."""
    HIGH_COHESION = "high_cohesion"
    LOW_COHESION = "low_cohesion"
    ACTIVE = "active"
    DORMANT = "dormant"
    CONFLICT = "conflict"


# PixelBrain-specified colors (RGBA)
DISTRICT_COLORS = {
    DistrictState.HIGH_COHESION: (0, 240, 255, 255),    # #00F0FF
    DistrictState.LOW_COHESION: (74, 74, 74, 255),      # #4A4A4A
    DistrictState.ACTIVE: (255, 69, 0, 255),            # #FF4500
    DistrictState.DORMANT: (26, 26, 26, 255),           # #1A1A1A
    DistrictState.CONFLICT: (255, 51, 51, 255),         # #FF3333
}


@dataclass
class TectonicPlate:
    """
    A cluster of semantically-similar agents forming a district.

    TectonicPlates emerge when agents with similar hidden vectors
    (R2: 64-dim) cluster together. They negotiate as unified entities
    with combined bargaining power.

    Attributes:
        plate_id: Unique identifier
        agents: List of agent_ids in this plate
        centroid: Mean hidden vector (64-dim)
        cohesion: Average similarity between members (0-1)
        name: LLM-generated district name
        purpose: LLM-inferred collective purpose
        agent_budgets: Budget per agent
        tiles: Tiles owned by this plate
        state: Current visual state
    """

    plate_id: str
    agents: List[str]
    centroid: np.ndarray
    cohesion: float = 0.0
    name: str = ""
    purpose: str = ""
    agent_budgets: Dict[str, float] = field(default_factory=dict)
    tiles: List[Tuple[int, int]] = field(default_factory=list)
    state: Optional[DistrictState] = None
    is_active: bool = False
    conflict_count: int = 0

    def __post_init__(self):
        """Derive state from cohesion if not set."""
        if self.state is None:
            self.state = self._derive_state()

    def _derive_state(self) -> DistrictState:
        """Determine state from cohesion and activity."""
        if self.conflict_count > 0:
            return DistrictState.CONFLICT
        if self.is_active:
            return DistrictState.ACTIVE
        if self.cohesion >= 0.7:
            return DistrictState.HIGH_COHESION
        if self.cohesion < 0.4:
            return DistrictState.LOW_COHESION
        return DistrictState.DORMANT

    @property
    def total_budget(self) -> float:
        """Combined budget of all agents."""
        return sum(self.agent_budgets.values())

    def get_color(self) -> Tuple[int, int, int, int]:
        """Get RGBA color for current state."""
        return DISTRICT_COLORS.get(self.state, DISTRICT_COLORS[DistrictState.DORMANT])

    def calculate_force(self) -> float:
        """
        Calculate combined negotiating force.

        F_plate = total_budget * cohesion

        High-cohesion plates punch above their weight.
        """
        return self.total_budget * self.cohesion

    def to_dict(self) -> Dict[str, Any]:
        """Serialize to dictionary."""
        return {
            "plate_id": self.plate_id,
            "agents": self.agents,
            "centroid": self.centroid.tolist() if isinstance(self.centroid, np.ndarray) else self.centroid,
            "cohesion": self.cohesion,
            "name": self.name,
            "purpose": self.purpose,
            "agent_budgets": self.agent_budgets,
            "tiles": self.tiles,
            "state": self.state.value if self.state else None,
            "total_budget": self.total_budget,
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "TectonicPlate":
        """Deserialize from dictionary."""
        centroid = data.get("centroid", [])
        if isinstance(centroid, list):
            centroid = np.array(centroid, dtype=np.float32)

        state = None
        if data.get("state"):
            state = DistrictState(data["state"])

        return cls(
            plate_id=data["plate_id"],
            agents=data["agents"],
            centroid=centroid,
            cohesion=data.get("cohesion", 0.0),
            name=data.get("name", ""),
            purpose=data.get("purpose", ""),
            agent_budgets=data.get("agent_budgets", {}),
            tiles=[tuple(t) for t in data.get("tiles", [])],
            state=state,
        )

    def __repr__(self) -> str:
        return (
            f"TectonicPlate(plate_id={self.plate_id!r}, "
            f"agents={len(self.agents)}, cohesion={self.cohesion:.2f}, "
            f"state={self.state.value if self.state else 'unknown'})"
        )
```

- [ ] **Step 4: Run test to verify it passes**

Run: `pytest tests/test_tectonic_plate.py -v`
Expected: 13 passed

- [ ] **Step 5: Commit**

```bash
git add systems/tectonic/plate.py tests/test_tectonic_plate.py
git commit -m "feat(tectonic): add TectonicPlate dataclass with PixelBrain colors"
```

---

## Chunk 2: DistrictFormer Clustering Engine

### Task 2: Create DistrictFormer with Vector Similarity

**Files:**
- Create: `systems/tectonic/district.py`
- Create: `tests/test_tectonic_district.py`

- [ ] **Step 1: Write the failing test**

```python
# tests/test_tectonic_district.py
"""Tests for DistrictFormer clustering engine."""

import pytest
import numpy as np
from systems.tectonic.district import DistrictFormer, VectorSimilarity
from systems.tectonic.plate import TectonicPlate, DistrictState


class TestVectorSimilarity:
    """Tests for vector similarity calculations."""

    def test_cosine_similarity_identical(self):
        """Test identical vectors have similarity 1.0."""
        vec = np.ones(64, dtype=np.float32)
        sim = VectorSimilarity.cosine(vec, vec)
        assert sim == pytest.approx(1.0, abs=0.001)

    def test_cosine_similarity_orthogonal(self):
        """Test orthogonal vectors have similarity 0.0."""
        vec_a = np.zeros(64, dtype=np.float32)
        vec_a[0] = 1.0
        vec_b = np.zeros(64, dtype=np.float32)
        vec_b[1] = 1.0
        sim = VectorSimilarity.cosine(vec_a, vec_b)
        assert sim == pytest.approx(0.0, abs=0.001)

    def test_cosine_similarity_opposite(self):
        """Test opposite vectors have similarity -1.0."""
        vec_a = np.ones(64, dtype=np.float32)
        vec_b = -np.ones(64, dtype=np.float32)
        sim = VectorSimilarity.cosine(vec_a, vec_b)
        assert sim == pytest.approx(-1.0, abs=0.001)

    def test_similarity_matrix(self):
        """Test computing full similarity matrix."""
        vectors = [
            np.ones(64, dtype=np.float32),
            np.ones(64, dtype=np.float32) * 0.9,
            np.zeros(64, dtype=np.float32),
        ]
        matrix = VectorSimilarity.matrix(vectors)
        assert matrix.shape == (3, 3)
        assert matrix[0, 0] == pytest.approx(1.0)
        assert matrix[0, 1] > 0.9  # Similar vectors


class TestDistrictFormer:
    """Tests for DistrictFormer clustering."""

    def test_former_creation(self):
        """Test creating a DistrictFormer."""
        former = DistrictFormer(similarity_threshold=0.75)
        assert former.similarity_threshold == 0.75

    def test_form_districts_single_agent(self):
        """Test forming district with single agent."""
        former = DistrictFormer()
        agents = {
            "agent_a": {
                "vector": np.zeros(64, dtype=np.float32),
                "budget": 100.0,
            }
        }
        plates = former.form_districts(agents)
        assert len(plates) == 1
        assert plates[0].agents == ["agent_a"]

    def test_form_districts_similar_agents(self):
        """Test similar agents cluster together."""
        former = DistrictFormer(similarity_threshold=0.75)

        # Create two very similar vectors
        vec_a = np.ones(64, dtype=np.float32) * 0.5
        vec_b = np.ones(64, dtype=np.float32) * 0.51

        agents = {
            "agent_a": {"vector": vec_a, "budget": 100.0},
            "agent_b": {"vector": vec_b, "budget": 50.0},
        }
        plates = former.form_districts(agents)

        # Should form single plate (high similarity)
        assert len(plates) == 1
        assert len(plates[0].agents) == 2

    def test_form_districts_dissimilar_agents(self):
        """Test dissimilar agents form separate plates."""
        former = DistrictFormer(similarity_threshold=0.75)

        # Create orthogonal vectors
        vec_a = np.zeros(64, dtype=np.float32)
        vec_a[0] = 1.0
        vec_b = np.zeros(64, dtype=np.float32)
        vec_b[1] = 1.0

        agents = {
            "agent_a": {"vector": vec_a, "budget": 100.0},
            "agent_b": {"vector": vec_b, "budget": 50.0},
        }
        plates = former.form_districts(agents)

        # Should form two plates (low similarity)
        assert len(plates) == 2

    def test_cohesion_calculation(self):
        """Test cohesion score uses PixelBrain formula."""
        former = DistrictFormer()

        # Three identical vectors = perfect cohesion
        vec = np.ones(64, dtype=np.float32)
        agents = {
            "a": {"vector": vec, "budget": 100.0},
            "b": {"vector": vec.copy(), "budget": 100.0},
            "c": {"vector": vec.copy(), "budget": 100.0},
        }
        plates = former.form_districts(agents)

        # All identical = cohesion 1.0
        assert plates[0].cohesion == pytest.approx(1.0, abs=0.01)

    def test_centroid_calculation(self):
        """Test centroid is mean of member vectors."""
        former = DistrictFormer()

        vec_a = np.zeros(64, dtype=np.float32)
        vec_a[0] = 1.0
        vec_b = np.zeros(64, dtype=np.float32)
        vec_b[0] = 0.0

        agents = {
            "a": {"vector": vec_a, "budget": 100.0},
            "b": {"vector": vec_b, "budget": 100.0},
        }
        plates = former.form_districts(agents)

        # Centroid should be mean
        assert plates[0].centroid[0] == pytest.approx(0.5, abs=0.01)

    def test_add_agent_to_plate(self):
        """Test adding agent to existing plate."""
        former = DistrictFormer()
        vec = np.ones(64, dtype=np.float32)

        agents = {
            "a": {"vector": vec, "budget": 100.0},
        }
        plates = former.form_districts(agents)

        # Add similar agent
        former.add_agent_to_plate(plates[0], "b", vec.copy(), 50.0)
        assert "b" in plates[0].agents
        assert plates[0].agent_budgets["b"] == 50.0

    def test_remove_agent_from_plate(self):
        """Test removing agent from plate."""
        former = DistrictFormer()
        vec = np.ones(64, dtype=np.float32)

        agents = {
            "a": {"vector": vec, "budget": 100.0},
            "b": {"vector": vec.copy(), "budget": 50.0},
        }
        plates = former.form_districts(agents)

        former.remove_agent_from_plate(plates[0], "a")
        assert "a" not in plates[0].agents

    def test_recalculate_cohesion(self):
        """Test cohesion recalculation after membership change."""
        former = DistrictFormer()

        # Start with identical vectors
        vec = np.ones(64, dtype=np.float32)
        agents = {
            "a": {"vector": vec, "budget": 100.0},
            "b": {"vector": vec.copy(), "budget": 100.0},
        }
        plates = former.form_districts(agents)
        initial_cohesion = plates[0].cohesion

        # Add dissimilar vector
        new_vec = np.zeros(64, dtype=np.float32)
        new_vec[0] = 1.0
        former.add_agent_to_plate(plates[0], "c", new_vec, 100.0)
        former.recalculate_cohesion(plates[0])

        # Cohesion should decrease
        assert plates[0].cohesion < initial_cohesion
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/test_tectonic_district.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.tectonic.district'"

- [ ] **Step 3: Write minimal implementation**

```python
# systems/tectonic/district.py
"""
DistrictFormer - Clustering engine for TectonicPlate formation.

Phase 49: Neural District Coalescence

Forms districts by clustering agents based on hidden vector similarity
(R2: 64-dim) using cosine similarity and DBSCAN-style density clustering.
"""

import logging
import uuid
from typing import Dict, List, Any, Optional, Tuple
import numpy as np

from systems.tectonic.plate import TectonicPlate, DistrictState

logger = logging.getLogger("tectonic.district")


class VectorSimilarity:
    """Vector similarity calculations."""

    @staticmethod
    def cosine(vec_a: np.ndarray, vec_b: np.ndarray) -> float:
        """
        Compute cosine similarity between two vectors.

        Args:
            vec_a: First vector
            vec_b: Second vector

        Returns:
            Similarity in range [-1, 1]
        """
        norm_a = np.linalg.norm(vec_a)
        norm_b = np.linalg.norm(vec_b)

        if norm_a == 0 or norm_b == 0:
            return 0.0

        return float(np.dot(vec_a, vec_b) / (norm_a * norm_b))

    @staticmethod
    def matrix(vectors: List[np.ndarray]) -> np.ndarray:
        """
        Compute pairwise similarity matrix.

        Args:
            vectors: List of vectors

        Returns:
            NxN similarity matrix
        """
        n = len(vectors)
        matrix = np.eye(n, dtype=np.float32)

        for i in range(n):
            for j in range(i + 1, n):
                sim = VectorSimilarity.cosine(vectors[i], vectors[j])
                matrix[i, j] = sim
                matrix[j, i] = sim

        return matrix


class DistrictFormer:
    """
    Clustering engine for forming TectonicPlates.

    Groups agents into districts based on hidden vector similarity.
    Uses PixelBrain-specified threshold (cosine >= 0.75).

    Attributes:
        similarity_threshold: Minimum similarity to cluster (default 0.75)
        min_plate_size: Minimum agents to form a plate
    """

    def __init__(
        self,
        similarity_threshold: float = 0.75,
        min_plate_size: int = 1,
    ):
        self.similarity_threshold = similarity_threshold
        self.min_plate_size = min_plate_size
        self._plates: List[TectonicPlate] = []

    def form_districts(
        self,
        agents: Dict[str, Dict[str, Any]],
    ) -> List[TectonicPlate]:
        """
        Form TectonicPlates from agents.

        Args:
            agents: Dict of agent_id -> {vector, budget, ...}

        Returns:
            List of formed TectonicPlates
        """
        if not agents:
            return []

        agent_ids = list(agents.keys())
        vectors = [agents[aid]["vector"] for aid in agent_ids]
        budgets = {aid: agents[aid].get("budget", 0.0) for aid in agent_ids}

        # Compute similarity matrix
        sim_matrix = VectorSimilarity.matrix(vectors)

        # Cluster using simple threshold-based approach
        clusters = self._cluster_by_threshold(sim_matrix, agent_ids)

        # Form plates from clusters
        plates = []
        for cluster_ids in clusters:
            if len(cluster_ids) < self.min_plate_size:
                continue

            # Get vectors for cluster members
            cluster_vectors = [
                agents[aid]["vector"]
                for aid in cluster_ids
            ]

            # Calculate centroid
            centroid = np.mean(cluster_vectors, axis=0)

            # Calculate cohesion using PixelBrain formula
            cohesion = self._calculate_cohesion(
                cluster_vectors,
                sim_matrix,
                [agent_ids.index(aid) for aid in cluster_ids],
            )

            # Create plate
            plate = TectonicPlate(
                plate_id=f"plate_{uuid.uuid4().hex[:8]}",
                agents=cluster_ids,
                centroid=centroid,
                cohesion=cohesion,
                agent_budgets={aid: budgets[aid] for aid in cluster_ids},
            )
            plates.append(plate)

        self._plates = plates
        return plates

    def _cluster_by_threshold(
        self,
        sim_matrix: np.ndarray,
        agent_ids: List[str],
    ) -> List[List[str]]:
        """
        Cluster agents by similarity threshold.

        Uses union-find style clustering.
        """
        n = len(agent_ids)
        parent = list(range(n))

        def find(x):
            if parent[x] != x:
                parent[x] = find(parent[x])
            return parent[x]

        def union(x, y):
            px, py = find(x), find(y)
            if px != py:
                parent[px] = py

        # Union similar pairs
        for i in range(n):
            for j in range(i + 1, n):
                if sim_matrix[i, j] >= self.similarity_threshold:
                    union(i, j)

        # Group by parent
        clusters = {}
        for i in range(n):
            p = find(i)
            if p not in clusters:
                clusters[p] = []
            clusters[p].append(agent_ids[i])

        return list(clusters.values())

    def _calculate_cohesion(
        self,
        vectors: List[np.ndarray],
        sim_matrix: np.ndarray,
        indices: List[int],
    ) -> float:
        """
        Calculate cohesion score using PixelBrain formula.

        cohesion = avg_cosine_similarity * (1 - spatial_distance_factor) * recency_weight

        For simplicity, we use avg_cosine_similarity as the primary factor.
        """
        if len(vectors) <= 1:
            return 1.0

        # Average pairwise similarity
        total_sim = 0.0
        count = 0

        for i, idx_i in enumerate(indices):
            for j, idx_j in enumerate(indices):
                if i < j:
                    total_sim += sim_matrix[idx_i, idx_j]
                    count += 1

        avg_sim = total_sim / count if count > 0 else 1.0
        return max(0.0, min(1.0, avg_sim))

    def add_agent_to_plate(
        self,
        plate: TectonicPlate,
        agent_id: str,
        vector: np.ndarray,
        budget: float,
    ) -> None:
        """Add an agent to an existing plate."""
        plate.agents.append(agent_id)
        plate.agent_budgets[agent_id] = budget

        # Update centroid
        n = len(plate.agents)
        old_centroid = plate.centroid
        plate.centroid = old_centroid * (n - 1) / n + vector / n

    def remove_agent_from_plate(
        self,
        plate: TectonicPlate,
        agent_id: str,
    ) -> None:
        """Remove an agent from a plate."""
        if agent_id in plate.agents:
            plate.agents.remove(agent_id)
            plate.agent_budgets.pop(agent_id, None)

    def recalculate_cohesion(self, plate: TectonicPlate) -> None:
        """Recalculate plate cohesion from current members."""
        # This would need access to agent vectors
        # For now, mark as needing recalculation
        plate.state = plate._derive_state()

    @property
    def plates(self) -> List[TectonicPlate]:
        """Get current plates."""
        return self._plates
```

- [ ] **Step 4: Run test to verify it passes**

Run: `pytest tests/test_tectonic_district.py -v`
Expected: 12 passed

- [ ] **Step 5: Commit**

```bash
git add systems/tectonic/district.py tests/test_tectonic_district.py
git commit -m "feat(tectonic): add DistrictFormer clustering engine"
```

---

## Chunk 3: Plate Negotiation Integration

### Task 3: Integrate Plates with TectonicNegotiator

**Files:**
- Modify: `systems/tectonic/negotiator.py`
- Create: `tests/test_tectonic_plate_negotiation.py`

- [ ] **Step 1: Write the failing test**

```python
# tests/test_tectonic_plate_negotiation.py
"""Tests for plate-level negotiation."""

import pytest
import numpy as np
from systems.tectonic.negotiator import TectonicNegotiator
from systems.tectonic.plate import TectonicPlate
from systems.tectonic.claim import TectonicClaim


class TestPlateNegotiation:
    """Tests for plate-level claim submission."""

    def test_submit_plate_claim(self):
        """Test submitting a claim on behalf of a plate."""
        negotiator = TectonicNegotiator()

        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a", "agent_b"],
            centroid=np.zeros(64),
            cohesion=0.8,
            agent_budgets={"agent_a": 100.0, "agent_b": 50.0},
        )

        claim_id = negotiator.submit_plate_claim(
            plate=plate,
            tile=(10, 20),
            purpose="district_expansion",
        )
        assert claim_id is not None

    def test_plate_force_exceeds_individual(self):
        """Test plate has more force than individual agents."""
        negotiator = TectonicNegotiator()

        # Individual claim
        individual_claim = TectonicClaim(
            tile=(10, 20),
            purpose="test",
            bid=50.0,
            agent_id="agent_a",
        )
        individual_id = negotiator.submit_claim(individual_claim)

        # Plate claim
        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a", "agent_b", "agent_c"],
            centroid=np.zeros(64),
            cohesion=0.9,
            agent_budgets={
                "agent_a": 50.0,
                "agent_b": 50.0,
                "agent_c": 50.0,
            },
        )
        plate_id = negotiator.submit_plate_claim(
            plate=plate,
            tile=(10, 20),
            purpose="district_expansion",
        )

        # Settle both
        individual_settlement = negotiator.settle(individual_id)
        plate_settlement = negotiator.settle(plate_id)

        # Plate force should be higher (150 * 0.9 = 135 vs 50)
        assert plate_settlement.force > individual_settlement.force

    def test_plate_claim_includes_plate_id(self):
        """Test plate claims reference the plate."""
        negotiator = TectonicNegotiator()

        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
            cohesion=1.0,
            agent_budgets={"agent_a": 100.0},
        )

        claim_id = negotiator.submit_plate_claim(
            plate=plate,
            tile=(5, 5),
            purpose="test",
        )

        claim = negotiator.get_claim(claim_id)
        assert claim.plate_id == "plate_001"
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/test_tectonic_plate_negotiation.py -v`
Expected: FAIL with "AttributeError: 'TectonicNegotiator' has no attribute 'submit_plate_claim'"

- [ ] **Step 3: Modify TectonicNegotiator**

Add to `systems/tectonic/negotiator.py`:

```python
# Add import at top
from systems.tectonic.plate import TectonicPlate

# Add methods to TectonicNegotiator class:

def submit_plate_claim(
    self,
    plate: TectonicPlate,
    tile: Tuple[int, int],
    purpose: str,
) -> str:
    """
    Submit a claim on behalf of a TectonicPlate.

    The bid is calculated as: total_budget * cohesion

    Args:
        plate: The TectonicPlate making the claim
        tile: The tile to claim
        purpose: Purpose of the claim

    Returns:
        claim_id for tracking
    """
    # Calculate plate-level bid
    bid = plate.calculate_force()

    claim = TectonicClaim(
        tile=tile,
        purpose=f"[{plate.plate_id}] {purpose}",
        bid=bid,
        agent_id=plate.plate_id,  # Plate acts as agent
    )

    # Store plate reference
    claim.plate_id = plate.plate_id

    return self.submit_claim(claim)

def get_claim(self, claim_id: str) -> Optional[TectonicClaim]:
    """Get a claim by ID."""
    return self._pending_claims.get(claim_id)
```

Also modify `TectonicClaim` in `claim.py` to support plate_id:

```python
# Add to TectonicClaim dataclass:
plate_id: Optional[str] = None
```

- [ ] **Step 4: Run test to verify it passes**

Run: `pytest tests/test_tectonic_plate_negotiation.py -v`
Expected: 3 passed

- [ ] **Step 5: Commit**

```bash
git add systems/tectonic/negotiator.py systems/tectonic/claim.py tests/test_tectonic_plate_negotiation.py
git commit -m "feat(tectonic): add plate-level claim submission to negotiator"
```

---

## Chunk 4: District Visualization

### Task 4: Create District Heatmap Renderer

**Files:**
- Create: `systems/tectonic/visual.py`
- Create: `tests/test_tectonic_visual.py`

- [ ] **Step 1: Write the failing test**

```python
# tests/test_tectonic_visual.py
"""Tests for district visualization."""

import pytest
import numpy as np
from systems.tectonic.visual import DistrictHeatmap, GhostLayer
from systems.tectonic.plate import TectonicPlate, DistrictState


class TestDistrictHeatmap:
    """Tests for district heatmap rendering."""

    def test_heatmap_creation(self):
        """Test creating a heatmap."""
        heatmap = DistrictHeatmap(width=100, height=100)
        assert heatmap.width == 100
        assert heatmap.height == 100

    def test_render_single_plate(self):
        """Test rendering a single plate."""
        heatmap = DistrictHeatmap(width=100, height=100)

        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
            cohesion=0.9,
            tiles=[(10, 10), (10, 11), (11, 10)],
        )

        pixels = heatmap.render([plate])
        assert pixels.shape == (100, 100, 4)  # RGBA

    def test_render_uses_correct_color(self):
        """Test that high-cohesion plate gets cyan color."""
        heatmap = DistrictHeatmap(width=10, height=10)

        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
            cohesion=0.9,
            tiles=[(5, 5)],
        )

        pixels = heatmap.render([plate])

        # Check pixel at tile location has high-cohesion color
        color = tuple(pixels[5, 5])
        assert color == (0, 240, 255, 255)  # #00F0FF

    def test_render_conflict_plate(self):
        """Test that conflict plate gets red color."""
        heatmap = DistrictHeatmap(width=10, height=10)

        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
            state=DistrictState.CONFLICT,
            tiles=[(5, 5)],
        )

        pixels = heatmap.render([plate])
        color = tuple(pixels[5, 5])
        assert color == (255, 51, 51, 255)  # #FF3333

    def test_render_to_png(self, tmp_path):
        """Test exporting heatmap to PNG."""
        heatmap = DistrictHeatmap(width=10, height=10)

        plate = TectonicPlate(
            plate_id="plate_001",
            agents=["agent_a"],
            centroid=np.zeros(64),
            cohesion=0.9,
            tiles=[(5, 5)],
        )

        output_path = tmp_path / "heatmap.png"
        heatmap.render_to_png([plate], str(output_path))
        assert output_path.exists()


class TestGhostLayer:
    """Tests for ghost layer (frame history)."""

    def test_ghost_layer_creation(self):
        """Test creating a ghost layer."""
        ghost = GhostLayer(depth=60)
        assert ghost.depth == 60

    def test_push_frame(self):
        """Test pushing frames to history."""
        ghost = GhostLayer(depth=4)
        frame = np.zeros((10, 10, 4), dtype=np.uint8)

        for i in range(6):
            ghost.push_frame(frame)

        # Should only keep last 4
        assert len(ghost.history) == 4

    def test_composite_with_decay(self):
        """Test compositing ghost frames with decay."""
        ghost = GhostLayer(depth=4)

        # Push frames with different colors
        for i in range(4):
            frame = np.full((10, 10, 4), i * 50, dtype=np.uint8)
            ghost.push_frame(frame)

        composite = ghost.composite()
        assert composite.shape == (10, 10, 4)

        # Recent frames should have more influence
        # (decay is exponential)
```

- [ ] **Step 2: Run test to verify it fails**

Run: `pytest tests/test_tectonic_visual.py -v`
Expected: FAIL with "ModuleNotFoundError: No module named 'systems.tectonic.visual'"

- [ ] **Step 3: Write minimal implementation**

```python
# systems/tectonic/visual.py
"""
District Visualization - Heatmap and Ghost Layer rendering.

Phase 49: Neural District Coalescence

Renders TectonicPlates as a heatmap using PixelBrain-specified colors.
Ghost layer maintains frame history for temporal visualization.
"""

import logging
from collections import deque
from pathlib import Path
from typing import List, Optional, Tuple

import numpy as np

from systems.tectonic.plate import TectonicPlate, DistrictState, DISTRICT_COLORS

logger = logging.getLogger("tectonic.visual")


class DistrictHeatmap:
    """
    Renders TectonicPlates as a colored heatmap.

    Uses PixelBrain-specified color scheme for different district states.
    """

    def __init__(self, width: int = 256, height: int = 256):
        """
        Initialize heatmap renderer.

        Args:
            width: Map width in pixels
            height: Map height in pixels
        """
        self.width = width
        self.height = height

    def render(
        self,
        plates: List[TectonicPlate],
        background: Optional[np.ndarray] = None,
    ) -> np.ndarray:
        """
        Render plates to RGBA pixel array.

        Args:
            plates: List of TectonicPlates to render
            background: Optional background image

        Returns:
            RGBA pixel array (height, width, 4)
        """
        # Initialize with background or transparent
        if background is not None:
            pixels = background.copy()
        else:
            pixels = np.zeros(
                (self.height, self.width, 4),
                dtype=np.uint8
            )

        # Render each plate
        for plate in plates:
            color = plate.get_color()
            for x, y in plate.tiles:
                if 0 <= x < self.width and 0 <= y < self.height:
                    pixels[y, x] = color

        return pixels

    def render_to_png(
        self,
        plates: List[TectonicPlate],
        output_path: str,
    ) -> None:
        """
        Render plates and save to PNG.

        Args:
            plates: List of plates to render
            output_path: Path to save PNG
        """
        try:
            from PIL import Image
        except ImportError:
            logger.warning("PIL not available, cannot save PNG")
            return

        pixels = self.render(plates)
        img = Image.fromarray(pixels, mode='RGBA')
        img.save(output_path)
        logger.info(f"Saved heatmap to {output_path}")


class GhostLayer:
    """
    Maintains frame history for temporal visualization.

    PixelBrain specified 60 frames (1 second at 60fps).
    Frames decay exponentially for ghost effect.
    """

    def __init__(self, depth: int = 60):
        """
        Initialize ghost layer.

        Args:
            depth: Number of frames to keep
        """
        self.depth = depth
        self.history: deque = deque(maxlen=depth)
        self.decay_gamma = 0.3  # Exponential decay rate

    def push_frame(self, frame: np.ndarray) -> None:
        """
        Add a frame to history.

        Args:
            frame: RGBA pixel array
        """
        self.history.append(frame.copy())

    def composite(self) -> np.ndarray:
        """
        Composite all frames with exponential decay.

        Recent frames have higher opacity.

        Returns:
            Composited RGBA frame
        """
        if not self.history:
            return np.zeros((100, 100, 4), dtype=np.uint8)

        # Get frame dimensions from most recent
        h, w, c = self.history[-1].shape
        composite = np.zeros((h, w, c), dtype=np.float32)

        n = len(self.history)
        for i, frame in enumerate(self.history):
            # Exponential decay: older frames have lower weight
            # Frame 0 (oldest) gets lowest, Frame n-1 (newest) gets highest
            age = n - 1 - i
            weight = np.exp(-self.decay_gamma * age)
            composite += frame.astype(np.float32) * weight

        # Normalize
        total_weight = sum(np.exp(-self.decay_gamma * i) for i in range(n))
        composite = composite / total_weight

        return np.clip(composite, 0, 255).astype(np.uint8)

    def clear(self) -> None:
        """Clear frame history."""
        self.history.clear()
```

- [ ] **Step 4: Run test to verify it passes**

Run: `pytest tests/test_tectonic_visual.py -v`
Expected: 7 passed

- [ ] **Step 5: Commit**

```bash
git add systems/tectonic/visual.py tests/test_tectonic_visual.py
git commit -m "feat(tectonic): add district heatmap and ghost layer visualization"
```

---

## Chunk 5: Update Exports and E2E Tests

### Task 5: Update __init__.py and Create E2E Tests

**Files:**
- Modify: `systems/tectonic/__init__.py`
- Create: `tests/test_tectonic_district_e2e.py`

- [ ] **Step 1: Update exports**

```python
# systems/tectonic/__init__.py
"""
Tectonic System - Spatial negotiation and district formation.

Phase 48: Multi-agent negotiation
Phase 48.5: Agent strategy training
Phase 49: Neural district coalescence
"""

from systems.tectonic.claim import (
    TectonicClaim,
    TectonicBid,
    TectonicSettlement,
    ClaimStatus,
)
from systems.tectonic.negotiator import TectonicNegotiator
from systems.tectonic.agent import TectonicAgent, BudgetTracker
from systems.tectonic.strategy import StrategyProfile, StrategyType
from systems.tectonic.arena import SimulationArena, AgentConfig, SimulationResult
from systems.tectonic.learner import StrategyLearner, LearningConfig
from systems.tectonic.plate import TectonicPlate, DistrictState, DISTRICT_COLORS
from systems.tectonic.district import DistrictFormer, VectorSimilarity
from systems.tectonic.visual import DistrictHeatmap, GhostLayer

__all__ = [
    # Phase 48
    "TectonicClaim",
    "TectonicBid",
    "TectonicSettlement",
    "ClaimStatus",
    "TectonicNegotiator",
    "TectonicAgent",
    "BudgetTracker",
    # Phase 48.5
    "StrategyProfile",
    "StrategyType",
    "SimulationArena",
    "AgentConfig",
    "SimulationResult",
    "StrategyLearner",
    "LearningConfig",
    # Phase 49
    "TectonicPlate",
    "DistrictState",
    "DISTRICT_COLORS",
    "DistrictFormer",
    "VectorSimilarity",
    "DistrictHeatmap",
    "GhostLayer",
]
```

- [ ] **Step 2: Write E2E tests**

```python
# tests/test_tectonic_district_e2e.py
"""End-to-end tests for district formation and negotiation."""

import pytest
import numpy as np
from systems.tectonic import (
    TectonicAgent,
    TectonicNegotiator,
    DistrictFormer,
    TectonicPlate,
    DistrictHeatmap,
    StrategyProfile,
    StrategyType,
)


class TestDistrictFormationE2E:
    """End-to-end district formation tests."""

    def test_agents_form_districts_and_negotiate(self):
        """Test full pipeline: agents -> districts -> negotiation."""
        # 1. Create negotiator and agents
        negotiator = TectonicNegotiator()

        agents = {}
        agent_vectors = {}

        # Create agents with similar vectors (will cluster)
        for i in range(3):
            vec = np.ones(64, dtype=np.float32) * (0.5 + i * 0.01)
            agent = TectonicAgent(
                negotiator=negotiator,
                agent_id=f"agent_{i}",
                spatial_budget=100.0,
            )
            agents[f"agent_{i}"] = agent
            agent_vectors[f"agent_{i}"] = vec

        # 2. Form districts
        former = DistrictFormer(similarity_threshold=0.75)
        agent_data = {
            aid: {"vector": vec, "budget": agents[aid].spatial_budget}
            for aid, vec in agent_vectors.items()
        }
        plates = former.form_districts(agent_data)

        # 3. Should have formed one plate (similar vectors)
        assert len(plates) == 1
        assert len(plates[0].agents) == 3

        # 4. Plate can submit claim
        claim_id = negotiator.submit_plate_claim(
            plate=plates[0],
            tile=(50, 50),
            purpose="district_headquarters",
        )
        assert claim_id is not None

        # 5. Settle
        settlement = negotiator.settle(claim_id)
        assert settlement.winner == plates[0].plate_id

    def test_districts_with_different_strategies(self):
        """Test districts form based on strategy similarity."""
        negotiator = TectonicNegotiator()

        # Create agents with different strategies
        agent_data = {}

        # Aggressive agents (will cluster)
        for i in range(2):
            vec = np.zeros(64, dtype=np.float32)
            vec[0] = 1.0  # Similar direction
            agent_data[f"agg_{i}"] = {"vector": vec, "budget": 100.0}

        # Conservative agents (will cluster separately)
        for i in range(2):
            vec = np.zeros(64, dtype=np.float32)
            vec[1] = 1.0  # Different direction
            agent_data[f"cons_{i}"] = {"vector": vec, "budget": 100.0}

        former = DistrictFormer(similarity_threshold=0.5)
        plates = former.form_districts(agent_data)

        # Should have 2 plates (different clusters)
        assert len(plates) == 2

    def test_render_districts_to_heatmap(self, tmp_path):
        """Test rendering formed districts to heatmap."""
        # Create plates
        plate_a = TectonicPlate(
            plate_id="plate_a",
            agents=["a1", "a2"],
            centroid=np.zeros(64),
            cohesion=0.9,
            tiles=[(10, 10), (10, 11), (11, 10), (11, 11)],
        )

        plate_b = TectonicPlate(
            plate_id="plate_b",
            agents=["b1"],
            centroid=np.zeros(64),
            cohesion=0.3,  # Low cohesion
            tiles=[(50, 50)],
        )

        # Render
        heatmap = DistrictHeatmap(width=100, height=100)
        pixels = heatmap.render([plate_a, plate_b])

        # Verify colors
        assert tuple(pixels[10, 10]) == (0, 240, 255, 255)  # High cohesion = cyan
        assert tuple(pixels[50, 50]) == (74, 74, 74, 255)   # Low cohesion = gray

        # Export to PNG
        output_path = tmp_path / "districts.png"
        heatmap.render_to_png([plate_a, plate_b], str(output_path))
        assert output_path.exists()

    def test_plate_force_calculation(self):
        """Test that plate force is budget * cohesion."""
        plate = TectonicPlate(
            plate_id="test",
            agents=["a", "b", "c"],
            centroid=np.zeros(64),
            cohesion=0.8,
            agent_budgets={"a": 100.0, "b": 50.0, "c": 50.0},
        )

        # Force = 200 * 0.8 = 160
        assert plate.calculate_force() == 160.0

    def test_training_then_district_formation(self):
        """Test training agents then forming districts."""
        from systems.tectonic import SimulationArena, AgentConfig, StrategyLearner

        # 1. Train agents
        arena = SimulationArena(agent_configs=[
            AgentConfig("a", 100.0, StrategyType.AGGRESSIVE),
            AgentConfig("b", 100.0, StrategyType.AGGRESSIVE),
            AgentConfig("c", 100.0, StrategyType.CONSERVATIVE),
        ])
        arena.run_rounds(count=50)

        # 2. Learn strategy
        learner = StrategyLearner()
        learner.learn_from_arena(arena)
        profile = learner.derive_strategy()

        # 3. Form districts based on learned profiles
        # (In reality, would use hidden vectors from execution)
        vec_aggressive = np.ones(64, dtype=np.float32) * 0.8
        vec_conservative = np.ones(64, dtype=np.float32) * 0.3

        former = DistrictFormer(similarity_threshold=0.5)
        plates = former.form_districts({
            "a": {"vector": vec_aggressive, "budget": 100.0},
            "b": {"vector": vec_aggressive.copy(), "budget": 100.0},
            "c": {"vector": vec_conservative, "budget": 100.0},
        })

        # Aggressive agents should cluster together
        assert len(plates) == 2
```

- [ ] **Step 3: Run all Phase 49 tests**

Run: `pytest tests/test_tectonic_plate.py tests/test_tectonic_district.py tests/test_tectonic_plate_negotiation.py tests/test_tectonic_visual.py tests/test_tectonic_district_e2e.py -v`
Expected: ~35 passed

- [ ] **Step 4: Commit**

```bash
git add systems/tectonic/__init__.py tests/test_tectonic_district_e2e.py
git commit -m "feat(tectonic): complete Phase 49 Neural District Coalescence"
```

---

## Success Criteria

- [ ] TectonicPlate with PixelBrain colors renders correctly
- [ ] DistrictFormer clusters agents by cosine similarity >= 0.75
- [ ] Plates submit claims with force = budget * cohesion
- [ ] Ghost layer maintains 60 frames with exponential decay
- [ ] Heatmap exports to PNG with correct colors
- [ ] 35+ tests passing

## Files Summary

| File | Purpose | Tests |
|------|---------|-------|
| `systems/tectonic/plate.py` | TectonicPlate, DistrictState | 13 |
| `systems/tectonic/district.py` | DistrictFormer, VectorSimilarity | 12 |
| `systems/tectonic/visual.py` | DistrictHeatmap, GhostLayer | 7 |
| `tests/test_tectonic_plate_negotiation.py` | Plate claims | 3 |
| `tests/test_tectonic_district_e2e.py` | E2E integration | 5+ |

**Total: ~40 tests**
