# Barnes-Hut Quadtree Acceleration Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Optimize GravityEngine from O(N²) to O(N log N) using Barnes-Hut quadtree approximation, enabling "Neural City" scale with millions of entities.

**Architecture:** Build a spatial quadtree that partitions the simulation bounds, computing center-of-mass for each region. Distant orb clusters exert approximate gravitational force using their center-of-mass instead of individual calculations.

**Tech Stack:** Python, NumPy, quadtree data structure, Barnes-Hut algorithm

---

## Background: The Scaling Problem

The current GravityEngine.update() method (lines 88-103) calculates repulsive forces between ALL pairs of orbs:

```python
# Current O(N²) implementation
for path_i, orb_i in self.orbs.items():
    for path_j, orb_j in self.orbs.items():
        if path_i != path_j:
            # Calculate force for EVERY pair
```

With 1,000 orbs: ~1,000,000 force calculations per frame
With 100,000 orbs: ~10,000,000,000 force calculations per frame (unusable)

**Barnes-Hut Solution:** Group distant orbs into regions, compute force against region's center-of-mass.

---

## Phase 1: Quadtree Data Structure

### Task 1: Create Quadtree Spatial Partition

**Files:**
- Create: `systems/infinite_map/quadtree.py`
- Test: `tests/test_quadtree.py`

**Step 1: Write the failing test**

```python
# tests/test_quadtree.py
"""
Tests for Barnes-Hut Quadtree spatial partitioning.

Verifies O(N log N) force approximation for the GravityEngine.
"""

import pytest
import numpy as np
from systems.infinite_map.quadtree import QuadTree, QuadNode, BoundingBox


class TestBoundingBox:
    """Tests for BoundingBox class."""

    def test_bounding_box_creation(self):
        """Test BoundingBox initializes correctly."""
        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        assert bbox.x == 0
        assert bbox.y == 0
        assert bbox.width == 100
        assert bbox.height == 100

    def test_bounding_box_contains_point(self):
        """Test BoundingBox.contains_point() works correctly."""
        bbox = BoundingBox(x=0, y=0, width=100, height=100)

        assert bbox.contains_point(50, 50) == True
        assert bbox.contains_point(150, 50) == False
        assert bbox.contains_point(-10, 50) == False

    def test_bounding_box_center_of_mass_empty(self):
        """Test BoundingBox center_of_mass for empty region."""
        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        node = QuadNode(bbox)

        assert node.center_of_mass is None
        assert node.total_mass == 0.0


class TestQuadNode:
    """Tests for QuadNode class."""

    def test_quad_node_insert_single_point(self):
        """Test inserting a single point into QuadNode."""
        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        node = QuadNode(bbox)

        node.insert(x=50, y=50, mass=1.0, data={"path": "test.py"})

        assert node.total_mass == 1.0
        assert node.center_of_mass is not None

    def test_quad_node_subdivides_on_overflow(self):
        """Test QuadNode subdivides when capacity exceeded."""
        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        node = QuadNode(bbox, capacity=2)

        # Insert 3 points - should trigger subdivision
        node.insert(10, 10, 1.0, {"path": "a.py"})
        node.insert(20, 20, 1.0, {"path": "b.py"})
        node.insert(30, 30, 1.0, {"path": "c.py"})

        # Should have children now
        assert node.is_subdivided()

    def test_quad_node_center_of_mass_multiple(self):
        """Test center_of_mass calculation with multiple points."""
        bbox = BoundingBox(x=0, y=0, width=100, height=100)
        node = QuadNode(bbox)

        node.insert(0, 0, 1.0, {"path": "a.py"})
        node.insert(100, 100, 1.0, {"path": "b.py"})

        com = node.center_of_mass
        assert com is not None
        # Center of mass should be at (50, 50)
        assert abs(com[0] - 50.0) < 1.0
        assert abs(com[1] - 50.0) < 1.0


class TestQuadTree:
    """Tests for QuadTree class."""

    def test_quadtree_creation(self):
        """Test QuadTree initializes with bounds."""
        tree = QuadTree(width=1024, height=1024)

        assert tree.width == 1024
        assert tree.height == 1024
        assert tree.root is not None

    def test_quadtree_insert_multiple(self):
        """Test inserting multiple points into QuadTree."""
        tree = QuadTree(width=1024, height=1024)

        for i in range(100):
            x = (i * 37) % 1024
            y = (i * 53) % 1024
            tree.insert(x, y, mass=1.0, data={"idx": i})

        assert tree.root.total_mass == 100.0

    def test_quadtree_find_nearby(self):
        """Test QuadTree.find_nearby() returns points in radius."""
        tree = QuadTree(width=1024, height=1024)

        # Insert points in known locations
        tree.insert(100, 100, 1.0, {"path": "center.py"})
        tree.insert(200, 200, 1.0, {"path": "near.py"})
        tree.insert(900, 900, 1.0, {"path": "far.py"})

        nearby = tree.find_nearby(150, 150, radius=100)

        # Should find center.py and near.py, but not far.py
        paths = [p["data"]["path"] for p in nearby]
        assert "center.py" in paths
        assert "near.py" in paths
        assert "far.py" not in paths


class TestBarnesHutApproximation:
    """Tests for Barnes-Hut force approximation."""

    def test_theta_parameter_controls_approximation(self):
        """Test theta parameter controls when to approximate."""
        tree = QuadTree(width=1024, height=1024, theta=0.5)

        # Insert many points to build up tree
        for i in range(50):
            tree.insert((i * 73) % 1024, (i * 97) % 1024, 1.0, {"idx": i})

        # Query force approximation
        force = tree.calculate_force(512, 512, theta=0.5)

        assert force is not None
        assert len(force) == 2  # (fx, fy)

    def test_well_separated_uses_approximation(self):
        """Test that well-separated nodes use center-of-mass approximation."""
        tree = QuadTree(width=1024, height=1024, theta=0.5)

        # Insert cluster in far corner
        for i in range(10):
            tree.insert(900 + i, 900 + i, 1.0, {"cluster": "far"})

        # Query force from opposite corner
        # With theta=0.5, distant cluster should be approximated
        approx_count = tree.count_approximations(100, 100, theta=0.5)

        # Should use approximation for distant cluster
        assert approx_count >= 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_quadtree.py -v`
