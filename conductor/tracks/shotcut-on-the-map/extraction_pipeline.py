#!/usr/bin/env python3
"""
Extraction Pipeline Module

Unified API for the full Visual Extraction Pipeline that chains together:
    Screenshot -> OCR -> Clustering -> Widget Detection -> Scene Graph

Usage:
    from extraction_pipeline import ExtractionPipeline, extract_gui

    # Full pipeline
    pipeline = ExtractionPipeline()
    result = pipeline.extract("screenshot.png")
    print(result.ascii_view)

    # Convenience function
    result = extract_gui("screenshot.png", output_path="result.json")
"""

import json
import time
import os
import base64
import tempfile
import io
from dataclasses import dataclass, field
from typing import List, Optional, Dict, Any
from pathlib import Path
from PIL import Image

from gui_structure_analyzer import GUIAnalyzer, AnalysisResult, UIElement
from semantic_clusterer import UICluster, OCRElement
from widget_detector import WidgetDetector, Widget, WidgetType


@dataclass
class DiagnosticPulse:
    """V16: Safety anomaly detected by the Perception Bridge."""
    severity: str  # SUCCESS, WARNING, CRITICAL
    message: str
    tokens: List[str]
    timestamp: float = field(default_factory=time.time)


@dataclass
class ExtractionResult:
    """
    Complete result of the extraction pipeline.

    Attributes:
        elements: Raw UI elements from OCR
        clusters: Semantic clusters of related elements
        widgets: Detected widgets with actions
        ascii_view: ASCII scene graph representation
        diagnostic: V16 Diagnostic pulse results
        metadata: Additional metadata (timing, stats, etc.)
    """
    elements: List[UIElement] = field(default_factory=list)
    clusters: List[UICluster] = field(default_factory=list)
    widgets: List[Widget] = field(default_factory=list)
    ascii_view: str = ""
    diagnostic: Optional[DiagnosticPulse] = None
    metadata: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for JSON serialization."""
        res = {
            "elements": [
                {"text": e.text, "bbox": list(e.bbox), "confidence": e.confidence}
                for e in self.elements
            ],
            "clusters": [
                {"label": c.label, "bounds": c.bounds, "element_count": len(c.elements)}
                for c in self.clusters
            ],
            "widgets": [
                {"type": w.type.value, "text": w.text, "bbox": w.bbox, "action": w.action}
                for w in self.widgets
            ],
            "ascii_view": self.ascii_view,
            "metadata": self.metadata
        }
        if self.diagnostic:
            res["diagnostic"] = {
                "severity": self.diagnostic.severity,
                "message": self.diagnostic.message,
                "tokens": self.diagnostic.tokens,
                "timestamp": self.diagnostic.timestamp
            }
        return res

    def to_json(self) -> str:
        """Convert to JSON string."""
        return json.dumps(self.to_dict(), indent=2)

    def get_clickable_regions(self) -> List[Dict[str, Any]]:
        """
        Extract all clickable regions with actions.

        Returns:
            List of dicts with bbox, action, and text for clickable widgets
        """
        return [
            {"bbox": w.bbox, "action": w.action, "text": w.text}
            for w in self.widgets
            if w.action
        ]


class ExtractionPipeline:
    """
    Unified API for the full Visual Extraction Pipeline.

    Flow:
        screenshot -> OCR -> clustering -> widget detection -> scene graph

    Usage:
        pipeline = ExtractionPipeline()
        result = pipeline.extract("screenshot.png")
        print(result.ascii_view)
    """

    def __init__(self, ascii_width: int = 80, ascii_height: int = 24):
        """
        Initialize the ExtractionPipeline.

        Args:
            ascii_width: Width of ASCII view in characters (default: 80)
            ascii_height: Height of ASCII view in characters (default: 24)
        """
        self.analyzer = GUIAnalyzer()
        self.widget_detector = WidgetDetector()
        self.safety_scanner = SafetyScanner()
        self.ascii_width = ascii_width
        self.ascii_height = ascii_height

    def extract(self, image_path: str) -> ExtractionResult:
        """
        Run the full extraction pipeline on a screenshot.

        Args:
            image_path: Path to the screenshot image

        Returns:
            ExtractionResult with all extracted data including:
            - Raw UI elements from OCR
            - Semantic clusters
            - Detected widgets with actions
            - ASCII view with [CLICKABLE] metadata
            - V16 Diagnostic pulse
        """
        start_time = time.time()

        # Step 1: OCR analysis with clustering
        analysis = self.analyzer.analyze_with_clustering(
            image_path,
            self.ascii_width,
            self.ascii_height
        )

        # Step 2: Widget detection
        elements_for_detection = [
            {"text": e.text, "bbox": list(e.bbox), "conf": e.confidence}
            for e in analysis.elements
        ]
        widgets = self.widget_detector.detect(elements_for_detection)

        # Step 3: Safety scanning (Diagnostic Pulse)
        full_text = " ".join([e.text for e in analysis.elements])
        diagnostic = self.safety_scanner.scan(full_text)

        # Step 4: Build ASCII view with [CLICKABLE] metadata
        ascii_view = self._build_enhanced_ascii_view(
            analysis.elements,
            widgets,
            analysis.ascii_view
        )

        # Build result
        elapsed = time.time() - start_time
        metadata = {
            "source_image": image_path,
            "extraction_time_seconds": elapsed,
            "element_count": len(analysis.elements),
            "cluster_count": len(analysis.clusters),
            "widget_count": len(widgets),
            "clickable_count": len([w for w in widgets if w.action])
        }

        return ExtractionResult(
            elements=analysis.elements,
            clusters=analysis.clusters,
            widgets=widgets,
            ascii_view=ascii_view,
            diagnostic=diagnostic,
            metadata=metadata
        )

    def extract_from_bytes(self, image_bytes: bytes) -> ExtractionResult:
        """Extract from raw image bytes."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            f.write(image_bytes)
            temp_path = f.name

        try:
            return self.extract(temp_path)
        finally:
            if os.path.exists(temp_path):
                os.unlink(temp_path)

    def extract_from_base64(self, b64_data: str) -> ExtractionResult:
        """Extract from base64-encoded image data."""
        image_data = base64.b64decode(b64_data)
        return self.extract_from_bytes(image_data)

    def _build_enhanced_ascii_view(
        self,
        elements: List[UIElement],
        widgets: List[Widget],
        base_view: str
    ) -> str:
        """
        Build ASCII view with [CLICKABLE] metadata annotations.

        Args:
            elements: List of UI elements
            widgets: List of detected widgets
            base_view: Base ASCII view from the analyzer

        Returns:
            Enhanced ASCII view with widget metadata section
        """
        lines = [base_view]
        lines.append("")
        lines.append("=== WIDGET METADATA ===")

        for widget in widgets:
            if widget.action:
                lines.append(
                    f"[CLICKABLE] {widget.type.value.upper()}: "
                    f"'{widget.text}' at {widget.bbox} -> {widget.action}"
                )
            else:
                lines.append(
                    f"[{widget.type.value.upper()}] '{widget.text}' at {widget.bbox}"
                )

        return "\n".join(lines)


