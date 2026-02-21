#!/usr/bin/env python3
"""
Semantic-Driven Automation - The Ouroboros Demonstration

This script demonstrates the full power of the WordPress Semantic District:
1. Query WordPress for a previously successful "Text Clip" layout
2. Load that layout's coordinates from memory
3. Visually verify the current screen against the memory
4. Execute the workflow with high confidence

"The Screen is the Hard Drive, and now it has a journal." 🦾📰

Usage:
    python semantic_driven_automation.py --action create_title --query "Text Clip"
"""

import sys
import time
import json
import argparse
from pathlib import Path
from typing import Optional, Dict, Any, List
from dataclasses import dataclass

# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "wordpress_zone"))

from extraction_pipeline import ExtractionPipeline, ExtractionResult
from layout_inferencer import LayoutResult
from memory_ghost import MemoryGhost, GhostRegistry

try:
    from layout_memory import LayoutMemorySearch, LayoutMemory
    MEMORY_SEARCH_AVAILABLE = True
except ImportError:
    MEMORY_SEARCH_AVAILABLE = False
    LayoutMemory = None  # type: ignore


@dataclass
class SemanticMatch:
    """A matched layout from semantic memory."""
    memory: Any  # LayoutMemory when available
    similarity: float
    confidence: str  # HIGH, MEDIUM, LOW
    matched_elements: List[str]