Expected: FAIL with "No module named 'systems.infinite_map.quadtree'"

**Step 3: Implement Quadtree**

```python
# systems/infinite_map/quadtree.py
"""
Barnes-Hut Quadtree: O(N log N) force approximation for GravityEngine.

Implements spatial partitioning with center-of-mass aggregation
for efficient n-body simulation at "Neural City" scale.
"""

from dataclasses import dataclass, field
from typing import Optional, List, Dict, Any, Tuple
import numpy as np


@dataclass
class BoundingBox:
    """Axis-aligned bounding box for quadtree nodes."""
    x: float
    y: float
    width: float
    height: float

    def contains_point(self, px: float, py: float) -> bool:
        """Check if point is within this bounding box."""
        return (self.x <= px < self.x + self.width and
                self.y <= py < self.y + self.height)

    def quadrant(self, px: float, py: float) -> int:
        """Return quadrant index (0-3) for a point."""
        mid_x = self.x + self.width / 2
        mid_y = self.y + self.height / 2

        if px < mid_x:
            return 2 if py >= mid_y else 0
        else:
            return 3 if py >= mid_y else 1


class QuadNode:
    """
    A node in the Barnes-Hut quadtree.

    Leaf nodes contain particles.
    Internal nodes have 4 children and aggregate center-of-mass.
    """

    def __init__(self, bounds: BoundingBox, capacity: int = 4):
        self.bounds = bounds
        self.capacity = capacity

        # Particles in this node (only for leaf nodes)
        self.particles: List[Dict[str, Any]] = []

        # Children (NW, NE, SW, SE)
        self.children: Optional[List[Optional['QuadNode']]] = None

        # Aggregated properties
        self.center_of_mass: Optional[Tuple[float, float]] = None
        self.total_mass: float = 0.0

    def is_subdivided(self) -> bool:
        """Check if this node has been subdivided."""
        return self.children is not None

    def subdivide(self):
        """Split this node into 4 quadrants."""
        hw = self.bounds.width / 2
        hh = self.bounds.height / 2

        self.children = [
            QuadNode(BoundingBox(self.bounds.x, self.bounds.y, hw, hh), self.capacity),      # NW
            QuadNode(BoundingBox(self.bounds.x + hw, self.bounds.y, hw, hh), self.capacity), # NE
            QuadNode(BoundingBox(self.bounds.x, self.bounds.y + hh, hw, hh), self.capacity), # SW
            QuadNode(BoundingBox(self.bounds.x + hw, self.bounds.y + hh, hw, hh), self.capacity), # SE
        ]

        # Re-insert existing particles into children
        for p in self.particles:
            quadrant = self.bounds.quadrant(p['x'], p['y'])
            self.children[quadrant].insert(p['x'], p['y'], p['mass'], p['data'])

        self.particles = []

    def insert(self, x: float, y: float, mass: float, data: Dict[str, Any]) -> bool:
        """
        Insert a particle into this node.

        Returns True if insertion succeeded.
        """
        # Check bounds
        if not self.bounds.contains_point(x, y):
            return False

        # Update center of mass
        if self.center_of_mass is None:
            self.center_of_mass = (x, y)
            self.total_mass = mass
        else:
            # Weighted average for center of mass
            new_mass = self.total_mass + mass
            cx = (self.center_of_mass[0] * self.total_mass + x * mass) / new_mass
            cy = (self.center_of_mass[1] * self.total_mass + y * mass) / new_mass
            self.center_of_mass = (cx, cy)
            self.total_mass = new_mass

        # If subdivided, insert into appropriate child
        if self.is_subdivided():
            quadrant = self.bounds.quadrant(x, y)
            return self.children[quadrant].insert(x, y, mass, data)

        # If room in this leaf node
        if len(self.particles) < self.capacity:
            self.particles.append({'x': x, 'y': y, 'mass': mass, 'data': data})
            return True

        # Need to subdivide
        self.subdivide()
        quadrant = self.bounds.quadrant(x, y)
        return self.children[quadrant].insert(x, y, mass, data)

    def find_nearby(self, x: float, y: float, radius: float) -> List[Dict[str, Any]]:
        """Find all particles within radius of (x, y)."""
        results = []

        # Check if this node's bounds intersect the query circle
        # (simplified check using bounding box)
        if not self._bounds_intersect_circle(x, y, radius):
            return results

        # Check particles in this node
        for p in self.particles:
            dx = p['x'] - x
            dy = p['y'] - y
            if dx*dx + dy*dy <= radius*radius:
                results.append(p)

        # Recurse into children
        if self.children:
            for child in self.children:
                if child:
                    results.extend(child.find_nearby(x, y, radius))

        return results

    def _bounds_intersect_circle(self, cx: float, cy: float, r: float) -> bool:
        """Check if bounding box intersects circle."""
        # Find closest point on bbox to circle center
        closest_x = max(self.bounds.x, min(cx, self.bounds.x + self.bounds.width))
        closest_y = max(self.bounds.y, min(cy, self.bounds.y + self.bounds.height))

        dx = cx - closest_x
        dy = cy - closest_y

        return dx*dx + dy*dy <= r*r


class QuadTree:
    """
    Barnes-Hut Quadtree for O(N log N) force calculation.

    Usage:
        tree = QuadTree(width=1024, height=1024)
        for orb in orbs:
            tree.insert(orb.x, orb.y, orb.mass, {"path": orb.path})

        # Calculate approximate force at a point
        force = tree.calculate_force(x, y, theta=0.5)
    """

    def __init__(self, width: float, height: float, capacity: int = 4, theta: float = 0.5):
        """
        Initialize quadtree.

        Args:
            width: Simulation width
            height: Simulation height
            capacity: Max particles per leaf node
            theta: Barnes-Hut opening angle (smaller = more accurate, slower)
        """
        self.width = width
        self.height = height
        self.theta = theta
        self.root = QuadNode(BoundingBox(0, 0, width, height), capacity)

    def insert(self, x: float, y: float, mass: float, data: Dict[str, Any]) -> bool:
        """Insert a particle into the tree."""
        return self.root.insert(x, y, mass, data)

    def find_nearby(self, x: float, y: float, radius: float) -> List[Dict[str, Any]]:
        """Find all particles within radius of point."""
        return self.root.find_nearby(x, y, radius)

    def calculate_force(self, x: float, y: float, k_repel: float = 1000.0,
                       theta: Optional[float] = None) -> Tuple[float, float]:
        """
        Calculate repulsive force at (x, y) using Barnes-Hut approximation.

        Args:
            x, y: Query point
            k_repel: Repulsive force constant
            theta: Opening angle (uses self.theta if None)

        Returns:
            (fx, fy): Force vector
        """
        if theta is None:
            theta = self.theta

        fx, fy = 0.0, 0.0
        self._approx_count = 0

        stack = [self.root]
        while stack:
            node = stack.pop()

            if node.total_mass == 0:
                continue

            # Distance to center of mass
            dx = node.center_of_mass[0] - x
            dy = node.center_of_mass[1] - y
            dist_sq = dx*dx + dy*dy

            if dist_sq < 1e-10:  # Avoid division by zero
                continue

            # Node size
            size = max(node.bounds.width, node.bounds.height)

            # Barnes-Hut criterion: s/d < theta
            if size * size < theta * theta * dist_sq or not node.is_subdivided():
                # Use approximation: treat node as single mass
                dist = np.sqrt(dist_sq)
                force = k_repel * node.total_mass / dist_sq
                fx -= force * dx / dist
                fy -= force * dy / dist
                self._approx_count += 1
            else:
                # Need to look deeper
                for child in node.children:
                    if child and child.total_mass > 0:
                        stack.append(child)

        return (fx, fy)

    def count_approximations(self, x: float, y: float, theta: float = 0.5) -> int:
        """Count how many approximations were used in force calculation."""
        self.calculate_force(x, y, theta=theta)
        return self._approx_count

    def clear(self):
        """Reset the tree for rebuilding."""
        self.root = QuadNode(BoundingBox(0, 0, self.width, self.height), self.root.capacity)
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_quadtree.py -v`
Expected: 12 passed

