#!/usr/bin/env python3
"""
PixelRTS v2 Benchmark Suite

Provides standardized performance testing for PixelRTS encoding/decoding operations.
Includes benchmarking, baseline comparison, and result persistence.

Features:
- Benchmark encode, decode, and round-trip operations
- Compare performance against baselines
- Save/load benchmark results
- Generate performance reports

Author: PixelRTS v2 Implementation
Date: 2026-02-09
"""

import time
import json
import sys
from pathlib import Path
from typing import List, Dict, Optional, Tuple
from dataclasses import dataclass, asdict
from datetime import datetime
import statistics

# Add lib directory to path
sys.path.insert(0, str(Path(__file__).parent / 'lib'))

from pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder


@dataclass
class BenchmarkResult:
    """Results from a single benchmark run"""

    operation: str  # 'encode', 'decode', or 'round_trip'
    data_size: int  # Size of data in bytes
    iterations: int  # Number of iterations performed
    avg_time_ms: float  # Average time per iteration (milliseconds)
    min_time_ms: float  # Minimum time across iterations (milliseconds)
    max_time_ms: float  # Maximum time across iterations (milliseconds)
    throughput_mb_s: float  # Throughput in MB/s
    verified: bool = True  # Whether data integrity was verified

    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization"""
        return asdict(self)

    @classmethod
    def from_dict(cls, data: dict) -> 'BenchmarkResult':
        """Create BenchmarkResult from dictionary"""
        return cls(**data)


class BenchmarkRunner:
    """
    Runs performance benchmarks for PixelRTS operations.

    Example:
        >>> runner = BenchmarkRunner()
        >>> results = runner.run_suite(data_sizes=[1024, 4096], iterations=10)
        >>> runner.save_results(results, "benchmark_results.json")
        >>> comparison = runner.compare_with_baseline(results[0], "baselines.json")
    """

    def __init__(self, mode: str = "standard"):
        """
        Initialize benchmark runner.

        Args:
            mode: Encoding mode ('standard' or 'code')
        """
        self.encoder = PixelRTSEncoder(mode=mode)
        self.decoder = PixelRTSDecoder()

    def benchmark_encode(
        self,
        data: bytes,
        iterations: int = 10,
        warmup: int = 2,
        mode: str = None,
        grid_size: int = None
    ) -> BenchmarkResult:
        """
        Benchmark encode operation.

        Args:
            data: Data to encode
            iterations: Number of benchmark iterations
            warmup: Number of warmup iterations (not timed)
            mode: Encoding mode (uses instance mode if None)
            grid_size: Explicit grid size (auto-calculated if None)

        Returns:
            BenchmarkResult with timing statistics
        """
        # Use specified mode or instance mode
        encoder_mode = mode or self.encoder.mode
        if encoder_mode != self.encoder.mode:
            encoder = PixelRTSEncoder(mode=encoder_mode)
        else:
            encoder = self.encoder

        # Warmup iterations
        for _ in range(warmup):
            encoder.encode(data, grid_size=grid_size)

        # Timed iterations
        times_ms = []
        for _ in range(iterations):
            start = time.perf_counter()
            encoder.encode(data, grid_size=grid_size)
            end = time.perf_counter()
            times_ms.append((end - start) * 1000)

        # Calculate statistics
        avg_time = statistics.mean(times_ms)
        min_time = min(times_ms)
        max_time = max(times_ms)

        # Calculate throughput (MB/s)
        # Throughput = (data_size / 1024 / 1024) / (avg_time / 1000)
        throughput_mb_s = (len(data) / 1024 / 1024) / (avg_time / 1000)

        return BenchmarkResult(
            operation='encode',
            data_size=len(data),
            iterations=iterations,
            avg_time_ms=round(avg_time, 3),
            min_time_ms=round(min_time, 3),
            max_time_ms=round(max_time, 3),
            throughput_mb_s=round(throughput_mb_s, 2),
            verified=True
        )

    def benchmark_decode(
        self,
        png_data: bytes,
        expected_size: int = None,
        iterations: int = 10,
        warmup: int = 2
    ) -> BenchmarkResult:
        """
        Benchmark decode operation.

        Args:
            png_data: PNG image data to decode
            expected_size: Expected data size for validation
            iterations: Number of benchmark iterations
            warmup: Number of warmup iterations (not timed)

        Returns:
            BenchmarkResult with timing statistics
        """
        # Warmup iterations
        for _ in range(warmup):
            self.decoder.decode(png_data, expected_size)

        # Timed iterations
        times_ms = []
        decoded_data = None

        for _ in range(iterations):
            start = time.perf_counter()
            decoded_data = self.decoder.decode(png_data, expected_size)
            end = time.perf_counter()
            times_ms.append((end - start) * 1000)

        # Calculate statistics
        avg_time = statistics.mean(times_ms)
        min_time = min(times_ms)
        max_time = max(times_ms)

        data_size = len(decoded_data) if decoded_data else (expected_size or 0)

        # Calculate throughput
        throughput_mb_s = (data_size / 1024 / 1024) / (avg_time / 1000)

        return BenchmarkResult(
            operation='decode',
            data_size=data_size,
            iterations=iterations,
            avg_time_ms=round(avg_time, 3),
            min_time_ms=round(min_time, 3),
            max_time_ms=round(max_time, 3),
            throughput_mb_s=round(throughput_mb_s, 2),
            verified=True
        )

    def benchmark_round_trip(
        self,
        data: bytes,
        iterations: int = 10,
        warmup: int = 2,
        verify: bool = True,
        mode: str = None,
        grid_size: int = None
    ) -> BenchmarkResult:
        """
        Benchmark round-trip encode+decode operation.

        Args:
            data: Data to encode and decode
            iterations: Number of benchmark iterations
            warmup: Number of warmup iterations (not timed)
            verify: Whether to verify decoded data matches original
            mode: Encoding mode (uses instance mode if None)
            grid_size: Explicit grid size (auto-calculated if None)

        Returns:
            BenchmarkResult with timing statistics
        """
        # Use specified mode or instance mode
        encoder_mode = mode or self.encoder.mode
        if encoder_mode != self.encoder.mode:
            encoder = PixelRTSEncoder(mode=encoder_mode)
        else:
            encoder = self.encoder

        verified = True
        last_decoded = None

        # Warmup iterations
        for _ in range(warmup):
            png_bytes = encoder.encode(data, grid_size=grid_size)
            decoded = self.decoder.decode(png_bytes, len(data))
            if verify and decoded != data:
                verified = False

        # Timed iterations
        times_ms = []

        for _ in range(iterations):
            start = time.perf_counter()
            png_bytes = encoder.encode(data, grid_size=grid_size)
            decoded = self.decoder.decode(png_bytes, len(data))
            end = time.perf_counter()
            times_ms.append((end - start) * 1000)

            if verify and decoded != data:
                verified = False

            last_decoded = decoded

        # Calculate statistics
        avg_time = statistics.mean(times_ms)
        min_time = min(times_ms)
        max_time = max(times_ms)

        # Calculate throughput
        throughput_mb_s = (len(data) / 1024 / 1024) / (avg_time / 1000)

        return BenchmarkResult(
            operation='round_trip',
            data_size=len(data),
            iterations=iterations,
            avg_time_ms=round(avg_time, 3),
            min_time_ms=round(min_time, 3),
            max_time_ms=round(max_time, 3),
            throughput_mb_s=round(throughput_mb_s, 2),
            verified=verified
        )

    def run_suite(
        self,
        data_sizes: List[int] = None,
        iterations: int = 10,
        warmup: int = 2,
        mode: str = None,
        data_pattern: bytes = None
    ) -> List[Dict[str, BenchmarkResult]]:
        """
        Run full benchmark suite across multiple data sizes.

        Args:
            data_sizes: List of data sizes in bytes (default: [1KB, 4KB, 16KB, 64KB])
            iterations: Number of iterations per benchmark
            warmup: Number of warmup iterations
            mode: Encoding mode
            data_pattern: Byte pattern for test data (default: null bytes)

        Returns:
            List of dictionaries containing benchmark results for each size
        """
        if data_sizes is None:
            data_sizes = [1024, 4096, 16384, 65536]  # 1KB, 4KB, 16KB, 64KB

        if data_pattern is None:
            data_pattern = b'\x00'

        results = []

        for size in data_sizes:
            # Create test data
            test_data = (data_pattern * ((size // len(data_pattern)) + 1))[:size]

            # Run benchmarks
            encode_result = self.benchmark_encode(
                test_data, iterations=iterations, warmup=warmup, mode=mode
            )

            # Get encoded data for decode benchmark
            encoder_mode = mode or self.encoder.mode
            if encoder_mode != self.encoder.mode:
                encoder = PixelRTSEncoder(mode=encoder_mode)
            else:
                encoder = self.encoder

            png_bytes = encoder.encode(test_data)

            decode_result = self.benchmark_decode(
                png_bytes, expected_size=size, iterations=iterations, warmup=warmup
            )

            round_trip_result = self.benchmark_round_trip(
                test_data, iterations=iterations, warmup=warmup, mode=mode
            )

            results.append({
                'data_size': size,
                'data_size_human': self._format_size(size),
                'encode': encode_result,
                'decode': decode_result,
                'round_trip': round_trip_result
            })

        return results

    def compare_with_baseline(
        self,
        current_results: Dict[str, BenchmarkResult],
        baseline_path: str
    ) -> Dict:
        """
        Compare current benchmark results with baseline.

        Args:
            current_results: Current benchmark results (from run_suite)
            baseline_path: Path to baseline JSON file

        Returns:
            Dictionary with comparison results including delta percentages
        """
        with open(baseline_path, 'r') as f:
            baseline_data = json.load(f)

        size_key = str(current_results['data_size'])

        if 'baselines' not in baseline_data or size_key not in baseline_data['baselines']:
            return {
                'error': f'No baseline found for data size {size_key}',
                'available_sizes': list(baseline_data.get('baselines', {}).keys())
            }

        baseline = baseline_data['baselines'][size_key]
        comparison = {
            'data_size': current_results['data_size'],
            'data_size_human': current_results['data_size_human'],
            'baseline': baseline,
            'current': {},
            'delta_pct': {},
            'status': {}
        }

        for op in ['encode', 'decode', 'round_trip']:
            if op in current_results and op in baseline:
                current = current_results[op]
                base_op = baseline[op]

                comparison['current'][op] = current.to_dict()

                # Calculate delta percentage
                for metric in ['avg_time_ms', 'throughput_mb_s']:
                    if metric in base_op:
                        base_val = base_op[metric]
                        curr_val = getattr(current, metric)
                        delta_pct = ((curr_val - base_val) / base_val) * 100
                        comparison['delta_pct'].setdefault(op, {})[metric] = round(delta_pct, 2)

                # Determine status (better/worse/same)
                if 'avg_time_ms' in comparison['delta_pct'].get(op, {}):
                    time_delta = comparison['delta_pct'][op]['avg_time_ms']
                    if time_delta < -10:
                        comparison['status'][op] = 'better'  # Faster
                    elif time_delta > 10:
                        comparison['status'][op] = 'worse'  # Slower
                    else:
                        comparison['status'][op] = 'same'  # Within 10%

        return comparison

    def save_results(
        self,
        results: List[Dict[str, BenchmarkResult]],
        output_path: str,
        include_metadata: bool = True
    ):
        """
        Save benchmark results to JSON file.

        Args:
            results: Results from run_suite
            output_path: Path to output JSON file
            include_metadata: Whether to include metadata (timestamp, version)
        """
        output_data = {
            'results': []
        }

        if include_metadata:
            output_data['version'] = '1.0'
            output_data['timestamp'] = datetime.now().isoformat()

        for result_set in results:
            result_dict = {
                'data_size': result_set['data_size'],
                'data_size_human': result_set['data_size_human'],
                'encode': result_set['encode'].to_dict(),
                'decode': result_set['decode'].to_dict(),
                'round_trip': result_set['round_trip'].to_dict()
            }
            output_data['results'].append(result_dict)

        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)

        with open(output_path, 'w') as f:
            json.dump(output_data, f, indent=2)

        print(f"Results saved to: {output_path}")

    def load_results(self, input_path: str) -> List[Dict[str, BenchmarkResult]]:
        """
        Load benchmark results from JSON file.

        Args:
            input_path: Path to input JSON file

        Returns:
            List of dictionaries with BenchmarkResult objects
        """
        with open(input_path, 'r') as f:
            data = json.load(f)

        results = []
        for result_set in data['results']:
            results.append({
                'data_size': result_set['data_size'],
                'data_size_human': result_set['data_size_human'],
                'encode': BenchmarkResult.from_dict(result_set['encode']),
                'decode': BenchmarkResult.from_dict(result_set['decode']),
                'round_trip': BenchmarkResult.from_dict(result_set['round_trip'])
            })

        return results

    @staticmethod
    def _format_size(size_bytes: int) -> str:
        """Format byte size to human-readable string"""
        for unit in ['B', 'KB', 'MB', 'GB']:
            if size_bytes < 1024.0:
                return f"{size_bytes:.1f}{unit}"
            size_bytes /= 1024.0
        return f"{size_bytes:.1f}TB"


def create_baseline(
    data_sizes: List[int] = None,
    iterations: int = 20,
    output_path: str = None
) -> Dict:
    """
    Create baseline performance metrics.

    Args:
        data_sizes: Data sizes to benchmark
        iterations: Iterations per benchmark (higher for stable baselines)
        output_path: Path to save baseline file

    Returns:
        Baseline data dictionary
    """
    runner = BenchmarkRunner()
    results = runner.run_suite(data_sizes=data_sizes, iterations=iterations)

    baseline_data = {
        'version': '1.0',
        'timestamp': datetime.now().isoformat(),
        'baselines': {}
    }

    for result_set in results:
        size_key = str(result_set['data_size'])
        baseline_data['baselines'][size_key] = {
            'encode': result_set['encode'].to_dict(),
            'decode': result_set['decode'].to_dict(),
            'round_trip': result_set['round_trip'].to_dict()
        }

    if output_path:
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)

        with open(output_path, 'w') as f:
            json.dump(baseline_data, f, indent=2)

        print(f"Baseline saved to: {output_path}")

    return baseline_data


def main():
    """CLI entry point for benchmark runner"""
    import argparse

    parser = argparse.ArgumentParser(
        description='PixelRTS v2 Benchmark Suite',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Run default benchmark suite
  %(prog)s

  # Run with specific data sizes
  %(prog)s --sizes 1024 4096 16384

  # Run with more iterations for accuracy
  %(prog)s --iterations 20

  # Create new baseline
  %(prog)s --create-baseline baselines.json

  # Compare against baseline
  %(prog)s --baseline baselines.json

  # Save results to file
  %(prog)s --output results.json
        """
    )

    parser.add_argument(
        '--sizes',
        nargs='+',
        type=int,
        help='Data sizes in bytes'
    )

    parser.add_argument(
        '--iterations',
        type=int,
        default=10,
        help='Number of iterations per benchmark (default: 10)'
    )

    parser.add_argument(
        '--warmup',
        type=int,
        default=2,
        help='Number of warmup iterations (default: 2)'
    )

    parser.add_argument(
        '--mode',
        choices=['standard', 'code'],
        default='standard',
        help='Encoding mode (default: standard)'
    )

    parser.add_argument(
        '--output',
        help='Save results to file'
    )

    parser.add_argument(
        '--baseline',
        help='Compare against baseline file'
    )

    parser.add_argument(
        '--create-baseline',
        metavar='PATH',
        help='Create new baseline file'
    )

    parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose output'
    )

    args = parser.parse_args()

    # Create baseline if requested
    if args.create_baseline:
        print(f"Creating baseline with {args.iterations} iterations...")
        baseline_data = create_baseline(
            data_sizes=args.sizes,
            iterations=args.iterations,
            output_path=args.create_baseline
        )
        print("\nBaseline created successfully!")
        return 0

    # Run benchmarks
    runner = BenchmarkRunner(mode=args.mode)

    if args.verbose:
        print(f"Running benchmarks with {args.iterations} iterations...")
        print(f"Mode: {args.mode}")
        if args.sizes:
            print(f"Sizes: {[runner._format_size(s) for s in args.sizes]}")
        print()

    results = runner.run_suite(
        data_sizes=args.sizes,
        iterations=args.iterations,
        warmup=args.warmup,
        mode=args.mode
    )

    # Print results
    print("Benchmark Results:")
    print("=" * 80)

    for result_set in results:
        size = result_set['data_size_human']
        print(f"\nData Size: {size}")
        print("-" * 40)

        for op in ['encode', 'decode', 'round_trip']:
            result = result_set[op]
            print(f"\n{op.capitalize()}:")
            print(f"  Avg: {result.avg_time_ms:.3f} ms")
            print(f"  Min: {result.min_time_ms:.3f} ms")
            print(f"  Max: {result.max_time_ms:.3f} ms")
            print(f"  Throughput: {result.throughput_mb_s:.2f} MB/s")

    # Compare with baseline if provided
    if args.baseline:
        print("\n" + "=" * 80)
        print("Baseline Comparison:")
        print("=" * 80)

        for result_set in results:
            comparison = runner.compare_with_baseline(result_set, args.baseline)

            if 'error' in comparison:
                print(f"\n{comparison['error']}")
                if 'available_sizes' in comparison:
                    print(f"Available baseline sizes: {comparison['available_sizes']}")
                continue

            size = comparison['data_size_human']
            print(f"\nData Size: {size}")
            print("-" * 40)

            for op in ['encode', 'decode', 'round_trip']:
                if op in comparison['delta_pct']:
                    delta = comparison['delta_pct'][op].get('avg_time_ms', 0)
                    status = comparison['status'].get(op, 'unknown')
                    symbol = {
                        'better': '✓',
                        'worse': '✗',
                        'same': '='
                    }.get(status, '?')

                    print(f"\n{op.capitalize()}: {symbol} {status}")
                    print(f"  Time delta: {delta:+.1f}%")

    # Save results if requested
    if args.output:
        runner.save_results(results, args.output)

    return 0


if __name__ == '__main__':
    sys.exit(main())