class SafetyScanner:
    """V16: Scans extracted text for safety anomalies (Panics, Errors, etc.)"""
    
    CRITICAL_TOKENS = ["PANIC", "BUG", "FAULT", "ABORT", "CRASH", "HALT"]
    WARNING_TOKENS = ["ERROR", "FAIL", "WARN", "TIMEOUT", "RETRY"]

    def scan(self, text: str) -> DiagnosticPulse:
        upper_text = text.upper()
        
        found_critical = [t for t in self.CRITICAL_TOKENS if t in upper_text]
        if found_critical:
            return DiagnosticPulse(
                severity="CRITICAL",
                message=f"System Instability Detected: {found_critical[0]}",
                tokens=found_critical
            )
            
        found_warning = [t for t in self.WARNING_TOKENS if t in upper_text]
        if found_warning:
            return DiagnosticPulse(
                severity="WARNING",
                message=f"System Warning: {found_warning[0]}",
                tokens=found_warning
            )
            
        return DiagnosticPulse(
            severity="SUCCESS",
            message="Substrate logic operating within nominal parameters",
            tokens=[]
        )

    def _build_enhanced_ascii_view(
        self,
        elements: List[UIElement],
        widgets: List[Widget],
        base_view: str
    ) -> str:
        """
        Build ASCII view with [CLICKABLE] metadata annotations.

        Args:
            elements: List of UI elements
            widgets: List of detected widgets
            base_view: Base ASCII view from the analyzer

        Returns:
            Enhanced ASCII view with widget metadata section
        """
        lines = [base_view]
        lines.append("")
        lines.append("=== WIDGET METADATA ===")

        for widget in widgets:
            if widget.action:
                lines.append(
                    f"[CLICKABLE] {widget.type.value.upper()}: "
                    f"'{widget.text}' at {widget.bbox} -> {widget.action}"
                )
            else:
                lines.append(
                    f"[{widget.type.value.upper()}] '{widget.text}' at {widget.bbox}"
                )

        return "\n".join(lines)

    def extract_to_file(self, image_path: str, output_path: str) -> ExtractionResult:
        """
        Extract and save result to file.

        Args:
            image_path: Path to screenshot
            output_path: Path for output JSON file

        Returns:
            ExtractionResult
        """
        result = self.extract(image_path)

        output_file = Path(output_path)
        output_file.parent.mkdir(parents=True, exist_ok=True)

        with open(output_file, 'w') as f:
            f.write(result.to_json())

        return result


def extract_gui(image_path: str, output_path: Optional[str] = None) -> ExtractionResult:
    """
    Convenience function for quick extraction.

    Args:
        image_path: Path to screenshot
        output_path: Optional path to save JSON output

    Returns:
        ExtractionResult with all extracted data
    """
    pipeline = ExtractionPipeline()

    if output_path:
        return pipeline.extract_to_file(image_path, output_path)
    return pipeline.extract(image_path)


# CLI interface for testing
if __name__ == "__main__":
    import sys
    import argparse

    parser = argparse.ArgumentParser(description="Visual Extraction Pipeline")
    parser.add_argument("image_path", help="Path to screenshot")
    parser.add_argument("--output", "-o", help="Output path for JSON result")
    parser.add_argument("--width", type=int, default=80, help="ASCII width")
    parser.add_argument("--height", type=int, default=24, help="ASCII height")

    args = parser.parse_args()

    pipeline = ExtractionPipeline(
        ascii_width=args.width,
        ascii_height=args.height
    )

    if args.output:
        result = pipeline.extract_to_file(args.image_path, args.output)
        print(f"Result saved to {args.output}")
    else:
        result = pipeline.extract(args.image_path)
        print(result.ascii_view)
        print(f"\nMetadata: {result.metadata}")
