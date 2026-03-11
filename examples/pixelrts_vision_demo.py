#!/usr/bin/env python3
"""
PixelRTS Vision Demo

Interactive demo script showing PixelRTS vision analysis capabilities.
This script analyzes ubuntu_kernel.rts.png and demonstrates:
- Visual summary extraction
- Entropy overlay generation
- LM Studio availability check
- Vision model analysis (if available)
- Findings visualization
"""

import sys
import json
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.pixel_compiler.pixelrts_vision_analyzer import PixelRTSVisionAnalyzer

# ANSI color codes for terminal output
class Colors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def print_header(text: str):
    """Print a formatted header."""
    print(f"\n{Colors.HEADER}{Colors.BOLD}{'=' * 60}{Colors.ENDC}")
    print(f"{Colors.HEADER}{Colors.BOLD}{text.center(60)}{Colors.ENDC}")
    print(f"{Colors.HEADER}{Colors.BOLD}{'=' * 60}{Colors.ENDC}\n")


def print_section(title: str):
    """Print a section header."""
    print(f"\n{Colors.OKCYAN}{Colors.BOLD}>>> {title}{Colors.ENDC}")
    print(f"{Colors.OKCYAN}{'-' * 60}{Colors.ENDC}\n")


def print_success(text: str):
    """Print success message."""
    print(f"{Colors.OKGREEN}{text}{Colors.ENDC}")


def print_warning(text: str):
    """Print warning message."""
    print(f"{Colors.WARNING}{text}{Colors.ENDC}")


def print_error(text: str):
    """Print error message."""
    print(f"{Colors.FAIL}{text}{Colors.ENDC}")


def check_lm_studio() -> bool:
    """Check if LM Studio is available at localhost:1234."""
    try:
        import requests
        response = requests.get("http://localhost:1234/v1/models", timeout=2)
        if response.status_code == 200:
            data = response.json()
            if data.get("data"):
                return True
        return False
    except Exception:
        return False


def print_dict_pretty(data: dict, indent: int = 0):
    """Pretty print a dictionary."""
    for key, value in data.items():
        if isinstance(value, dict):
            print("  " * indent + f"{Colors.BOLD}{key}:{Colors.ENDC}")
            print_dict_pretty(value, indent + 1)
        elif isinstance(value, (int, float)):
            print("  " * indent + f"{key}: {Colors.OKBLUE}{value}{Colors.ENDC}")
        else:
            print("  " * indent + f"{key}: {value}")


