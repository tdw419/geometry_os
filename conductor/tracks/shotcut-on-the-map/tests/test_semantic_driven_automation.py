"""
Tests for Semantic-Driven Automation (The Ouroboros Demonstration).

Tests the full loop:
    Memory (WordPress) → Verification (Visual) → Action → Memory (Update)
"""
import pytest
import sys
import os
import numpy as np
import tempfile

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


class TestGhostGeneration:
    """Tests for ghost generation during automation."""

    def test_semantic_automation_has_ghost_registry(self):
        """SemanticDrivenAutomation should have GhostRegistry."""
        from semantic_driven_automation import SemanticDrivenAutomation
        from memory_ghost import GhostRegistry

        automation = SemanticDrivenAutomation(wordpress_enabled=False)
        assert hasattr(automation, 'ghost_registry')
        assert isinstance(automation.ghost_registry, GhostRegistry)

    def test_execute_creates_ghost(self):
        """execute_with_memory should create a MemoryGhost."""
        from semantic_driven_automation import SemanticDrivenAutomation
        from memory_ghost import MemoryGhost
        cv2 = pytest.importorskip("cv2", reason="OpenCV not installed")

        # Create test image
        img = np.zeros((200, 200, 3), dtype=np.uint8)
        cv2.rectangle(img, (10, 10), (110, 110), (255, 255, 255), -1)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            automation = SemanticDrivenAutomation(wordpress_enabled=False)
            result = automation.execute_with_memory(temp_path, "Test")

            # Should have ghosts in result
            assert "ghosts" in result
        finally:
            os.unlink(temp_path)


class TestSemanticDrivenAutomationImport:
    """Tests for module import and basic structure."""

    def test_import_semantic_automation(self):
        """SemanticDrivenAutomation should be importable."""
        from semantic_driven_automation import SemanticDrivenAutomation
        assert SemanticDrivenAutomation is not None

    def test_semantic_automation_instantiation(self):
        """SemanticDrivenAutomation should instantiate."""
        from semantic_driven_automation import SemanticDrivenAutomation
        automation = SemanticDrivenAutomation(wordpress_enabled=False)
        assert automation is not None


class TestSemanticMatch:
    """Tests for SemanticMatch dataclass."""

    def test_semantic_match_structure(self):
        """SemanticMatch should have expected fields."""
        from semantic_driven_automation import SemanticMatch

        # Create a mock memory
        class MockMemory:
            title = "Test Memory"
            panel_count = 5
            button_count = 10

            def similarity_score(self, panels, buttons):
                return 0.9

        match = SemanticMatch(
            memory=MockMemory(),
            similarity=0.9,
            confidence="HIGH",
            matched_elements=["panels", "buttons"]
        )

        assert match.similarity == 0.9
        assert match.confidence == "HIGH"
        assert "panels" in match.matched_elements


class TestMemoryQuery:
    """Tests for memory query functionality."""

    def test_query_memory_for_action_method(self):
        """query_memory_for_action method should exist."""
        from semantic_driven_automation import SemanticDrivenAutomation

        automation = SemanticDrivenAutomation(wordpress_enabled=False)
        assert hasattr(automation, 'query_memory_for_action')

    def test_query_memory_without_wordpress(self):
        """Query should handle WordPress unavailable gracefully."""
        from semantic_driven_automation import SemanticDrivenAutomation

        automation = SemanticDrivenAutomation(wordpress_enabled=False)
        results = automation.query_memory_for_action("Text Clip")

        # Should return empty list when WordPress not available
        assert results == []


class TestScreenVerification:
    """Tests for screen verification functionality."""

    def test_verify_current_screen_method(self):
        """verify_current_screen method should exist."""
        from semantic_driven_automation import SemanticDrivenAutomation

        automation = SemanticDrivenAutomation(wordpress_enabled=False)
        assert hasattr(automation, 'verify_current_screen')

    def test_find_best_memory_match_method(self):
        """find_best_memory_match method should exist."""
        from semantic_driven_automation import SemanticDrivenAutomation

        automation = SemanticDrivenAutomation(wordpress_enabled=False)
        assert hasattr(automation, 'find_best_memory_match')


