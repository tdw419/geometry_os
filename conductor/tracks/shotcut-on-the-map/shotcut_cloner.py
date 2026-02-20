#!/usr/bin/env python3
"""
Shotcut UI Cloner - Task 3 of Transmutation Plan
Orchestrates the full pipeline: Screenshot -> Extraction -> Transmutation -> WGSL
"""

import sys
import argparse
import json
from pathlib import Path
from PIL import Image

# Import local modules
from extraction_pipeline import ExtractionPipeline
from ui_transmuter import UITransmuter


def main():
    parser = argparse.ArgumentParser(description="Shotcut UI Cloner: Pixels -> Native WGSL")
    parser.add_argument("screenshot", help="Path to Shotcut screenshot")
    parser.add_argument(
        "--output",
        "-o",
        default="shotcut_timeline.wgsl",
        help="Output WGSL filename")

    args = parser.parse_args()

    screenshot_path = Path(args.screenshot)
    if not screenshot_path.exists():
        print(f"Error: Screenshot {args.screenshot} not found.")
        sys.exit(1)

    print(f"👁️  Step 1: Reading pixels from {screenshot_path.name}...")
    img = Image.open(screenshot_path)
    res = img.size
    print(f"   Detected resolution: {res[0]}x{res[1]}")

    print(f"🧠 Step 2: Extracting semantic structure...")
    pipeline = ExtractionPipeline()
    result = pipeline.extract(str(screenshot_path))

    # Save intermediate JSON for debugging/audit
    json_path = screenshot_path.with_suffix(".json")
    with open(json_path, "w") as f:
        f.write(result.to_json())
    print(f"   ✅ Extracted {len(result.widgets)} widgets. saved to {json_path.name}")

    print(f"⚛️  Step 3: Transmuting to native WGSL substrate...")
    transmuter = UITransmuter(resolution=res)
    count = transmuter.transmute(str(json_path), args.output)

    print(f"🏁 MISSION SUCCESS: Generated native clone: {args.output}")
    print(f"   Elements reconstructed: {count}")
    print(f"   Architecture: Ouroboros Level 1 (Visual Mirroring)")


if __name__ == "__main__":
    main()
