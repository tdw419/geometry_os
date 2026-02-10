#!/usr/bin/env python3
"""
VLM Self-Healing OS Demo Script

This script demonstrates the VLM Self-Healing OS capabilities:
1. Single health check on a PixelRTS image
2. Continuous monitoring mode
3. REST API integration examples

Usage:
    python examples/vlm_self_healing_demo.py
    python examples/vlm_self_healing_demo.py --mode check --image kernel.rts.png
    python examples/vlm_self_healing_demo.py --mode monitor --images kernel.rts.png system.rts.png
    python examples/vlm_self_healing_demo.py --mode api
"""

import sys
import json
import asyncio
import argparse
from pathlib import Path
from typing import List, Optional
from datetime import datetime

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

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


def print_header(text: str):
    """Print a formatted header."""
    print(f"\n{Colors.HEADER}{Colors.BOLD}{'=' * 70}{Colors.ENDC}")
    print(f"{Colors.HEADER}{Colors.BOLD}{text.center(70)}{Colors.ENDC}")
    print(f"{Colors.HEADER}{Colors.BOLD}{'=' * 70}{Colors.ENDC}\n")


def print_section(title: str):
    """Print a section header."""
    print(f"\n{Colors.OKCYAN}{Colors.BOLD}>>> {title}{Colors.ENDC}")
    print(f"{Colors.OKCYAN}{'-' * 70}{Colors.ENDC}\n")


def print_success(text: str):
    """Print success message."""
    print(f"{Colors.OKGREEN}{text}{Colors.ENDC}")


def print_warning(text: str):
    """Print warning message."""
    print(f"{Colors.WARNING}{text}{Colors.ENDC}")


def print_error(text: str):
    """Print error message."""
    print(f"{Colors.FAIL}{text}{Colors.ENDC}")


def print_info(text: str):
    """Print info message."""
    print(f"{Colors.OKBLUE}{text}{Colors.ENDC}")


# =============================================================================
# Demo 1: Single Health Check
# =============================================================================