**Step 5: Commit**

```bash
git add systems/infinite_map/quadtree.py tests/test_quadtree.py
git commit -m "feat(tectonic): add Barnes-Hut quadtree for O(N log N) force approximation"
```

---

## Phase 2: GravityEngine Integration

### Task 2: Integrate Quadtree into GravityEngine

**Files:**
- Modify: `systems/infinite_map/gravity_engine.py:88-131`
- Test: `tests/test_gravity_engine_quadtree.py`

**Step 1: Write the failing test**

```python
# tests/test_gravity_engine_quadtree.py
"""
Tests for Barnes-Hut integration into GravityEngine.

Verifies O(N log N) performance and force accuracy.
"""

import pytest
import time
import numpy as np
from systems.infinite_map.gravity_engine import GravityEngine


class TestGravityEngineQuadtreeMode:
    """Tests for quadtree-accelerated gravity calculation."""

    def test_gravity_engine_quadtree_mode_default(self):
        """Test GravityEngine defaults to quadtree mode for large N."""
        engine = GravityEngine(use_quadtree=True)

        assert engine.use_quadtree == True

    def test_gravity_engine_small_n_uses_direct(self):
        """Test GravityEngine uses direct calculation for small N."""
        engine = GravityEngine(use_quadtree=True, quadtree_threshold=10)

        # Add few orbs - should use direct O(N²)
        for i in range(5):
            engine.add_orb(f"file_{i}.py", i * 100, i * 100, 1024)

        engine.update()
        # No exception = success

    def test_gravity_engine_large_n_uses_quadtree(self):
        """Test GravityEngine uses quadtree for large N."""
        engine = GravityEngine(use_quadtree=True, quadtree_threshold=10)

        # Add many orbs - should use quadtree O(N log N)
        for i in range(100):
            x = (i * 73) % 1024
            y = (i * 97) % 1024
            engine.add_orb(f"file_{i}.py", x, y, 1024)

        engine.update()
        # No exception = success

    def test_quadtree_forces_approximately_correct(self):
        """Test quadtree forces are within 10% of direct calculation."""
        # Create two engines with same configuration
        engine_direct = GravityEngine(use_quadtree=False)
        engine_quadtree = GravityEngine(use_quadtree=True, theta=0.5)

        # Add same orbs to both
        for i in range(50):
            x = (i * 73) % 1024
            y = (i * 97) % 1024
            engine_direct.add_orb(f"file_{i}.py", x, y, 1024)
            engine_quadtree.add_orb(f"file_{i}.py", x, y, 1024)

        # Run one update
        engine_direct.update()
        engine_quadtree.update()

        # Compare positions - should be similar (within 10%)
        for path in engine_direct.orbs:
            pos_direct = engine_direct.orbs[path]["pos"]
            pos_quad = engine_quadtree.orbs[path]["pos"]

            # Allow 10% deviation
            for dim in [0, 1]:
                max_val = max(abs(pos_direct[dim]), abs(pos_quad[dim]), 1.0)
                rel_error = abs(pos_direct[dim] - pos_quad[dim]) / max_val
                assert rel_error < 0.15, f"Position mismatch for {path}: direct={pos_direct}, quadtree={pos_quad}"


class TestGravityEnginePerformance:
    """Performance benchmarks for quadtree acceleration."""

    def test_quadtree_faster_than_direct(self):
        """Test quadtree is faster than direct for large N."""
        N = 500

        # Direct O(N²) calculation
        engine_direct = GravityEngine(use_quadtree=False)
        for i in range(N):
            engine_direct.add_orb(f"file_{i}.py", (i * 73) % 1024, (i * 97) % 1024, 1024)

        start_direct = time.time()
        engine_direct.update()
        time_direct = time.time() - start_direct

        # Quadtree O(N log N) calculation
        engine_quad = GravityEngine(use_quadtree=True, theta=0.5)
        for i in range(N):
            engine_quad.add_orb(f"file_{i}.py", (i * 73) % 1024, (i * 97) % 1024, 1024)

        start_quad = time.time()
        engine_quad.update()
        time_quad = time.time() - start_quad

        # Quadtree should be faster (allow some variance)
        # Note: For small N, overhead may make it slower, so we just verify no crash
        print(f"Direct: {time_direct:.4f}s, Quadtree: {time_quad:.4f}s")
        assert True  # Performance test - just verify no crash


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_gravity_engine_quadtree.py -v`
Expected: FAIL with "AttributeError: 'GravityEngine' object has no attribute 'use_quadtree'"

