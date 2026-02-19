#!/usr/bin/env python3
"""
Tests for Scene Sync Service

Tests the SceneSyncService for keeping ASCII scene graph synchronized
with VM state.

Run with:
    pytest conductor/tracks/shotcut-on-the-map/tests/test_scene_sync.py -v
"""

import pytest
import asyncio
import tempfile
import os
from PIL import Image
from unittest.mock import patch, MagicMock

# Add parent directory to path for imports
import sys
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from scene_sync import SceneSyncService, SyncState
from gui_structure_analyzer import AnalysisResult, UIElement


@pytest.fixture
def test_screenshot():
    """Create a temporary test screenshot."""
    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        # Create a simple test image
        img = Image.new('RGB', (100, 100), color='white')
        img.save(f.name)
        yield f.name
    os.unlink(f.name)


@pytest.fixture
def modified_screenshot(test_screenshot):
    """Create a modified version of the test screenshot."""
    def modify():
        img = Image.new('RGB', (100, 100), color='black')
        img.save(test_screenshot)
    return modify


@pytest.fixture
def mock_analysis_result():
    """Create a mock AnalysisResult for testing."""
    return AnalysisResult(
        elements=[
            UIElement(text="Test Button", bbox=(10, 10, 100, 30), confidence=95)
        ],
        clusters=[],
        ascii_view="Test ASCII View Content Here"
    )


class TestSyncState:
    """Tests for SyncState dataclass."""

    def test_sync_state_defaults(self):
        """SyncState has sensible defaults."""
        state = SyncState()
        assert state.current_view == ""
        assert state.last_screenshot_hash == ""
        assert state.changes_detected == 0
        assert state.last_sync_time is None
        assert state.pending_changes == []

    def test_sync_state_tracks_changes(self):
        """SyncState can track pending changes."""
        state = SyncState()
        state.pending_changes.append("view_changed")
        assert len(state.pending_changes) == 1

    def test_sync_state_can_be_copied(self):
        """SyncState can be copied and modified independently."""
        state1 = SyncState(changes_detected=5)
        state2 = SyncState(**state1.__dict__)
        state2.changes_detected = 10
        assert state1.changes_detected == 5
        assert state2.changes_detected == 10