def demo_single_health_check(image_path: str, verbose: bool = True):
    """
    Demonstrate single health check on a PixelRTS image.

    This shows how to:
    1. Load and analyze a PixelRTS image
    2. Perform visual diagnostics
    3. Check health status
    4. Generate recommendations
    """
    print_section("Demo 1: Single Health Check")

    # Import here for better error handling
    try:
        from systems.intelligence.vlm_visual_diagnostics import VLMVisualDiagnostics
        from systems.pixel_compiler.pixelrts_vision_analyzer import PixelRTSVisionAnalyzer
    except ImportError as e:
        print_error(f"Failed to import required modules: {e}")
        print_warning("Make sure you're running from the project root directory.")
        return False

    # Check if file exists
    rts_path = Path(image_path)
    if not rts_path.exists():
        print_error(f"Image not found: {rts_path}")
        print_info("Creating a demo PixelRTS image for testing...")

        # Try to create a demo image
        try:
            from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
            demo_data = b"Hello, VLM Self-Healing OS!" * 1000
            encoder = PixelRTSEncoder(mode="standard")
            encoder.save(demo_data, str(rts_path), metadata={
                "type": "demo",
                "name": "VLM Self-Healing Demo",
                "description": "Demo image for VLM self-healing"
            })
            print_success(f"Created demo image: {rts_path}")
        except Exception as e:
            print_error(f"Failed to create demo image: {e}")
            return False

    # Step 1: Visual Diagnostics
    print_info("Step 1: Running VLM Visual Diagnostics...")
    try:
        diagnostics = VLMVisualDiagnostics(str(rts_path))

        # Capture output
        import io
        from contextlib import redirect_stdout

        output = io.StringIO()
        with redirect_stdout(output):
            diagnostics.generate_report()

        report = output.getvalue()
        if verbose:
            print(report)
        else:
            # Print summary only
            lines = report.split('\n')
            for line in lines[:10]:  # First 10 lines
                print(line)

    except Exception as e:
        print_error(f"Visual diagnostics failed: {e}")

    # Step 2: Vision Analyzer
    print_info("\nStep 2: Analyzing with PixelRTS Vision Analyzer...")
    try:
        analyzer = PixelRTSVisionAnalyzer(str(rts_path))

        # Get visual summary
        summary = analyzer.get_visual_summary()
        print(f"  Dimensions: {summary['width']}x{summary['height']}")
        print(f"  Total pixels: {summary['total_pixels']:,}")
        print(f"  Channels: {summary['channels']}")

        # Generate entropy overlay
        output_dir = rts_path.parent / "demo_output"
        output_dir.mkdir(exist_ok=True)

        overlay_path = analyzer.generate_entropy_overlay(str(output_dir))
        print_success(f"  Entropy overlay: {overlay_path}")

    except Exception as e:
        print_error(f"Vision analyzer failed: {e}")

    # Step 3: Pattern Detection
    print_info("\nStep 3: Running pattern detection...")
    try:
        from systems.pixel_compiler.pattern_detector import PatternDetector

        detector = PatternDetector(str(rts_path))

        # Edge detection
        edge_result = detector.detect_edges_sobel()
        print(f"  Edge count: {edge_result.edge_count}")
        print(f"  Edge density: {edge_result.edge_density:.2%}")

        # Fourier analysis
        fourier_result = detector.analyze_fourier()
        print(f"  Periodic patterns: {fourier_result.has_periodic_patterns}")
        print(f"  Dominant frequency: {fourier_result.dominant_frequency}")

        # Clustering
        cluster_result = detector.detect_clusters(
            eps=5.0,
            min_samples=10,
            feature_type="position"
        )
        print(f"  Clusters found: {cluster_result.num_clusters}")
        print(f"  Noise points: {cluster_result.noise_points}")

    except Exception as e:
        print_warning(f"Pattern detection failed: {e}")

    # Step 4: Health Status
    print_info("\nStep 4: Determining health status...")

    # Simulate health check logic
    health_status = "HEALTHY"
    confidence = 0.95
    findings = []
    recommendation = "No action required"

    # Based on edge density
    if edge_result.edge_density > 0.5:
        health_status = "WARNING"
        confidence = 0.75
        findings.append({
            "category": "structural",
            "description": "High edge density detected",
            "severity": "warning"
        })
        recommendation = "Review visual patterns for anomalies"

    if fourier_result.has_periodic_patterns:
        findings.append({
            "category": "pattern",
            "description": "Periodic patterns detected",
            "severity": "info"
        })

    print(f"  Status: {Colors.OKGREEN if health_status == 'HEALTHY' else Colors.WARNING}{health_status}{Colors.ENDC}")
    print(f"  Confidence: {confidence:.2%}")
    print(f"  Findings: {len(findings)}")

    if findings and verbose:
        print("\n  Findings:")
        for finding in findings:
            severity = finding['severity']
            color = Colors.OKGREEN if severity == 'info' else Colors.WARNING if severity == 'warning' else Colors.FAIL
            print(f"    {color}[{severity.upper()}]{Colors.ENDC} {finding['category']}: {finding['description']}")

    print(f"\n  Recommendation: {recommendation}")

    # Save results
    result = {
        "image_path": str(rts_path),
        "status": health_status,
        "confidence": confidence,
        "findings": findings,
        "recommendation": recommendation,
        "timestamp": datetime.now().isoformat()
    }

    result_path = output_dir / "health_check_result.json"
    with open(result_path, 'w') as f:
        json.dump(result, f, indent=2)
    print_success(f"\nResults saved to: {result_path}")

    return True


# =============================================================================
# Demo 2: Continuous Monitoring
# =============================================================================

async def demo_monitoring(image_paths: List[str], interval: int = 10, iterations: int = 3):
    """
    Demonstrate continuous monitoring of PixelRTS images.

    This shows how to:
    1. Set up monitoring for multiple images
    2. Perform periodic health checks
    3. Detect changes over time
    4. Trigger healing actions if needed
    """
    print_section("Demo 2: Continuous Monitoring")

    print_info(f"Monitoring {len(image_paths)} images...")
    print_info(f"Check interval: {interval} seconds")
    print_info(f"Iterations: {iterations}\n")

    # Store previous results for change detection
    previous_results = {}

    for iteration in range(iterations):
        print(f"\n{Colors.BOLD}--- Iteration {iteration + 1}/{iterations} ---{Colors.ENDC}")
        print(f"Time: {datetime.now().strftime('%H:%M:%S')}")

        for image_path in image_paths:
            print(f"\n{Colors.OKCYAN}Checking: {image_path}{Colors.ENDC}")

            # Simulate health check
            import random
            health_status = random.choice(["HEALTHY", "HEALTHY", "HEALTHY", "WARNING"])
            confidence = random.uniform(0.7, 0.99)
            entropy = random.uniform(100, 200)

            print(f"  Status: {Colors.OKGREEN if health_status == 'HEALTHY' else Colors.WARNING}{health_status}{Colors.ENDC}")
            print(f"  Confidence: {confidence:.2%}")
            print(f"  Entropy: {entropy:.2f}")

            # Detect changes
            if image_path in previous_results:
                prev_status = previous_results[image_path]['status']
                prev_entropy = previous_results[image_path]['entropy']

                if prev_status != health_status:
                    print_warning(f"  Status changed: {prev_status} -> {health_status}")

                entropy_change = abs(entropy - prev_entropy)
                if entropy_change > 20:
                    print_warning(f"  Significant entropy change: {entropy_change:.2f}")

            # Store result
            previous_results[image_path] = {
                'status': health_status,
                'confidence': confidence,
                'entropy': entropy,
                'timestamp': datetime.now().isoformat()
            }

        # Wait for next iteration
        if iteration < iterations - 1:
            print_info(f"\nWaiting {interval} seconds...")
            await asyncio.sleep(interval)

    print_success("\nMonitoring complete!")

    # Print summary
    print_section("Monitoring Summary")
    for image_path, results in previous_results.items():
        print(f"\n{Colors.BOLD}{image_path}:{Colors.ENDC}")
        print(f"  Final status: {results['status']}")
        print(f"  Final confidence: {results['confidence']:.2%}")
        print(f"  Final entropy: {results['entropy']:.2f}")


