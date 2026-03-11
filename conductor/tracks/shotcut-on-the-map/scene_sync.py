#!/usr/bin/env python3
"""
Scene Sync Service

Keeps the ASCII scene graph synchronized with VM state using polling
with configurable interval and hash comparison for change detection.

Usage:
    from scene_sync import SceneSyncService

    service = SceneSyncService("screenshot.png", poll_interval=0.5)
    service.start()
    # ... later ...
    service.stop()
"""

import asyncio
import hashlib
from dataclasses import dataclass, field
from typing import Optional, Callable, List
from datetime import datetime

# Import from existing modules
from gui_structure_analyzer import analyze_screenshot, AnalysisResult


@dataclass
class SyncState:
    """
    State of scene synchronization.

    Attributes:
        current_view: Truncated view of current ASCII representation
        last_screenshot_hash: MD5 hash of last processed screenshot
        changes_detected: Count of changes detected since start
        last_sync_time: Timestamp of last successful sync
        pending_changes: List of pending change identifiers
    """
    current_view: str = ""
    last_screenshot_hash: str = ""
    changes_detected: int = 0
    last_sync_time: Optional[datetime] = None
    pending_changes: List[str] = field(default_factory=list)


class SceneSyncService:
    """
    Service to keep ASCII scene graph synchronized with VM state.

    Uses polling with configurable interval and hash comparison
    for change detection.

    Example:
        >>> def on_scene_change(result):
        ...     print(f"Scene updated: {len(result.elements)} elements")
        ...
        >>> service = SceneSyncService(
        ...     screenshot_path="vm_screen.png",
        ...     poll_interval=1.0,
        ...     on_change=on_scene_change
        ... )
        >>> service.start()
        >>> # ... wait for changes ...
        >>> service.stop()
    """

    def __init__(
        self,
        screenshot_path: str,
        poll_interval: float = 1.0,
        on_change: Optional[Callable[[AnalysisResult], None]] = None
    ):
        """
        Initialize the SceneSyncService.

        Args:
            screenshot_path: Path to the screenshot file to monitor
            poll_interval: Time in seconds between polls (default: 1.0)
            on_change: Optional callback when scene changes are detected
        """
        self.screenshot_path = screenshot_path
        self.poll_interval = poll_interval
        self.on_change = on_change
        self.state = SyncState()
        self._running = False
        self._task: Optional[asyncio.Task] = None

    def start(self) -> None:
        """
        Begin polling loop.

        Creates an async task that polls the screenshot at the configured
        interval and triggers synchronization when changes are detected.
        """
        self._running = True
        self._task = asyncio.create_task(self._poll_loop())

    def stop(self) -> None:
        """
        Stop polling loop.

        Cancels the background polling task and marks the service as stopped.
        """
        self._running = False
        if self._task:
            self._task.cancel()
            self._task = None

    async def _poll_loop(self) -> None:
        """
        Internal polling loop.

        Continuously polls the screenshot at the configured interval
        and calls force_sync() to detect and process changes.
        """
        while self._running:
            try:
                await self.force_sync()
            except Exception as e:
                # Log but don't crash the loop
                print(f"Poll error: {e}")
            await asyncio.sleep(self.poll_interval)

    async def force_sync(self) -> bool:
        """
        Trigger immediate synchronization.

        Reads the screenshot, computes hash, and if different from the
        last hash, analyzes the image and updates the scene graph.

        Returns:
            True if changes were detected and processed, False otherwise

        Raises:
            FileNotFoundError: If screenshot file doesn't exist
            PermissionError: If screenshot file is not readable
        """
        try:
            # Read screenshot and compute hash
            with open(self.screenshot_path, 'rb') as f:
                data = f.read()
            current_hash = hashlib.md5(data).hexdigest()

            # Check for changes
            if current_hash != self.state.last_screenshot_hash:
                # Analyze the new screenshot
                result = analyze_screenshot(self.screenshot_path)

                # Update state
                self.state.last_screenshot_hash = current_hash
                self.state.current_view = result.ascii_view[:100]  # Truncate for state
                self.state.changes_detected += 1
                self.state.last_sync_time = datetime.now()
                self.state.pending_changes.append(f"change_{self.state.changes_detected}")

                # Notify callback
                if self.on_change:
                    self.on_change(result)

                return True

            return False

        except Exception as e:
            print(f"Sync error: {e}")
            return False

    def get_state(self) -> SyncState:
        """
        Get current sync state.

        Returns:
            Current SyncState object with all sync metadata
        """
        return self.state


# Convenience function for synchronous usage
def sync_once(screenshot_path: str) -> tuple[bool, Optional[AnalysisResult]]:
    """
    Perform a single sync operation synchronously.

    Args:
        screenshot_path: Path to the screenshot file

    Returns:
        Tuple of (changed, result) where changed is True if changes detected,
        and result is the AnalysisResult or None if no changes
    """
    service = SceneSyncService(screenshot_path)
    changed = asyncio.run(service.force_sync())
    result = None
    if changed and service.state.changes_detected > 0:
        # Re-run to get the result (state only stores truncated view)
        result = analyze_screenshot(screenshot_path)
    return changed, result
