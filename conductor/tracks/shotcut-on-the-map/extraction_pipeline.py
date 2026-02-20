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
from dataclasses import dataclass, field
from typing import List, Optional, Dict, Any
from pathlib import Path

from gui_structure_analyzer import GUIAnalyzer, UIElement
from semantic_clusterer import UICluster
from widget_detector import WidgetDetector, Widget
from layout_inferencer import LayoutInferencer, LayoutResult

# WordPress Semantic District Integration
try:
    from wordpress_zone.publish_to_wp import publish_to_wordpress
    WORDPRESS_AVAILABLE = True
except ImportError:
    WORDPRESS_AVAILABLE = False


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
        layout: OpenCV layout inference results (panels, buttons, lines)
        metadata: Additional metadata (timing, stats, etc.)
    """
    elements: List[UIElement] = field(default_factory=list)
    clusters: List[UICluster] = field(default_factory=list)
    widgets: List[Widget] = field(default_factory=list)
    ascii_view: str = ""
    diagnostic: Optional[DiagnosticPulse] = None
    layout: Optional[LayoutResult] = None
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
        if self.layout:
            res["layout"] = self.layout.to_dict()
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

    def __init__(self, ascii_width: int = 80, ascii_height: int = 24, wordpress_enabled: bool = False):
        """
        Initialize the ExtractionPipeline.

        Args:
            ascii_width: Width of ASCII view in characters (default: 80)
            ascii_height: Height of ASCII view in characters (default: 24)
            wordpress_enabled: Enable WordPress Semantic District publishing (default: False)
        """
        self.analyzer = GUIAnalyzer()
        self.widget_detector = WidgetDetector()
        self.safety_scanner = SafetyScanner()
        self.layout_inferencer = LayoutInferencer()
        self.wordpress_publisher = WordPressPublisher() if wordpress_enabled else None
        self.ascii_width = ascii_width
        self.ascii_height = ascii_height
        self.wordpress_enabled = wordpress_enabled

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

        # Step 4: Layout inference (OpenCV)
        layout = self.layout_inferencer.analyze(image_path)

        # Step 5: Build ASCII view with [CLICKABLE] metadata
        ascii_view = self._build_enhanced_ascii_view(
            analysis.elements,
            widgets,
            analysis.ascii_view,
            layout
        )

        # Build result
        elapsed = time.time() - start_time
        metadata = {
            "source_image": image_path,
            "extraction_time_seconds": elapsed,
            "element_count": len(analysis.elements),
            "cluster_count": len(analysis.clusters),
            "widget_count": len(widgets),
            "clickable_count": len([w for w in widgets if w.action]),
            "panel_count": len(layout.panels),
            "button_region_count": len(layout.buttons),
            "line_count": len(layout.lines)
        }

        return ExtractionResult(
            elements=analysis.elements,
            clusters=analysis.clusters,
            widgets=widgets,
            ascii_view=ascii_view,
            diagnostic=diagnostic,
            layout=layout,
            metadata=metadata
        )

    def _maybe_document_layout(
        self,
        result: ExtractionResult,
        image_path: str
    ) -> Optional[Dict]:
        """
        Publish significant layout discoveries to WordPress Semantic District.

        Args:
            result: ExtractionResult from extract()
            image_path: Source screenshot path

        Returns:
            WordPress response dict or None
        """
        if not self.wordpress_publisher or not result.layout:
            return None

        return self.wordpress_publisher.publish_layout_analysis(
            layout=result.layout,
            image_path=image_path,
            ascii_view=result.ascii_view,
            metadata=result.metadata
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
        base_view: str,
        layout: Any = None
    ) -> str:
        """
        Build ASCII view with [CLICKABLE] metadata and layout info.

        Args:
            elements: List of UI elements
            widgets: List of detected widgets
            base_view: Base ASCII view from the analyzer
            layout: Optional layout result from OpenCV

        Returns:
            Enhanced ASCII view
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

        if layout:
            lines.append("")
            lines.append("=== LAYOUT INFERENCE (OpenCV) ===")
            lines.append(f"Detected Panels: {len(layout.panels)}")
            lines.append(f"Detected Button Regions: {len(layout.buttons)}")
            lines.append(f"Detected Visual Edges: {len(layout.lines)}")
            
            for i, panel in enumerate(layout.panels[:3]):
                lines.append(f"  Panel #{i+1}: {panel}")

        return "\n".join(lines)

    def extract_to_file(self, image_path: str, output_path: str, publish: bool = False) -> ExtractionResult:
        """
        Extract and save result to file.

        Args:
            image_path: Path to screenshot
            output_path: Path for output JSON file
            publish: Also publish to WordPress if enabled (default: False)

        Returns:
            ExtractionResult
        """
        result = self.extract(image_path)

        output_file = Path(output_path)
        output_file.parent.mkdir(parents=True, exist_ok=True)

        with open(output_file, 'w') as f:
            f.write(result.to_json())

        # Optionally publish to WordPress
        if publish:
            self._maybe_document_layout(result, image_path)

        return result


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


