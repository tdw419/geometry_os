"""
Roadmap Auto-Discovery Module

Provides automatic discovery of roadmap files in a project directory tree.
Supports multiple naming patterns and intelligent prioritization.
"""

from pathlib import Path
from typing import List, Optional
from dataclasses import dataclass, field
import asyncio


@dataclass
class DiscoveredRoadmap:
    """Represents a discovered roadmap file with metadata."""
    path: Path
    title: str
    priority: int
    last_modified: float
    phase_count: int
    task_count: int
    completion_percentage: float


class RoadmapDiscovery:
    """
    Discovers and analyzes roadmap files in a directory tree.

    Searches for roadmap files using common naming patterns and provides
    metadata for prioritization and selection.
    """

    def __init__(self, search_root: Path, max_depth: int = 3):
        """
        Initialize the roadmap discovery system.

        Args:
            search_root: Root directory to search for roadmaps
            max_depth: Maximum directory depth to search (default: 3)
        """
        self.search_root = Path(search_root)
        self.max_depth = max_depth
        # Patterns in priority order - unified roadmaps first, then standard roadmaps
        self.patterns = [
            "UNIFIED_ROADMAP*.md",  # Highest priority - main project roadmap
            "unified_roadmap*.md",
            "ROADMAP.md",
            "roadmap.md",
            "roadmap*.md",
            "*ROADMAP*.md",
        ]

    async def discover(self) -> List[DiscoveredRoadmap]:
        """
        Find all roadmap files in the search directory.

        Returns:
            List of discovered roadmaps sorted by last modified time (newest first)
        """
        results = []

        for pattern in self.patterns:
            for roadmap_file in self.search_root.rglob(pattern):
                # Limit directory depth
                try:
                    rel_path = roadmap_file.relative_to(self.search_root)
                    depth = len(rel_path.parts) - 1  # -1 because the file itself counts
                except ValueError:
                    # File is not relative to search root (shouldn't happen with rglob)
                    continue

                if depth > self.max_depth:
                    continue

                # Skip hidden directories
                if any(part.startswith('.') for part in rel_path.parts):
                    continue

                # Get file stats
                try:
                    stat = roadmap_file.stat()
                except (OSError, IOError):
                    continue

                # Extract title from filename
                title = self._extract_title(roadmap_file)

                results.append(DiscoveredRoadmap(
                    path=roadmap_file,
                    title=title,
                    priority=self._calculate_priority(roadmap_file, stat),
                    last_modified=stat.st_mtime,
                    phase_count=0,  # Will be filled by analyze_roadmap()
                    task_count=0,
                    completion_percentage=0.0
                ))

        # Sort by last modified (newest first), then by priority
        results.sort(key=lambda r: (-r.last_modified, -r.priority))

        return results

    def _extract_title(self, path: Path) -> str:
        """
        Extract a human-readable title from the roadmap path.

        Args:
            path: Path to the roadmap file

        Returns:
            Title string
        """
        # Use filename without extension
        title = path.stem

        # Clean up common prefixes
        for prefix in ["roadmap", "ROADMAP", "Roadmap"]:
            if title.startswith(prefix):
                title = title[len(prefix):]
                title = title.strip(" -_")

        # If title is empty after cleanup, use parent directory name
        if not title and path.parent != path:
            title = path.parent.name

        # Capitalize first letter
        if title:
            title = title[0].upper() + title[1:] if len(title) > 1 else title.upper()

        return title or "Untitled Roadmap"

    def _calculate_priority(self, path: Path, stat) -> int:
        """
        Calculate a priority score for the roadmap file.

        Higher priority = more important. Priority is based on:
        - File location (root directory > subdirectory)
        - Filename (ROADMAP.md > roadmap-something.md)
        - Recency (newer files get slight boost)

        Args:
            path: Path to the roadmap file
            stat: File stat object

        Returns:
            Priority score (0-100)
        """
        priority = 50  # Default medium priority

        # Location bonus: root directory files are more important
        try:
            rel_path = path.relative_to(self.search_root)
            depth = len(rel_path.parts) - 1
        except ValueError:
            depth = 0

        if depth == 0:
            priority += 20  # Root level bonus
        elif depth == 1:
            priority += 10
        elif depth > 2:
            priority -= 10

        # Filename bonus: specific patterns get higher priority
        filename = path.name
        if filename == "ROADMAP.md" or filename == "roadmap.md":
            priority += 15
        elif filename.startswith("ROADMAP"):
            priority += 10
        elif "roadmap" in filename.lower():
            priority += 5

        # Recency bonus: newer files get slight boost
        import time
        age_days = (time.time() - stat.st_mtime) / 86400
        if age_days < 7:
            priority += 10  # Modified within last week
        elif age_days < 30:
            priority += 5

        # Clamp to valid range
        return max(0, min(100, priority))

    async def analyze_roadmap(self, roadmap: DiscoveredRoadmap) -> DiscoveredRoadmap:
        """
        Analyze a roadmap file to extract metadata.

        Updates the roadmap with phase count, task count, and completion percentage.

        Args:
            roadmap: DiscoveredRoadmap to analyze

        Returns:
            Updated DiscoveredRoadmap with metadata
        """
        try:
            from ..roadmap import parse_roadmap_file

            roadmap_model = parse_roadmap_file(roadmap.path)

            # Count phases and tasks
            phase_count = len(roadmap_model.phases)

            total_tasks = 0
            completed_tasks = 0
            for phase in roadmap_model.phases:
                for feature in phase.features:
                    for task in feature.tasks:
                        total_tasks += 1
                        if task.completed:
                            completed_tasks += 1

            # Calculate completion percentage
            completion = (completed_tasks / total_tasks * 100) if total_tasks > 0 else 0.0

            # Update the roadmap object
            roadmap.phase_count = phase_count
            roadmap.task_count = total_tasks
            roadmap.completion_percentage = completion

        except Exception:
            # If parsing fails, leave default values
            pass

        return roadmap

    async def discover_and_analyze(self) -> List[DiscoveredRoadmap]:
        """
        Discover roadmaps and analyze them in parallel.

        Returns:
            List of discovered and analyzed roadmaps
        """
        roadmaps = await self.discover()

        # Analyze all roadmaps in parallel
        analysis_tasks = [self.analyze_roadmap(rm) for rm in roadmaps]
        analyzed = await asyncio.gather(*analysis_tasks)

        return list(analyzed)


def create_discovery(search_root: Path, max_depth: int = 3) -> RoadmapDiscovery:
    """
    Convenience function to create a RoadmapDiscovery instance.

    Args:
        search_root: Root directory to search for roadmaps
        max_depth: Maximum directory depth to search

    Returns:
        Configured RoadmapDiscovery instance
    """
    return RoadmapDiscovery(search_root=search_root, max_depth=max_depth)