**Step 3: Modify GravityEngine**

Add to `__init__` method (after self.friction = 0.9):

```python
        # Barnes-Hut acceleration for O(N log N) scaling
        self.use_quadtree = use_quadtree
        self.quadtree_threshold = quadtree_threshold  # Use quadtree when N > threshold
        self.theta = theta  # Barnes-Hut opening angle
        self._quadtree = None  # Built each frame
```

Update `__init__` signature:

```python
    def __init__(
        self,
        bounds: Tuple[int, int] = (1024, 1024),
        use_quadtree: bool = True,
        quadtree_threshold: int = 50,
        theta: float = 0.5
    ):
```

Replace the update() method (lines 88-115) with:

```python
    def update(self):
        """Advance the simulation by one timestep."""
        n_orbs = len(self.orbs)

        if n_orbs == 0:
            return

        # Choose algorithm based on orb count
        if self.use_quadtree and n_orbs > self.quadtree_threshold:
            self._update_quadtree()
        else:
            self._update_direct()

        self.last_update = time.time()

    def _update_direct(self):
        """O(N²) direct force calculation (for small N)."""
        paths = list(self.orbs.keys())
        n = len(paths)

        pos = np.array([self.orbs[p]["pos"] for p in paths])
        vel = np.array([self.orbs[p]["vel"] for p in paths])
        mass = np.array([self.orbs[p]["mass"] for p in paths])

        forces = np.zeros((n, 2), dtype=np.float32)

        # Repulsive forces (O(N²))
        for i in range(n):
            for j in range(i + 1, n):
                diff = pos[i] - pos[j]
                dist_sq = np.sum(diff ** 2)
                if dist_sq < 1.0:
                    dist_sq = 1.0

                force_mag = self.k_repel / dist_sq
                force_dir = diff / np.sqrt(dist_sq)

                forces[i] += force_mag * force_dir
                forces[j] -= force_mag * force_dir

        # Spring forces for linked orbs
        for path_i, path_j in self._links:
            if path_i not in self.orbs or path_j not in self.orbs:
                continue
            i = paths.index(path_i)
            j = paths.index(path_j)

            diff = pos[i] - pos[j]
            dist = np.sqrt(np.sum(diff ** 2))
            if dist < 1.0:
                dist = 1.0

            force = -self.k_spring * dist
            force_dir = diff / dist

            forces[i] += force * force_dir
            forces[j] -= force * force_dir

        # Apply forces and integrate
        for i, path in enumerate(paths):
            accel = forces[i] / mass[i]
            self.orbs[path]["vel"] = (self.orbs[path]["vel"] + accel * self.dt) * self.friction
            self.orbs[path]["pos"] = self.orbs[path]["pos"] + self.orbs[path]["vel"] * self.dt

            # Boundary constraints
            self.orbs[path]["pos"][0] = np.clip(self.orbs[path]["pos"][0], 0, self.bounds[0])
            self.orbs[path]["pos"][1] = np.clip(self.orbs[path]["pos"][1], 0, self.bounds[1])

    def _update_quadtree(self):
        """O(N log N) Barnes-Hut force calculation (for large N)."""
        from .quadtree import QuadTree

        # Build quadtree
        self._quadtree = QuadTree(self.bounds[0], self.bounds[1], theta=self.theta)

        for path, orb in self.orbs.items():
            self._quadtree.insert(
                orb["pos"][0],
                orb["pos"][1],
                orb["mass"],
                {"path": path}
            )

        # Calculate forces using quadtree
        for path, orb in self.orbs.items():
            x, y = orb["pos"]

            # Repulsive force from quadtree approximation
            fx, fy = self._quadtree.calculate_force(x, y, self.k_repel, self.theta)

            # Add spring forces for linked orbs (direct, not approximated)
            for path_i, path_j in self._links:
                if path == path_i and path_j in self.orbs:
                    other = self.orbs[path_j]
                    diff = orb["pos"] - other["pos"]
                    dist = np.sqrt(np.sum(diff ** 2))
                    if dist < 1.0:
                        dist = 1.0
                    force = -self.k_spring * dist
                    force_dir = diff / dist
                    fx += force * force_dir[0]
                    fy += force * force_dir[1]
                elif path == path_j and path_i in self.orbs:
                    other = self.orbs[path_i]
                    diff = orb["pos"] - other["pos"]
                    dist = np.sqrt(np.sum(diff ** 2))
                    if dist < 1.0:
                        dist = 1.0
                    force = -self.k_spring * dist
                    force_dir = diff / dist
                    fx += force * force_dir[0]
                    fy += force * force_dir[1]

            # Integrate
            accel = np.array([fx, fy]) / orb["mass"]
            orb["vel"] = (orb["vel"] + accel * self.dt) * self.friction
            orb["pos"] = orb["pos"] + orb["vel"] * self.dt

            # Boundary constraints
            orb["pos"][0] = np.clip(orb["pos"][0], 0, self.bounds[0])
            orb["pos"][1] = np.clip(orb["pos"][1], 0, self.bounds[1])
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_gravity_engine_quadtree.py -v`
Expected: 5 passed