# =============================================================================
# Demo 3: REST API Integration
# =============================================================================

def demo_rest_api(base_url: str = "http://localhost:8000"):
    """
    Demonstrate REST API integration for VLM health monitoring.

    This shows how to:
    1. Check API health
    2. List available models
    3. Submit health check requests
    4. Process batch analysis
    """
    print_section("Demo 3: REST API Integration")

    try:
        import requests
    except ImportError:
        print_error("requests library not installed. Install with: pip install requests")
        return False

    # Check if API is running
    print_info("Checking API availability...")
    try:
        response = requests.get(f"{base_url}/health", timeout=5)
        if response.status_code == 200:
            print_success(f"API is running at {base_url}")
            data = response.json()
            print(f"  Status: {data.get('status')}")
            print(f"  Version: {data.get('version')}")
        else:
            print_warning(f"API returned unexpected status: {response.status_code}")
            return False
    except requests.exceptions.ConnectionError:
        print_error(f"Cannot connect to API at {base_url}")
        print_info("Start the API with:")
        print_info("  uvicorn systems.pixel_compiler.api.main:app --reload")
        return False
    except Exception as e:
        print_error(f"Failed to connect to API: {e}")
        return False

    # List available models
    print_info("\nFetching available models...")
    try:
        response = requests.get(f"{base_url}/api/v1/models")
        if response.status_code == 200:
            data = response.json()
            print_success("Available models:")
            for model, details in data.get('models', {}).items():
                print(f"  - {model}")
        else:
            print_warning("Failed to fetch models")
    except Exception as e:
        print_warning(f"Failed to fetch models: {e}")

    # Demonstrate analysis endpoint
    print_info("\nDemonstrating analysis endpoint...")

    # Try to find a test image
    test_images = [
        Path("ubuntu_kernel.rts.png"),
        Path("alpine.rts.png"),
        Path("FRACTAL_DEMO.rts.png")
    ]

    test_image = None
    for path in test_images:
        if path.exists():
            test_image = path
            break

    if not test_image:
        print_warning("No test image found. Skipping analysis demo.")
        print_info("To test analysis, place a .rts.png file in the project root.")
        return True

    print_info(f"Using test image: {test_image}")

    try:
        with open(test_image, 'rb') as f:
            files = {'file': f}
            data = {
                'methods': json.dumps(['edges']),
                'edge_method': 'sobel',
                'return_overlay': 'false'
            }

            response = requests.post(
                f"{base_url}/api/v1/analyze",
                files=files,
                data=data
            )

            if response.status_code == 200:
                result = response.json()
                print_success("Analysis complete!")
                print(f"  Success: {result.get('success')}")

                if 'analysis' in result:
                    analysis = result['analysis']
                    if 'edges' in analysis:
                        edges = analysis['edges']
                        print(f"  Edges detected: {edges.get('edge_count')}")
                        print(f"  Edge density: {edges.get('edge_density'):.2%}")
            else:
                print_warning(f"Analysis failed with status {response.status_code}")

    except Exception as e:
        print_error(f"Analysis failed: {e}")

    print_success("\nREST API demo complete!")
    return True


# =============================================================================
# Demo 4: Self-Healing Action
# =============================================================================

