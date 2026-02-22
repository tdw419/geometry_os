"""
Tests for Memory Ghost data structures.

Memory Ghosts are past successful UI states that can be overlaid
on the live VM feed to visualize AI confidence levels.
"""
import pytest
import sys
import os

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


class TestMemoryGhostImport:
    """Tests for module import."""

    def test_import_memory_ghost(self):
        """MemoryGhost should be importable."""
        from memory_ghost import MemoryGhost
        assert MemoryGhost is not None


class TestMemoryGhostStructure:
    """Tests for MemoryGhost dataclass."""

    def test_memory_ghost_fields(self):
        """MemoryGhost should have required fields."""
        from memory_ghost import MemoryGhost

        ghost = MemoryGhost(
            ghost_id="test-001",
            source_memory="Text Clip Creation",
            panels=[{"bbox": [10, 20, 100, 80]}],
            buttons=[{"bbox": [5, 10, 50, 30]}],
            similarity=0.85,
            confidence="HIGH",
            timestamp=1708400000.0
        )

        assert ghost.ghost_id == "test-001"
        assert ghost.similarity == 0.85
        assert ghost.confidence == "HIGH"

    def test_memory_ghost_opacity_calculation(self):
        """MemoryGhost should calculate opacity from confidence."""
        from memory_ghost import MemoryGhost

        ghost_high = MemoryGhost(
            ghost_id="high",
            source_memory="Test",
            panels=[],
            buttons=[],
            similarity=0.95,
            confidence="HIGH",
            timestamp=0
        )
        assert ghost_high.get_opacity() > 0.7

        ghost_low = MemoryGhost(
            ghost_id="low",
            source_memory="Test",
            panels=[],
            buttons=[],
            similarity=0.3,
            confidence="LOW",
            timestamp=0
        )
        assert ghost_low.get_opacity() < 0.4

    def test_memory_ghost_to_dict(self):
        """MemoryGhost should serialize to dict for JSON."""
        from memory_ghost import MemoryGhost

        ghost = MemoryGhost(
            ghost_id="test-001",
            source_memory="Test",
            panels=[{"bbox": [0, 0, 10, 10]}],
            buttons=[],
            similarity=0.8,
            confidence="MEDIUM",
            timestamp=1708400000.0
        )

        d = ghost.to_dict()
        assert "ghost_id" in d
        assert "opacity" in d
        assert "panels" in d