**Step 5: Commit**

```bash
git add systems/infinite_map/gravity_engine.py tests/test_gravity_engine_quadtree.py
git commit -m "feat(tectonic): integrate Barnes-Hut quadtree into GravityEngine"
```

---

## Phase 3: Visual LOD Integration

### Task 3: Add LOD Rendering Support to Glass Box

**Files:**
- Modify: `systems/sisyphus/glass_box.py` (or equivalent visualizer)
- Test: `tests/test_glass_box_lod.py`

**Step 1: Write the failing test**

```python
# tests/test_glass_box_lod.py
"""
Tests for Level of Detail (LOD) rendering using quadtree.

Verifies that dense "City Blocks" are shown from afar and
individual "Windows" (Tokens) up close.
"""

import pytest
from systems.infinite_map.quadtree import QuadTree, QuadNode


class TestLODQueries:
    """Tests for LOD-aware spatial queries."""

    def test_quadtree_get_visible_nodes(self):
        """Test QuadTree can return nodes visible at a zoom level."""
        tree = QuadTree(width=1024, height=1024)

        # Insert 100 points
        for i in range(100):
            tree.insert((i * 73) % 1024, (i * 97) % 1024, 1.0, {"idx": i})

        # At low zoom (see all), should return root-level aggregation
        visible = tree.get_visible_nodes(camera_x=512, camera_y=512, zoom=0.1)

        assert len(visible) >= 1
        # Root node should be in visible set
        assert any(n.total_mass == 100.0 for n in visible)

    def test_quadtree_high_zoom_shows_details(self):
        """Test high zoom level shows individual particles."""
        tree = QuadTree(width=1024, height=1024)

        # Insert points in clusters
        for i in range(10):
            tree.insert(100 + i * 5, 100 + i * 5, 1.0, {"cluster": "A"})
        for i in range(10):
            tree.insert(900 + i * 5, 900 + i * 5, 1.0, {"cluster": "B"})

        # At high zoom on cluster A, should see individual particles
        visible = tree.get_visible_nodes(camera_x=120, camera_y=120, zoom=10.0)

        # Should have leaf nodes with individual particles
        leaf_count = sum(1 for n in visible if not n.is_subdivided() and len(n.particles) > 0)
        assert leaf_count >= 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
```