class SemanticDrivenAutomation:
    """
    Automation driven by semantic memory from WordPress District.

    This is the Ouroboros loop:
        Memory (WordPress) → Verification (Visual) → Action (Automation) → Memory (Update)
    """

    CONFIDENCE_THRESHOLDS = {
        "HIGH": 0.85,
        "MEDIUM": 0.65,
        "LOW": 0.0
    }

    def __init__(self, wordpress_enabled: bool = True):
        """
        Initialize the semantic automation engine.

        Args:
            wordpress_enabled: Enable WordPress memory queries
        """
        self.pipeline = ExtractionPipeline(wordpress_enabled=wordpress_enabled)
        self.memory_search = LayoutMemorySearch() if MEMORY_SEARCH_AVAILABLE else None
        self.verification_history: List[Dict] = []
        self.ghost_registry = GhostRegistry()

    def query_memory_for_action(self, action_keyword: str, limit: int = 5) -> List[Any]:
        """
        Query WordPress for layouts related to a specific action.

        Args:
            action_keyword: Keyword to search (e.g., "Text Clip", "Timeline")
            limit: Maximum results

        Returns:
            List of matching LayoutMemory objects
        """
        if not self.memory_search:
            print("⚠️ Memory search not available")
            return []

        print(f"🔍 Querying memory for: '{action_keyword}'")
        results = self.memory_search.query_by_keyword(action_keyword, limit)

        print(f"📖 Found {len(results)} memories")
        for i, mem in enumerate(results):
            print(f"  [{i+1}] {mem.title} (Panels: {mem.panel_count}, Buttons: {mem.button_count})")

        return results

    def verify_current_screen(
        self,
        screenshot_path: str,
        memory: LayoutMemory,
        tolerance: int = 2
    ) -> SemanticMatch:
        """
        Verify current screen against a memory.

        Args:
            screenshot_path: Path to current screenshot
            memory: LayoutMemory to compare against
            tolerance: Allowed difference in structure counts

        Returns:
            SemanticMatch with confidence level
        """
        print(f"\n🔍 Verifying screen against memory: {memory.title}")

        # Extract current layout
        result = self.pipeline.extract(screenshot_path)
        current_layout = result.layout

        if not current_layout:
            return SemanticMatch(
                memory=memory,
                similarity=0.0,
                confidence="LOW",
                matched_elements=[]
            )

        # Calculate structure similarity
        panel_diff = abs(current_layout.panels - memory.panel_count) if current_layout else abs(0 - memory.panel_count)
        button_diff = abs(len(current_layout.buttons) - memory.button_count) if current_layout else abs(0 - memory.button_count)

        # Match confidence
        panel_match = panel_diff <= tolerance
        button_match = button_diff <= tolerance

        similarity = memory.similarity_score(
            len(current_layout.panels) if current_layout else 0,
            len(current_layout.buttons) if current_layout else 0
        )

        # Determine confidence
        if panel_match and button_match and similarity >= self.CONFIDENCE_THRESHOLDS["HIGH"]:
            confidence = "HIGH"
        elif (panel_match or button_match) and similarity >= self.CONFIDENCE_THRESHOLDS["MEDIUM"]:
            confidence = "MEDIUM"
        else:
            confidence = "LOW"

        # Find matched elements
        matched_elements = []
        if panel_match:
            matched_elements.append("panels")
        if button_match:
            matched_elements.append("buttons")

        print(f"  📊 Current: {len(current_layout.panels) if current_layout else 0} panels, {len(current_layout.buttons) if current_layout else 0} buttons")
        print(f"  📖 Memory:  {memory.panel_count} panels, {memory.button_count} buttons")
        print(f"  ✅ Confidence: {confidence} (similarity: {similarity:.2f})")

        # Record verification
        self.verification_history.append({
            "timestamp": time.time(),
            "memory_title": memory.title,
            "similarity": similarity,
            "confidence": confidence,
            "matched_elements": matched_elements
        })

        return SemanticMatch(
            memory=memory,
            similarity=similarity,
            confidence=confidence,
            matched_elements=matched_elements
        )

    def find_best_memory_match(
        self,
        screenshot_path: str,
        action_keyword: str
    ) -> Optional[Any]:  # SemanticMatch or None
        """
        Find the best matching memory for the current screen.

        Args:
            screenshot_path: Path to current screenshot
            action_keyword: Action to search for

        Returns:
            Best SemanticMatch or None
        """
        # Query memories
        memories = self.query_memory_for_action(action_keyword)

        if not memories:
            return None

        # Verify against each memory
        best_match = None
        best_similarity = 0.0

        for memory in memories:
            match = self.verify_current_screen(screenshot_path, memory)

            if match.similarity > best_similarity:
                best_similarity = match.similarity
                best_match = match

        return best_match

    def execute_with_memory(
        self,
        screenshot_path: str,
        action_keyword: str,
        action_handler: callable = None
    ) -> Dict[str, Any]:
        """
        Execute an action using semantic memory guidance.

        This is the core Ouroboros loop:
        1. Query memory for similar layouts
        2. Verify current screen against memories
        3. Execute action with confidence-based approach
        4. Publish result to memory

        Args:
            screenshot_path: Path to current screenshot
            action_keyword: Action to perform
            action_handler: Optional custom action handler

        Returns:
            Dict with execution results
        """
        print(f"\n{'='*60}")
        print(f"🦾 SEMANTIC-DRIVEN AUTOMATION: {action_keyword}")
        print(f"{'='*60}")

        # Step 1: Find best memory match
        print("\n📚 Step 1: Querying Semantic Memory...")
        match = self.find_best_memory_match(screenshot_path, action_keyword)

        # Step 2: Extract current layout
        print("\n🔍 Step 2: Analyzing Current Screen...")
        result = self.pipeline.extract(screenshot_path)

        # Step 3: Determine action confidence
        print("\n🎯 Step 3: Determining Action Confidence...")
        if match and match.confidence == "HIGH":
            print("  ✅ HIGH confidence - proceeding with known layout")
            action_confidence = "EXECUTE"
        elif match and match.confidence == "MEDIUM":
            print("  ⚠️ MEDIUM confidence - proceeding with caution")
            action_confidence = "CAUTIOUS"
        elif match:
            print("  ❓ LOW confidence - verifying manually")
            action_confidence = "VERIFY"
        else:
            print("  🆕 No memory match - learning new layout")
            action_confidence = "LEARN"

        # Step 4: Execute action
        print(f"\n🎬 Step 4: Executing Action ({action_confidence})...")

        # Create ghost from current layout
        ghost_id = None
        if result.layout:
            ghost = MemoryGhost.from_layout_result(result.layout, action_keyword)
            ghost.similarity = match.similarity if match else 0.0
            ghost.confidence = action_confidence.replace("EXECUTE", "HIGH").replace("CAUTIOUS", "MEDIUM").replace("VERIFY", "LOW").replace("LEARN", "LOW")
            self.ghost_registry.add_ghost(ghost)
            ghost_id = ghost.ghost_id

        execution_result = {
            "action": action_keyword,
            "confidence": action_confidence,
            "memory_match": match.memory.title if match else None,
            "similarity": match.similarity if match else 0.0,
            "current_layout": result.layout.to_dict() if result.layout else None,
            "widgets": [
                {"type": w.type.value, "text": w.text, "bbox": w.bbox}
                for w in result.widgets
            ],
            "ghost_id": ghost_id,
            "ghosts": self.ghost_registry.to_broadcast(),
            "timestamp": time.time()
        }

        # Execute custom handler if provided
        if action_handler:
            try:
                action_result = action_handler(result, match)
                execution_result["action_result"] = action_result
            except Exception as e:
                execution_result["action_error"] = str(e)

        # Step 5: Publish to memory (if significant)
        print("\n📖 Step 5: Updating Semantic Memory...")
        if self.pipeline.wordpress_publisher and result.layout:
            wp_result = self.pipeline.wordpress_publisher.publish_layout_analysis(
                layout=result.layout,
                image_path=screenshot_path,
                ascii_view=result.ascii_view,
                metadata=execution_result
            )
            if wp_result:
                execution_result["published_to_wordpress"] = wp_result.get("url")

        print(f"\n✅ Automation Complete!")
        print(f"   Memory: {execution_result.get('memory_match', 'None')}")
        print(f"   Confidence: {execution_result['confidence']}")

        return execution_result

    def get_verification_summary(self) -> Dict[str, Any]:
        """Get summary of all verifications performed."""
        if not self.verification_history:
            return {"total_verifications": 0}

        high_confidence = sum(1 for v in self.verification_history if v["confidence"] == "HIGH")
        medium_confidence = sum(1 for v in self.verification_history if v["confidence"] == "MEDIUM")
        low_confidence = sum(1 for v in self.verification_history if v["confidence"] == "LOW")

        avg_similarity = sum(v["similarity"] for v in self.verification_history) / len(self.verification_history)

        return {
            "total_verifications": len(self.verification_history),
            "high_confidence": high_confidence,
            "medium_confidence": medium_confidence,
            "low_confidence": low_confidence,
            "average_similarity": avg_similarity
        }