class TestConfidenceThresholds:
    """Tests for confidence threshold determination."""

    def test_confidence_thresholds_exist(self):
        """CONFIDENCE_THRESHOLDS should be defined."""
        from semantic_driven_automation import SemanticDrivenAutomation

        assert hasattr(SemanticDrivenAutomation, 'CONFIDENCE_THRESHOLDS')
        assert SemanticDrivenAutomation.CONFIDENCE_THRESHOLDS["HIGH"] > SemanticDrivenAutomation.CONFIDENCE_THRESHOLDS["MEDIUM"]
        assert SemanticDrivenAutomation.CONFIDENCE_THRESHOLDS["MEDIUM"] > SemanticDrivenAutomation.CONFIDENCE_THRESHOLDS["LOW"]


class TestVerificationHistory:
    """Tests for verification history tracking."""

    def test_verification_history_tracking(self):
        """Verification history should be tracked."""
        from semantic_driven_automation import SemanticDrivenAutomation

        automation = SemanticDrivenAutomation(wordpress_enabled=False)
        assert hasattr(automation, 'verification_history')
        assert automation.verification_history == []

    def test_get_verification_summary_method(self):
        """get_verification_summary method should exist."""
        from semantic_driven_automation import SemanticDrivenAutomation

        automation = SemanticDrivenAutomation(wordpress_enabled=False)
        assert hasattr(automation, 'get_verification_summary')

        summary = automation.get_verification_summary()
        assert "total_verifications" in summary


class TestExecuteWithMemory:
    """Tests for the main execution loop."""

    def test_execute_with_memory_method(self):
        """execute_with_memory method should exist."""
        from semantic_driven_automation import SemanticDrivenAutomation

        automation = SemanticDrivenAutomation(wordpress_enabled=False)
        assert hasattr(automation, 'execute_with_memory')

    def test_execute_returns_result_dict(self):
        """execute_with_memory should return result dict."""
        from semantic_driven_automation import SemanticDrivenAutomation
        cv2 = pytest.importorskip("cv2", reason="OpenCV not installed")

        # Create a test image
        img = np.zeros((200, 200, 3), dtype=np.uint8)
        cv2.rectangle(img, (10, 10), (110, 110), (255, 255, 255), -1)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        try:
            automation = SemanticDrivenAutomation(wordpress_enabled=False)
            result = automation.execute_with_memory(temp_path, "Test Action")

            assert isinstance(result, dict)
            assert "action" in result
            assert "confidence" in result
            assert "timestamp" in result
        finally:
            os.unlink(temp_path)

    def test_execute_with_custom_handler(self):
        """execute_with_memory should accept custom action handler."""
        from semantic_driven_automation import SemanticDrivenAutomation
        cv2 = pytest.importorskip("cv2", reason="OpenCV not installed")

        # Create test image
        img = np.zeros((200, 200, 3), dtype=np.uint8)
        cv2.rectangle(img, (10, 10), (110, 110), (255, 255, 255), -1)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            cv2.imwrite(f.name, img)
            temp_path = f.name

        # Custom handler
        def custom_handler(result, match):
            return {"custom": True, "widgets_found": len(result.widgets)}

        try:
            automation = SemanticDrivenAutomation(wordpress_enabled=False)
            result = automation.execute_with_memory(
                temp_path,
                "Test Action",
                action_handler=custom_handler
            )

            assert "action_result" in result
            assert result["action_result"]["custom"] is True
        finally:
            os.unlink(temp_path)


class TestDemoHandler:
    """Tests for the demo action handler."""

    def test_demo_create_title_handler_exists(self):
        """demo_create_title_handler should be importable."""
        from semantic_driven_automation import demo_create_title_handler
        assert demo_create_title_handler is not None

    def test_demo_handler_returns_dict(self):
        """Demo handler should return a dict."""
        from semantic_driven_automation import demo_create_title_handler
        from extraction_pipeline import ExtractionResult

        # Create mock result
        result = ExtractionResult()
        match = None

        output = demo_create_title_handler(result, match)
        assert isinstance(output, dict)
        assert "status" in output
