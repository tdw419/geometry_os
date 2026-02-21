"""
Layout Encoder with WordPress Auto-Documentation

Extends the base LayoutEncoder to automatically publish documentation
to the WordPress Semantic District when encoding layouts.

PixelRTS v3 + WordPress Integration:
    Layout → .rts.png Cartridge → WordPress Documentation Page
"""

import time
from pathlib import Path
from typing import Optional, Dict, Any

from layout_encoder import LayoutEncoder, LAYOUT_OPCODES
from layout_inferencer import LayoutResult

# WordPress Semantic District Integration
try:
    from wordpress_zone.publish_to_wp import publish_to_wordpress
    WORDPRESS_AVAILABLE = True
except ImportError:
    WORDPRESS_AVAILABLE = False


class LayoutEncoderWithDocs(LayoutEncoder):
    """
    LayoutEncoder that auto-documents to WordPress Semantic District.

    Usage:
        encoder = LayoutEncoderWithDocs()
        encoder.encode_and_document(layout, "output.rts.png", source_image="screenshot.png")
    """

    MIN_INSTRUCTIONS_FOR_DOCS = 3  # Minimum instructions to trigger documentation
    RATE_LIMIT_SECONDS = 30

    def __init__(self, auto_document: bool = True):
        """
        Initialize the encoder.

        Args:
            auto_document: Automatically publish to WordPress (default: True)
        """
        super().__init__()
        self.auto_document = auto_document and WORDPRESS_AVAILABLE
        self.last_publish_time = 0

    def encode_and_document(
        self,
        layout: LayoutResult,
        output_path: str,
        source_image: Optional[str] = None,
        metadata: Optional[Dict[str, Any]] = None
    ) -> tuple:
        """
        Encode layout and publish documentation to WordPress.

        Args:
            layout: LayoutResult from LayoutInferencer
            output_path: Path to save .rts.png file
            source_image: Optional source screenshot path
            metadata: Optional additional metadata

        Returns:
            Tuple of (PIL Image, WordPress response or None)
        """
        # Encode the layout
        img = self.encode(layout)
        self.encode_to_file(layout, output_path)

        wp_result = None

        # Document to WordPress if enabled and significant
        if self.auto_document and self._should_document(layout):
            wp_result = self._publish_documentation(
                layout=layout,
                output_path=output_path,
                source_image=source_image,
                metadata=metadata
            )

        return img, wp_result

    def _should_document(self, layout: LayoutResult) -> bool:
        """Check if layout is significant enough to document."""
        # Check rate limit
        if time.time() - self.last_publish_time < self.RATE_LIMIT_SECONDS:
            return False

        # Count total instructions
        instruction_count = (
            len(layout.panels) +
            len(layout.buttons) +
            len(layout.lines)
        )

        return instruction_count >= self.MIN_INSTRUCTIONS_FOR_DOCS

    def _publish_documentation(
        self,
        layout: LayoutResult,
        output_path: str,
        source_image: Optional[str],
        metadata: Optional[Dict[str, Any]]
    ) -> Optional[Dict]:
        """Publish layout documentation as a WordPress page."""
        cartridge_name = Path(output_path).stem
        title = f"Layout Cartridge: {cartridge_name}"

        # Count instructions
        panel_count = len(layout.panels)
        button_count = len(layout.buttons)
        line_count = len(layout.lines)
        total_instructions = panel_count + button_count + line_count + 1  # +1 for HALT

        content = f"""<h3>PixelRTS v3 Layout Cartridge</h3>
<p><b>File:</b> <code>{output_path}</code></p>
<p><b>Generated:</b> {time.strftime('%Y-%m-%d %H:%M:%S')}</p>

<h4>Instruction Summary</h4>
<table>
<tr><th>Opcode</th><th>Mnemonic</th><th>Count</th></tr>
<tr><td><code>0x10</code></td><td>LDP (Load Panel)</td><td>{panel_count}</td></tr>
<tr><td><code>0x11</code></td><td>LDB (Load Button)</td><td>{button_count}</td></tr>
<tr><td><code>0x12</code></td><td>LDL (Load Line)</td><td>{line_count}</td></tr>
<tr><td><code>0x07</code></td><td>HALT</td><td>1</td></tr>
<tr><td colspan="2"><b>Total</b></td><td><b>{total_instructions}</b></td></tr>
</table>

<h4>Panel Coordinates</h4>
<ul>
"""
        for i, panel in enumerate(layout.panels[:10]):
            bbox = panel.get('bbox', [0, 0, 0, 0])
            content += f"<li>LDP #{i}: x={bbox[0]}, y={bbox[1]}, size={panel.get('width', 0)}x{panel.get('height', 0)}</li>\n"

        content += "</ul>\n"

        content += """<h4>Button Coordinates</h4>
<ul>
"""
        for i, button in enumerate(layout.buttons[:10]):
            bbox = button.get('bbox', [0, 0, 0, 0])
            content += f"<li>LDB #{i}: x={bbox[0]}, y={bbox[1]}, size={button.get('width', 0)}x{button.get('height', 0)}</li>\n"

        content += "</ul>\n"

        content += """<h4>Line Coordinates</h4>
<ul>
"""
        for i, line in enumerate(layout.lines[:10]):
            (x1, y1), (x2, y2) = line
            orientation = "Horizontal" if abs(y1 - y2) < 10 else "Vertical"
            content += f"<li>LDL #{i}: {orientation} from ({x1}, {y1}) to ({x2}, {y2})</li>\n"

        content += "</ul>\n"

        if source_image:
            content += f"""<h4>Source</h4>
<p><b>Original Screenshot:</b> <code>{source_image}</code></p>
"""

        if metadata:
            content += f"""<h4>Metadata</h4>
<pre>{metadata}</pre>
"""

        content += """<h4>Usage</h4>
<pre>
from layout_inferencer import LayoutInferencer
from layout_encoder import LayoutEncoder

# Decode and use this cartridge
encoder = LayoutEncoder()
# This cartridge can be executed by GeometricVM
</pre>
"""

        try:
            result = publish_to_wordpress(title, content, post_type='page')
            if result:
                self.last_publish_time = time.time()
                print(f"📖 Published cartridge docs: {result.get('url')}")
            return result
        except Exception as e:
            print(f"⚠️ WordPress cartridge docs failed: {e}")
            return None


def encode_layout_with_docs(
    layout: LayoutResult,
    output_path: str,
    source_image: Optional[str] = None,
    auto_document: bool = True
) -> tuple:
    """
    Convenience function to encode and document a layout.

    Args:
        layout: LayoutResult from LayoutInferencer
        output_path: Path to save .rts.png file
        source_image: Optional source screenshot path
        auto_document: Enable WordPress documentation

    Returns:
        Tuple of (PIL Image, WordPress response or None)
    """
    encoder = LayoutEncoderWithDocs(auto_document=auto_document)
    return encoder.encode_and_document(layout, output_path, source_image)