def demo_create_title_handler(result: ExtractionResult, match: SemanticMatch) -> Dict:
    """
    Demo action handler for creating a title clip.

    This would be replaced with actual automation logic.
    """
    print("  🎬 Simulating title creation...")

    # Find text input widget
    text_inputs = [w for w in result.widgets if "text" in w.type.value.lower() or "input" in w.type.value.lower()]

    if text_inputs:
        target = text_inputs[0]
        print(f"  📍 Found text input at {target.bbox}")
        return {
            "action": "click_and_type",
            "target_bbox": target.bbox,
            "text": "My Title",
            "status": "simulated"
        }

    return {"action": "no_target", "status": "simulated"}


def main():
    parser = argparse.ArgumentParser(description="Semantic-Driven Automation")
    parser.add_argument("--screenshot", type=str, help="Path to screenshot")
    parser.add_argument("--action", default="create_title", help="Action to perform")
    parser.add_argument("--query", default="Text Clip", help="Memory query keyword")
    parser.add_argument("--demo", action="store_true", help="Run demo with sample data")
    parser.add_argument("--no-wordpress", action="store_true", help="Disable WordPress publishing")

    args = parser.parse_args()

    # Initialize automation engine
    automation = SemanticDrivenAutomation(wordpress_enabled=not args.no_wordpress)

    if args.demo:
        print("🦾 Running Ouroboros Demonstration...")
        print("This demo shows the full Semantic-Driven Automation loop.")
        print()

        # Simulate memory query
        print("📚 Step 1: Querying Semantic Memory for 'Text Clip'")
        print("  (In demo mode, this would query WordPress)")
        print()

        # Show confidence levels
        print("🎯 Step 2: Confidence-Based Actions")
        print("  HIGH confidence (>0.85): Execute immediately")
        print("  MEDIUM confidence (0.65-0.85): Proceed with caution")
        print("  LOW confidence (<0.65): Verify manually")
        print()

        # Show the loop
        print("🔄 Step 3: The Ouroboros Loop")
        print("  Memory (WordPress) → Verification (Visual) → Action → Memory (Update)")
        print()

        print("✅ Demo complete!")
        print()
        print("To run with real data:")
        print(f"  python {Path(__file__).name} --screenshot screenshot.png --action create_title --query 'Text Clip'")
        return

    if not args.screenshot:
        print("❌ Error: --screenshot required (or use --demo)")
        parser.print_help()
        return

    if not Path(args.screenshot).exists():
        print(f"❌ Error: Screenshot not found: {args.screenshot}")
        return

    # Run semantic-driven automation
    result = automation.execute_with_memory(
        screenshot_path=args.screenshot,
        action_keyword=args.query,
        action_handler=demo_create_title_handler if args.action == "create_title" else None
    )

    # Print result
    print(f"\n📊 Result:")
    print(json.dumps(result, indent=2, default=str))


if __name__ == "__main__":
    main()
