#!/usr/bin/env python3
"""
GUI Structure Analyzer

Extracts GUI structure from screenshots using Tesseract OCR and generates
ASCII Scene Graph representations. Integrates with SemanticClusterer to
group UI elements into semantic clusters.

Usage:
    python3 gui_structure_analyzer.py <image_path> [--output <output_path>]
"""

import sys
import subprocess
import xml.etree.ElementTree as ET
import json
import argparse
from dataclasses import dataclass, field
from typing import List, Dict, Tuple, Optional

# Import clustering components
from semantic_clusterer import SemanticClusterer, OCRElement, UICluster


@dataclass
class UIElement:
    text: str
    bbox: Tuple[int, int, int, int] # x1, y1, x2, y2
    confidence: int

    @property
    def width(self): return self.bbox[2] - self.bbox[0]
    
    @property
    def height(self): return self.bbox[3] - self.bbox[1]
    
    @property
    def center(self):
        return (self.bbox[0] + self.width // 2, self.bbox[1] + self.height // 2)

    def to_ocr_element(self) -> OCRElement:
        """Convert UIElement to OCRElement for clustering."""
        return OCRElement(
            text=self.text,
            x=self.bbox[0],
            y=self.bbox[1],
            width=self.width,
            height=self.height
        )


@dataclass
class AnalysisResult:
    """
    Result of analyzing a GUI screenshot.

    Attributes:
        elements: Raw UI elements detected by OCR
        clusters: Semantic clusters of related UI elements
        ascii_view: ASCII representation of the UI
    """
    elements: List[UIElement] = field(default_factory=list)
    clusters: List[UICluster] = field(default_factory=list)
    ascii_view: str = ""


class GUIAnalyzer:
    def __init__(self):
        self.clusterer = SemanticClusterer()

    def analyze_image(self, image_path: str) -> List[UIElement]:
        """Run Tesseract and parse HOCR output."""
        try:
            # Run tesseract with hocr config
            cmd = ['tesseract', image_path, 'stdout', 'hocr']
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            hocr_content = result.stdout
            return self._parse_hocr(hocr_content)
        except subprocess.CalledProcessError as e:
            print(f"Error running tesseract: {e}")
            return []
        except Exception as e:
            print(f"Error analyzing image: {e}")
            return []

    def _parse_hocr(self, hocr_content: str) -> List[UIElement]:
        """Parse HOCR XML to extract words and bounding boxes."""
        elements = []
        try:
            # Remove namespace for easier parsing
            hocr_content = hocr_content.replace('xmlns="http://www.w3.org/1999/xhtml"', '')
            root = ET.fromstring(hocr_content)
            
            # Find all words (ocrx_word)
            for word in root.findall(".//span[@class='ocrx_word']"):
                text = word.text
                if not text or not text.strip():
                    continue
                
                title = word.get('title')
                if not title:
                    continue
                
                # Parse title attribute: "bbox 24 2 87 15; x_wconf 94"
                parts = title.split(';')
                bbox_str = next((p for p in parts if 'bbox' in p), None)
                conf_str = next((p for p in parts if 'x_wconf' in p), None)
                
                if bbox_str:
                    coords = list(map(int, bbox_str.strip().split()[1:]))
                    if len(coords) == 4:
                        conf = int(conf_str.strip().split()[1]) if conf_str else 0
                        elements.append(UIElement(text, tuple(coords), conf))
                        
        except Exception as e:
            print(f"Error parsing HOCR: {e}")
            
        return elements

    def generate_ascii_view(self, elements: List[UIElement], width: int = 80, height: int = 24) -> str:
        """
        Generate an ASCII representation of the UI.
        This is a simplified projection of the GUI onto a character grid.
        """
        if not elements:
            return "No elements detected."

        # Determine canvas size from elements if not provided
        max_x = max(e.bbox[2] for e in elements) if elements else 1024
        max_y = max(e.bbox[3] for e in elements) if elements else 768
        
        # Scale to ASCII grid
        # Standard terminal: 80x24 characters
        # Assuming 1024x768 resolution
        scale_x = width / max_x if max_x > 0 else 1
        scale_y = height / max_y if max_y > 0 else 1
        
        grid = [[' ' for _ in range(width)] for _ in range(height)]
        
        clickables = []

        for e in elements:
            # Map coordinates to grid
            grid_x = int(e.bbox[0] * scale_x)
            grid_y = int(e.bbox[1] * scale_y)
            
            # Clip
            grid_x = min(max(0, grid_x), width - 1)
            grid_y = min(max(0, grid_y), height - 1)
            
            # Place text
            text = e.text
            for i, char in enumerate(text):
                if grid_x + i < width:
                    grid[grid_y][grid_x + i] = char
            
            # Record clickable region
            clickables.append(f"# [CLICKABLE: {e.bbox[0]},{e.bbox[1]},{e.bbox[2]},{e.bbox[3]} → action:click_{e.text.lower()}]")

        # Build output string
        output_lines = []
        
        # Top border
        output_lines.append('┌' + '─' * (width - 2) + '┐')
        
        for row in grid:
            output_lines.append('│' + ''.join(row)[:width-2].ljust(width-2) + '│')
            
        # Bottom border
        output_lines.append('└' + '─' * (width - 2) + '┘')
        
        # Add metadata
        output_lines.append("")
        output_lines.extend(clickables)
        
        return "\n".join(output_lines)

    def cluster_elements(self, elements: List[UIElement]) -> List[UICluster]:
        """
        Cluster UI elements into semantic groups.

        Args:
            elements: List of UIElement objects to cluster

        Returns:
            List of UICluster objects representing semantic UI components
        """
        # Convert UIElements to OCRElements for clustering
        ocr_elements = [e.to_ocr_element() for e in elements]

        # Use the SemanticClusterer to group elements
        return self.clusterer.cluster(ocr_elements)

    def analyze_with_clustering(self, image_path: str, width: int = 80, height: int = 24) -> AnalysisResult:
        """
        Full analysis of a GUI screenshot with clustering.

        Args:
            image_path: Path to the screenshot
            width: ASCII view width
            height: ASCII view height

        Returns:
            AnalysisResult with elements, clusters, and ASCII view
        """
        elements = self.analyze_image(image_path)
        clusters = self.cluster_elements(elements)
        ascii_view = self.generate_ascii_view(elements, width, height)

        return AnalysisResult(
            elements=elements,
            clusters=clusters,
            ascii_view=ascii_view
        )


def analyze_screenshot(image_path: str, width: int = 80, height: int = 24) -> AnalysisResult:
    """
    Convenience function to analyze a screenshot and get clustered results.

    Args:
        image_path: Path to the screenshot
        width: ASCII view width
        height: ASCII view height

    Returns:
        AnalysisResult with elements, clusters, and ASCII view
    """
    analyzer = GUIAnalyzer()
    return analyzer.analyze_with_clustering(image_path, width, height)


def main():
    parser = argparse.ArgumentParser(description="GUI Structure Analyzer")
    parser.add_argument("image_path", help="Path to screenshot")
    parser.add_argument("--output", help="Output path for ASCII view")
    parser.add_argument("--width", type=int, default=80, help="ASCII width")
    parser.add_argument("--height", type=int, default=30, help="ASCII height")
    
    args = parser.parse_args()
    
    analyzer = GUIAnalyzer()
    elements = analyzer.analyze_image(args.image_path)
    
    ascii_view = analyzer.generate_ascii_view(elements, args.width, args.height)
    
    if args.output:
        with open(args.output, 'w') as f:
            f.write(ascii_view)
        print(f"ASCII view saved to {args.output}")
    else:
        print(ascii_view)

if __name__ == "__main__":
    main()