class WordPressPublisher:
    """
    Publishes significant layout analysis results to WordPress Semantic District.

    Follows the SEMANTIC PUBLISHING PROTOCOL:
    - Rate limited to 1 post per 30 seconds
    - Uses semantic HTML formatting
    - Sends telemetry pulses for visual sync
    """

    MIN_PANELS = 3  # Minimum panels to trigger documentation
    MIN_BUTTONS = 5  # Minimum buttons to trigger documentation
    RATE_LIMIT_SECONDS = 30

    def __init__(self):
        self.last_publish_time = 0
        self.enabled = WORDPRESS_AVAILABLE

    def should_publish(self, layout: LayoutResult) -> bool:
        """Check if layout is significant enough to document."""
        if not self.enabled:
            return False

        # Check rate limit
        if time.time() - self.last_publish_time < self.RATE_LIMIT_SECONDS:
            return False

        # Check significance thresholds
        has_significant_structure = (
            len(layout.panels) >= self.MIN_PANELS or
            len(layout.buttons) >= self.MIN_BUTTONS
        )

        return has_significant_structure

    def publish_layout_analysis(
        self,
        layout: LayoutResult,
        image_path: str,
        ascii_view: str = "",
        metadata: Dict[str, Any] = None
    ) -> Optional[Dict]:
        """
        Publish layout analysis to WordPress as a journal post.

        Args:
            layout: LayoutResult from LayoutInferencer
            image_path: Source screenshot path
            ascii_view: ASCII representation of the UI
            metadata: Additional metadata dict

        Returns:
            WordPress response dict or None if not published
        """
        if not self.should_publish(layout):
            return None

        source_name = Path(image_path).stem
        title = f"UI Structure Analysis: {source_name}"

        # Build semantic HTML content
        content = f"""<h3>Layout Analysis Report</h3>
<p><b>Source:</b> <code>{image_path}</code></p>
<p><b>Timestamp:</b> {time.strftime('%Y-%m-%d %H:%M:%S')}</p>

<h4>Structure Summary</h4>
<table>
<tr><td><b>Panels</b></td><td>{len(layout.panels)}</td></tr>
<tr><td><b>Button Regions</b></td><td>{len(layout.buttons)}</td></tr>
<tr><td><b>Visual Edges</b></td><td>{len(layout.lines)}</td></tr>
</table>

<h4>Panel Details</h4>
<ul>
"""

        for i, panel in enumerate(layout.panels[:5]):
            bbox = panel.get('bbox', [0, 0, 0, 0])
            w = panel.get('width', 0)
            h = panel.get('height', 0)
            content += f"<li>Panel #{i+1}: {w}x{h} at ({bbox[0]}, {bbox[1]})</li>\n"

        content += "</ul>\n"

        # Add ASCII preview if available
        if ascii_view:
            ascii_preview = ascii_view[:500].replace('\n', '<br/>\n')
            content += f"""<h4>ASCII Preview</h4>
<pre>{ascii_preview}</pre>
"""

        # Add metadata
        if metadata:
            content += f"""<h4>Metadata</h4>
<p>Extraction time: {metadata.get('extraction_time_seconds', 0):.2f}s</p>
<p>Elements: {metadata.get('element_count', 0)} | Clusters: {metadata.get('cluster_count', 0)}</p>
"""

        try:
            result = publish_to_wordpress(title, content, post_type='post')
            if result:
                self.last_publish_time = time.time()
                print(f"📖 Published to WordPress: {result.get('url')}")
            return result
        except Exception as e:
            print(f"⚠️ WordPress publish failed: {e}")
            return None

    def publish_diagnostic_alert(
        self,
        diagnostic: DiagnosticPulse,
        source: str = "Visual HUD"
    ) -> Optional[Dict]:
        """
        Publish a diagnostic alert to WordPress.

        Args:
            diagnostic: DiagnosticPulse from SafetyScanner
            source: Source identifier

        Returns:
            WordPress response dict or None
        """
        if not self.enabled:
            return None

        if diagnostic.severity == "SUCCESS":
            return None  # Don't publish success states

        title = f"⚠️ Diagnostic Alert: {diagnostic.severity}"

        content = f"""<h3>System Alert</h3>
<p><b>Severity:</b> <span style="color: {'red' if diagnostic.severity == 'CRITICAL' else 'orange'}">{diagnostic.severity}</span></p>
<p><b>Source:</b> {source}</p>
<p><b>Message:</b> {diagnostic.message}</p>
<p><b>Tokens:</b> {', '.join(diagnostic.tokens)}</p>
<p><b>Timestamp:</b> {time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(diagnostic.timestamp))}</p>
"""

        try:
            result = publish_to_wordpress(title, content, post_type='post')
            return result
        except Exception as e:
            print(f"⚠️ WordPress alert failed: {e}")
            return None


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