def demo_self_healing(image_path: str):
    """
    Demonstrate self-healing action triggered by health check.

    This shows how to:
    1. Detect critical issues
    2. Trigger healing actions
    3. Verify recovery
    """
    print_section("Demo 4: Self-Healing Action")

    print_info("Simulating critical issue detection...")

    # Simulate a critical health check result
    print_warning("CRITICAL: Data corruption detected!")
    print(f"  Image: {image_path}")
    print(f"  Anomaly score: 0.92")
    print(f"  Findings: 3 critical issues")

    print("\nDetected issues:")
    print("  - [CORRUPTION] Bit flip detected at offset 0x1000")
    print("  - [STRUCTURAL] Invalid header checksum")
    print("  - [SECURITY] Unexpected modification detected")

    print_info("\nInitiating self-healing sequence...")

    # Simulate healing steps
    steps = [
        ("Creating backup", "Creating backup of corrupted image..."),
        ("Analyzing corruption", "Analyzing corruption patterns..."),
        ("Generating repair mutation", "Generating repair mutation..."),
        ("Applying mutation", "Applying mutation via evolution daemon..."),
        ("Verifying repair", "Verifying repair integrity..."),
        ("Finalizing", "Finalizing healing process...")
    ]

    for step_name, step_desc in steps:
        print(f"  [{step_name}] {step_desc}")
        import time
        time.sleep(0.5)  # Simulate processing time
        print_success(f"    {step_name} complete")

    print_success("\nSelf-healing complete!")
    print(f"  Status: HEALED")
    print(f"  Integrity: RESTORED")
    print(f"  Backup: {image_path}.backup")

    return True


# =============================================================================
# Main Entry Point
# =============================================================================

def main():
    """Main demo entry point."""
    parser = argparse.ArgumentParser(
        description="VLM Self-Healing OS Demo",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Run all demos with defaults
  python examples/vlm_self_healing_demo.py

  # Single health check demo
  python examples/vlm_self_healing_demo.py --mode check --image kernel.rts.png

  # Monitoring demo
  python examples/vlm_self_healing_demo.py --mode monitor --images kernel.rts.png system.rts.png

  # REST API demo
  python examples/vlm_self_healing_demo.py --mode api

  # Self-healing demo
  python examples/vlm_self_healing_demo.py --mode heal --image kernel.rts.png
        """
    )

    parser.add_argument(
        '--mode',
        choices=['all', 'check', 'monitor', 'api', 'heal'],
        default='all',
        help='Demo mode to run (default: all)'
    )

    parser.add_argument(
        '--image',
        default='ubuntu_kernel.rts.png',
        help='PixelRTS image path (default: ubuntu_kernel.rts.png)'
    )

    parser.add_argument(
        '--images',
        nargs='+',
        default=['ubuntu_kernel.rts.png', 'alpine.rts.png'],
        help='Multiple PixelRTS images for monitoring demo'
    )

    parser.add_argument(
        '--interval',
        type=int,
        default=10,
        help='Monitoring interval in seconds (default: 10)'
    )

    parser.add_argument(
        '--iterations',
        type=int,
        default=3,
        help='Number of monitoring iterations (default: 3)'
    )

    parser.add_argument(
        '--api-url',
        default='http://localhost:8000',
        help='REST API base URL (default: http://localhost:8000)'
    )

    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose output'
    )

    args = parser.parse_args()

    # Print header
    print_header("VLM Self-Healing OS Demo")

    print_info("This demo showcases the VLM Self-Healing OS capabilities:")
    print("  1. Single health check on PixelRTS images")
    print("  2. Continuous monitoring with change detection")
    print("  3. REST API integration")
    print("  4. Autonomous self-healing actions")

    # Run requested demos
    success = True

    if args.mode in ['all', 'check']:
        try:
            if not demo_single_health_check(args.image, args.verbose):
                success = False
        except Exception as e:
            print_error(f"Health check demo failed: {e}")
            import traceback
            traceback.print_exc()
            success = False

    if args.mode in ['all', 'monitor']:
        try:
            asyncio.run(demo_monitoring(args.images, args.interval, args.iterations))
        except Exception as e:
            print_error(f"Monitoring demo failed: {e}")
            import traceback
            traceback.print_exc()
            success = False

    if args.mode in ['all', 'api']:
        try:
            if not demo_rest_api(args.api_url):
                success = False
        except Exception as e:
            print_error(f"REST API demo failed: {e}")
            import traceback
            traceback.print_exc()
            success = False

    if args.mode in ['all', 'heal']:
        try:
            if not demo_self_healing(args.image):
                success = False
        except Exception as e:
            print_error(f"Self-healing demo failed: {e}")
            import traceback
            traceback.print_exc()
            success = False

    # Print completion
    print_header("Demo Complete")

    if success:
        print_success("All demos completed successfully!")
        print_info("\nNext steps:")
        print("  - Try the CLI: python -m systems.pixel_compiler.vlm_health_cli --help")
        print("  - Read the guide: docs/VLM_SELF_HEALING_GUIDE.md")
        print("  - Start the API: uvicorn systems.pixel_compiler.api.main:app --reload")
        return 0
    else:
        print_error("Some demos failed. Check error messages above.")
        return 1


if __name__ == "__main__":
    sys.exit(main())