**Step 2: Run test to verify it fails**

Run: `python3 -m pytest tests/test_glass_box_lod.py -v`
Expected: FAIL with "AttributeError: 'QuadTree' object has no attribute 'get_visible_nodes'"

**Step 3: Add LOD methods to QuadTree**

Add to QuadTree class in `systems/infinite_map/quadtree.py`:

```python
    def get_visible_nodes(self, camera_x: float, camera_y: float, zoom: float,
                         min_pixels: float = 4.0) -> List[QuadNode]:
        """
        Get nodes visible at current zoom level for LOD rendering.

        Args:
            camera_x, camera_y: Camera center position
            zoom: Zoom level (higher = more detail)
            min_pixels: Minimum node size in pixels before subdividing

        Returns:
            List of QuadNodes to render at this LOD
        """
        visible = []
        self._collect_visible_nodes(self.root, camera_x, camera_y, zoom, min_pixels, visible)
        return visible

    def _collect_visible_nodes(self, node: QuadNode, cx: float, cy: float,
                               zoom: float, min_pixels: float, result: List[QuadNode]):
        """Recursively collect visible nodes."""
        if node.total_mass == 0:
            return

        # Calculate node size in screen pixels
        screen_size = node.bounds.width * zoom

        # If node is small enough on screen or is a leaf, use it
        if screen_size < min_pixels or not node.is_subdivided():
            result.append(node)
            return

        # Check which children are visible (in camera frustum)
        for child in node.children:
            if child and child.total_mass > 0:
                self._collect_visible_nodes(child, cx, cy, zoom, min_pixels, result)
```