def main():
    """Run the PixelRTS vision demo."""
    print_header("PixelRTS Vision Analysis Demo")

    # Define paths
    project_root = Path(__file__).parent.parent
    rts_path = project_root / "ubuntu_kernel.rts.png"
    output_dir = project_root / "examples" / "output"

    # Check if artifact exists
    if not rts_path.exists():
        print_error(f"Error: RTS artifact not found at {rts_path}")
        print_warning("Please ensure ubuntu_kernel.rts.png exists in the project root.")
        sys.exit(1)

    print_success(f"Found PixelRTS artifact: {rts_path.name}")

    # Step 1: Load and analyze
    print_section("Step 1: Loading PixelRTS Artifact")
    try:
        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        print_success("Successfully loaded PixelRTS Vision Analyzer")
    except Exception as e:
        print_error(f"Failed to load artifact: {e}")
        sys.exit(1)

    # Step 2: Visual summary
    print_section("Step 2: Visual Summary")
    summary = analyzer.get_visual_summary()
    print_dict_pretty(summary)

    # Print formatted summary
    print(f"\n{Colors.BOLD}Image Dimensions:{Colors.ENDC} {summary['width']} x {summary['height']} pixels")
    print(f"{Colors.BOLD}Total Pixels:{Colors.ENDC} {summary['total_pixels']:,}")
    print(f"{Colors.BOLD}Channels:{Colors.ENDC} {summary['channels']} (RGBA)")
    print(f"{Colors.BOLD}Aspect Ratio:{Colors.ENDC} {summary['aspect_ratio']:.2f}")
    if 'data_size' in summary:
        print(f"{Colors.BOLD}Data Size:{Colors.ENDC} {summary['data_size']:,} bytes")

    # Step 3: Entropy overlay
    print_section("Step 3: Generating Entropy Overlay")
    try:
        output_dir.mkdir(parents=True, exist_ok=True)
        entropy_overlay = analyzer.generate_entropy_overlay(str(output_dir))
        print_success(f"Entropy overlay saved to: {entropy_overlay}")
        print(f"  This shows pixel variance/entropy distribution across the image.")
    except Exception as e:
        print_error(f"Failed to generate entropy overlay: {e}")

    # Step 4: Check LM Studio
    print_section("Step 4: Checking Vision Model Availability")
    lm_studio_available = check_lm_studio()

    if lm_studio_available:
        print_success("LM Studio is running at http://localhost:1234/v1")
        print("  Vision model analysis is available!")
    else:
        print_warning("LM Studio is not available at http://localhost:1234/v1")
        print("  Skipping vision model analysis.")
        print("  To enable:")
        print("    1. Download LM Studio from https://lmstudio.ai/")
        print("    2. Start LM Studio and load a vision model (e.g., llava-phi-3)")
        print("    3. Start the API server")
        print("    4. Run this demo again")

    # Step 5: Vision analysis (if available)
    if lm_studio_available:
        print_section("Step 5: Running Vision Model Analysis")

        try:
            print("  Preparing image for vision model...")
            _, img_b64 = analyzer.prepare_for_vision_model(max_size=512)
            print_success(f"  Image prepared ({len(img_b64)} chars base64)")

            print("  Sending analysis request...")
            vision_response = analyzer.analyze_with_vision_model()

            if vision_response:
                print_success("  Vision model analysis complete!")
                print(f"\n{Colors.BOLD}Vision Analysis Results:{Colors.ENDC}")
                print(f"{Colors.OKCYAN}{'-' * 60}{Colors.ENDC}")
                print(vision_response)
                print(f"{Colors.OKCYAN}{'-' * 60}{Colors.ENDC}")

                # Step 6: Parse and visualize findings
                print_section("Step 6: Parsing and Visualizing Findings")
                findings = analyzer.parse_vision_findings(vision_response)

                for category, items in findings.items():
                    category_name = category.replace('_', ' ').title()
                    if items:
                        print(f"\n{Colors.BOLD}{category_name}:{Colors.ENDC}")
                        for item in items:
                            print(f"  - {item}")
                    else:
                        print(f"\n{Colors.WARNING}{category_name}: No findings{Colors.ENDC}")

                # Generate findings overlay
                print("\nGenerating findings overlay...")
                findings_overlay = analyzer.generate_findings_overlay(
                    findings,
                    str(output_dir)
                )
                print_success(f"Findings overlay saved to: {findings_overlay}")

                # Save findings to JSON
                findings_json = output_dir / "vision_findings.json"
                with open(findings_json, 'w') as f:
                    json.dump(findings, f, indent=2)
                print_success(f"Findings saved to: {findings_json}")

            else:
                print_warning("  Vision model returned empty response")

        except ImportError as e:
            print_error(f"  Vision client not available: {e}")
        except Exception as e:
            print_error(f"  Vision analysis failed: {e}")

    # Completion
    print_header("Demo Complete")

    print(f"{Colors.BOLD}Generated Files:{Colors.ENDC}")
    print(f"  {Colors.OKCYAN}Entropy Overlay:{Colors.ENDC} {entropy_overlay}")
    if lm_studio_available and 'findings_overlay' in locals():
        print(f"  {Colors.OKCYAN}Findings Overlay:{Colors.ENDC} {findings_overlay}")
    if lm_studio_available and 'findings_json' in locals():
        print(f"  {Colors.OKCYAN}Findings JSON:{Colors.ENDC} {findings_json}")

    print(f"\n{Colors.BOLD}Output Directory:{Colors.ENDC} {output_dir}")
    print(f"\n{Colors.OKGREEN}To view the results, open the PNG files in an image viewer.{Colors.ENDC}\n")

    return 0


if __name__ == "__main__":
    sys.exit(main())