class TestSceneSyncService:
    """Tests for SceneSyncService class."""

    def test_service_initialization(self, test_screenshot):
        """SceneSyncService initializes with correct defaults."""
        service = SceneSyncService(test_screenshot)
        assert service.screenshot_path == test_screenshot
        assert service.poll_interval == 1.0
        assert service._running == False
        assert service.state.changes_detected == 0

    def test_service_initialization_with_custom_params(self, test_screenshot):
        """SceneSyncService accepts custom parameters."""
        callback = lambda x: None
        service = SceneSyncService(
            test_screenshot,
            poll_interval=0.5,
            on_change=callback
        )
        assert service.poll_interval == 0.5
        assert service.on_change == callback

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_force_sync_detects_first_sync(self, mock_analyze, test_screenshot, mock_analysis_result):
        """First sync always detects a change."""
        mock_analyze.return_value = mock_analysis_result

        service = SceneSyncService(test_screenshot)

        # Run force_sync
        changed = await service.force_sync()

        assert changed == True
        assert service.state.changes_detected == 1
        assert service.state.last_screenshot_hash != ""
        assert service.state.last_sync_time is not None
        mock_analyze.assert_called_once_with(test_screenshot)

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_force_sync_no_change_same_image(self, mock_analyze, test_screenshot, mock_analysis_result):
        """No change detected if image is same."""
        mock_analyze.return_value = mock_analysis_result

        service = SceneSyncService(test_screenshot)

        # First sync
        await service.force_sync()
        initial_changes = service.state.changes_detected
        initial_hash = service.state.last_screenshot_hash

        # Second sync with same image
        changed = await service.force_sync()

        assert changed == False
        assert service.state.changes_detected == initial_changes
        assert service.state.last_screenshot_hash == initial_hash
        # analyze_screenshot should only be called once (on first sync)
        assert mock_analyze.call_count == 1

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_force_sync_detects_image_change(self, mock_analyze, test_screenshot, modified_screenshot, mock_analysis_result):
        """Change detected when image is modified."""
        mock_analyze.return_value = mock_analysis_result

        service = SceneSyncService(test_screenshot)

        # First sync
        await service.force_sync()
        initial_hash = service.state.last_screenshot_hash

        # Modify image
        modified_screenshot()

        # Second sync
        changed = await service.force_sync()

        assert changed == True
        assert service.state.last_screenshot_hash != initial_hash
        assert service.state.changes_detected == 2
        # analyze_screenshot should be called twice (both syncs)
        assert mock_analyze.call_count == 2

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_on_change_callback(self, mock_analyze, test_screenshot, mock_analysis_result):
        """on_change callback is called when changes detected."""
        mock_analyze.return_value = mock_analysis_result
        callback_called = []

        def on_change(result):
            callback_called.append(result)

        service = SceneSyncService(test_screenshot, on_change=on_change)
        await service.force_sync()

        assert len(callback_called) == 1
        assert callback_called[0] == mock_analysis_result

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_on_change_callback_not_called_on_no_change(self, mock_analyze, test_screenshot, mock_analysis_result):
        """on_change callback is not called when no changes detected."""
        mock_analyze.return_value = mock_analysis_result
        callback_called = []

        def on_change(result):
            callback_called.append(result)

        service = SceneSyncService(test_screenshot, on_change=on_change)

        # First sync (triggers callback)
        await service.force_sync()
        assert len(callback_called) == 1

        # Second sync (no change, no callback)
        await service.force_sync()
        assert len(callback_called) == 1

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_start_begins_polling(self, mock_analyze, test_screenshot, mock_analysis_result):
        """start() begins the polling loop."""
        mock_analyze.return_value = mock_analysis_result

        service = SceneSyncService(test_screenshot, poll_interval=0.1)

        service.start()
        assert service._running == True

        # Let it poll once
        await asyncio.sleep(0.15)

        service.stop()
        assert service._running == False
        assert service.state.changes_detected >= 1

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_polling_continues_after_first_change(self, mock_analyze, test_screenshot, mock_analysis_result, modified_screenshot):
        """Polling continues to detect changes after initial sync."""
        mock_analyze.return_value = mock_analysis_result

        service = SceneSyncService(test_screenshot, poll_interval=0.05)

        service.start()

        # Let first poll happen
        await asyncio.sleep(0.1)
        initial_changes = service.state.changes_detected

        # Modify the image
        modified_screenshot()

        # Let next poll happen
        await asyncio.sleep(0.15)

        service.stop()
        assert service.state.changes_detected > initial_changes

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_get_state_returns_current_state(self, mock_analyze, test_screenshot, mock_analysis_result):
        """get_state() returns current SyncState."""
        mock_analyze.return_value = mock_analysis_result

        service = SceneSyncService(test_screenshot)
        await service.force_sync()

        state = service.get_state()
        assert isinstance(state, SyncState)
        assert state.changes_detected == 1
        assert state.last_screenshot_hash != ""
        assert state.last_sync_time is not None

    @pytest.mark.asyncio
    async def test_force_sync_handles_missing_file(self, test_screenshot):
        """force_sync handles missing file gracefully."""
        # Use a non-existent file
        service = SceneSyncService("/nonexistent/path/screenshot.png")

        # Should not raise, should return False
        changed = await service.force_sync()
        assert changed == False
        assert service.state.changes_detected == 0

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_current_view_truncated(self, mock_analyze, test_screenshot):
        """Current view is truncated to 100 characters in state."""
        # Create a result with a very long ascii_view
        long_ascii = "X" * 500
        mock_analyze.return_value = AnalysisResult(
            elements=[],
            clusters=[],
            ascii_view=long_ascii
        )

        service = SceneSyncService(test_screenshot)
        await service.force_sync()

        assert len(service.state.current_view) == 100
        assert service.state.current_view == "X" * 100

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_pending_changes_accumulate(self, mock_analyze, test_screenshot, modified_screenshot, mock_analysis_result):
        """Pending changes list accumulates across syncs."""
        mock_analyze.return_value = mock_analysis_result

        service = SceneSyncService(test_screenshot)

        # First sync
        await service.force_sync()
        assert len(service.state.pending_changes) == 1
        assert service.state.pending_changes[0] == "change_1"

        # Modify and sync again
        modified_screenshot()
        await service.force_sync()
        assert len(service.state.pending_changes) == 2
        assert service.state.pending_changes[1] == "change_2"

    @pytest.mark.asyncio
    @patch('scene_sync.analyze_screenshot')
    async def test_stop_cancels_task(self, mock_analyze, test_screenshot, mock_analysis_result):
        """stop() properly cancels the background task."""
        mock_analyze.return_value = mock_analysis_result

        service = SceneSyncService(test_screenshot, poll_interval=0.1)
        service.start()

        assert service._task is not None
        task = service._task

        service.stop()

        # Task should be cancelled or completed
        assert service._task is None or task.cancelled() or task.done()


class TestSceneSyncServiceIntegration:
    """Integration tests that use real file I/O."""

    @pytest.mark.asyncio
    async def test_real_image_change_detection(self):
        """Test with real image file modification."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            # Create initial image
            img = Image.new('RGB', (200, 200), color='red')
            img.save(f.name)
            screenshot_path = f.name

        try:
            service = SceneSyncService(screenshot_path)

            # First sync
            with patch('scene_sync.analyze_screenshot') as mock_analyze:
                mock_analyze.return_value = AnalysisResult(
                    elements=[],
                    clusters=[],
                    ascii_view="Red image"
                )
                changed1 = await service.force_sync()

            assert changed1 == True

            # Modify image (different color = different hash)
            img = Image.new('RGB', (200, 200), color='blue')
            img.save(screenshot_path)

            # Second sync
            with patch('scene_sync.analyze_screenshot') as mock_analyze:
                mock_analyze.return_value = AnalysisResult(
                    elements=[],
                    clusters=[],
                    ascii_view="Blue image"
                )
                changed2 = await service.force_sync()

            assert changed2 == True
            assert service.state.changes_detected == 2

        finally:
            os.unlink(screenshot_path)