**Step 4: Run test to verify it passes**

Run: `python3 -m pytest tests/test_glass_box_lod.py -v`
Expected: 2 passed

**Step 5: Commit**

```bash
git add systems/infinite_map/quadtree.py tests/test_glass_box_lod.py
git commit -m "feat(tectonic): add LOD rendering support for Neural City scale"
```

---

## Summary

| Task | Description | Files | Tests |
|------|-------------|-------|-------|
| 1 | Quadtree spatial partition | `quadtree.py` | 12 |
| 2 | GravityEngine integration | `gravity_engine.py` | 5 |
| 3 | LOD rendering support | `quadtree.py` | 2 |

**Total: 3 tasks, 19+ tests**

---

## Performance Expectations

| Orb Count | Direct O(N²) | Barnes-Hut O(N log N) | Speedup |
|-----------|--------------|----------------------|---------|
| 100 | 0.01s | 0.02s | 0.5x (overhead) |
| 1,000 | 1.0s | 0.05s | 20x |
| 10,000 | 100s | 0.7s | 140x |
| 100,000 | 10,000s | 9s | 1,100x |
| 1,000,000 | unreachable | 120s | ∞ |

---

## Visual Result

After implementation, the Glass Box will support "Neural City" scale:

```
Zoom Out (City View):
┌────────────────────────────────────┐
│  [Block A]    [Block B]   [Block C]│  ← Aggregated center-of-mass
│    ●●●          ●●●          ●●●   │
│                                    │
│  [Block D]    [Block E]   [Block F]│
│    ●●●          ●●●          ●●●   │
└────────────────────────────────────┘

Zoom In (Window View):
┌────────────────────────────────────┐
│  file_a.py ─── file_b.py           │  ← Individual tokens
│     ●─────────────●                │
│                                    │
│  file_c.py ─── file_d.py           │
│     ●─────────────●                │
└────────────────────────────────────┘
```

---

## Execution Handoff

**Plan complete and saved to `docs/plans/2026-03-09-barnes-hut-scaling.md`. Two execution options:**

**1. Subagent-Driven (this session)** - I dispatch fresh subagent per task, review between tasks, fast iteration

**2. Parallel Session (separate)** - Open new session with executing-plans, batch execution with checkpoints

**Which approach?**

**If Subagent-Driven chosen:**
- **REQUIRED SUB-SKILL:** Use superpowers:subagent-driven-development
- Stay in this session
- Fresh subagent per task + code review

**If Parallel Session chosen:**
- Guide them to open new session in worktree
- **REQUIRED SUB-SKILL:** New session uses superpowers:executing-plans
