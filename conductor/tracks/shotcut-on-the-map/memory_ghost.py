"""
Memory Ghost - Past UI State Overlay

Memory Ghosts are translucent overlays of past successful UI states
that can be rendered on top of the live VM feed to visualize AI
confidence levels.

Usage:
    ghost = MemoryGhost.from_memory_match(match)
    opacity = ghost.get_opacity()  # Based on confidence/similarity
    data = ghost.to_dict()  # For JSON transmission
"""

import time
from dataclasses import dataclass, field
from typing import List, Dict, Any, Optional
import uuid


@dataclass
class MemoryGhost:
    """
    A translucent overlay representing a past successful UI state.

    Ghosts are rendered on top of the live VM feed to show:
    - Where similar UI elements were found before
    - Confidence level (via opacity)
    - Match similarity (via color intensity)
    """
    ghost_id: str
    source_memory: str  # Title of the WordPress memory this came from
    panels: List[Dict[str, Any]]
    buttons: List[Dict[str, Any]]
    lines: List[Dict[str, Any]] = field(default_factory=list)
    similarity: float = 0.0
    confidence: str = "LOW"  # HIGH, MEDIUM, LOW
    timestamp: float = field(default_factory=time.time)

    # Visual properties
    color_high: str = "#00FF00"  # Green for HIGH confidence
    color_medium: str = "#FFFF00"  # Yellow for MEDIUM
    color_low: str = "#FF6600"  # Orange for LOW

    def get_opacity(self) -> float:
        """
        Calculate opacity based on confidence and similarity.

        Returns:
            Float 0.0-1.0 for CSS opacity
        """
        base_opacity = {
            "HIGH": 0.8,
            "MEDIUM": 0.5,
            "LOW": 0.3
        }.get(self.confidence, 0.3)

        # Adjust by similarity
        similarity_factor = self.similarity * 0.2

        return min(1.0, base_opacity + similarity_factor)

    def get_color(self) -> str:
        """Get color based on confidence level."""
        return {
            "HIGH": self.color_high,
            "MEDIUM": self.color_medium,
            "LOW": self.color_low
        }.get(self.confidence, self.color_low)

    def to_dict(self) -> Dict[str, Any]:
        """Serialize to dict for JSON transmission to browser."""
        return {
            "ghost_id": self.ghost_id,
            "source_memory": self.source_memory,
            "panels": self.panels[:10],  # Limit for bandwidth
            "buttons": self.buttons[:15],
            "lines": self.lines[:10],
            "similarity": self.similarity,
            "confidence": self.confidence,
            "opacity": self.get_opacity(),
            "color": self.get_color(),
            "timestamp": self.timestamp
        }

    @classmethod
    def from_memory_match(cls, match: Any) -> 'MemoryGhost':
        """
        Create a MemoryGhost from a SemanticMatch result.

        Args:
            match: SemanticMatch from SemanticDrivenAutomation

        Returns:
            MemoryGhost instance
        """
        return cls(
            ghost_id=str(uuid.uuid4())[:8],
            source_memory=match.memory.title if match.memory else "Unknown",
            panels=[],  # Populated from memory content
            buttons=[],
            similarity=match.similarity,
            confidence=match.confidence
        )

    @classmethod
    def from_layout_result(cls, layout: Any, source: str = "Live") -> 'MemoryGhost':
        """
        Create a MemoryGhost from a LayoutResult.

        Args:
            layout: LayoutResult from LayoutInferencer
            source: Source description

        Returns:
            MemoryGhost instance
        """
        return cls(
            ghost_id=str(uuid.uuid4())[:8],
            source_memory=source,
            panels=[{"bbox": p.get("bbox", [0, 0, 0, 0])} for p in layout.panels],
            buttons=[{"bbox": b.get("bbox", [0, 0, 0, 0])} for b in layout.buttons],
            lines=[
                {"x1": l[0][0], "y1": l[0][1], "x2": l[1][0], "y2": l[1][1]}
                for l in layout.lines
            ],
            similarity=1.0,
            confidence="HIGH"
        )


class GhostRegistry:
    """
    Registry for active Memory Ghosts.

    Manages ghost lifecycle, deduplication, and fading.
    """

    MAX_GHOSTS = 10
    FADE_TIME_SECONDS = 30

    def __init__(self):
        self.ghosts: List[MemoryGhost] = []

    def add_ghost(self, ghost: MemoryGhost) -> None:
        """Add a ghost, evicting oldest if at capacity."""
        if len(self.ghosts) >= self.MAX_GHOSTS:
            self.ghosts.pop(0)  # Remove oldest
        self.ghosts.append(ghost)

    def get_active_ghosts(self) -> List[MemoryGhost]:
        """Get ghosts that haven't faded yet."""
        now = time.time()
        return [
            g for g in self.ghosts
            if now - g.timestamp < self.FADE_TIME_SECONDS
        ]

    def clear(self) -> None:
        """Clear all ghosts."""
        self.ghosts = []

    def to_broadcast(self) -> List[Dict]:
        """Serialize all active ghosts for WebSocket broadcast."""
        return [g.to_dict() for g in self.get_active_ghosts()]
