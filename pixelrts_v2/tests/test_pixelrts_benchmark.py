#!/usr/bin/env python3
"""Tests for PixelRTS Benchmark Suite"""
import pytest
import sys
from pathlib import Path
import tempfile
import json
import time

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent / 'tools' / 'lib'))
sys.path.insert(0, str(Path(__file__).parent.parent / 'tools'))

from pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder
from pixelrts_benchmark import BenchmarkRunner, BenchmarkResult


def test_benchmark_runner_initialization():
    """Test that BenchmarkRunner can be initialized"""
    runner = BenchmarkRunner()
    assert runner is not None
    assert runner.encoder is not None
    assert runner.decoder is not None


def test_benchmark_encode_small():
    """Test benchmarking encode operation for small data"""
    runner = BenchmarkRunner()
    test_data = b'\x00' * 1024  # 1 KB

    result = runner.benchmark_encode(test_data, iterations=10)

    assert result is not None
    assert result.operation == 'encode'
    assert result.data_size == 1024
    assert result.iterations == 10
    assert result.avg_time_ms > 0
    assert result.min_time_ms > 0
    assert result.max_time_ms > 0
    assert result.throughput_mb_s > 0


def test_benchmark_decode_small():
    """Test benchmarking decode operation for small data"""
    runner = BenchmarkRunner()
    encoder = PixelRTSEncoder()

    # First encode some data
    test_data = b'\x00' * 1024  # 1 KB
    png_bytes = encoder.encode(test_data)

    result = runner.benchmark_decode(png_bytes, expected_size=1024, iterations=10)

    assert result is not None
    assert result.operation == 'decode'
    assert result.iterations == 10
    assert result.avg_time_ms > 0
    assert result.throughput_mb_s > 0


def test_benchmark_round_trip_small():
    """Test benchmarking round-trip encode+decode for small data"""
    runner = BenchmarkRunner()
    test_data = b'\x00' * 1024  # 1 KB

    result = runner.benchmark_round_trip(test_data, iterations=10)

    assert result is not None
    assert result.operation == 'round_trip'
    assert result.data_size == 1024
    assert result.iterations == 10
    assert result.avg_time_ms > 0
    assert result.throughput_mb_s > 0


def test_benchmark_round_trip_verification():
    """Test that round-trip benchmarking preserves data integrity"""
    runner = BenchmarkRunner()
    test_data = bytes(range(256)) * 4  # 1 KB with diverse bytes

    result = runner.benchmark_round_trip(test_data, iterations=5, verify=True)

    assert result is not None
    assert result.verified is True
    assert result.data_size == len(test_data)


def test_run_suite_multiple_sizes():
    """Test running benchmark suite across multiple data sizes"""
    runner = BenchmarkRunner()
    sizes = [1024, 4096, 16384]  # 1KB, 4KB, 16KB

    results = runner.run_suite(data_sizes=sizes, iterations=5)

    assert len(results) == len(sizes)
    assert all('encode' in r for r in results)
    assert all('decode' in r for r in results)
    assert all('round_trip' in r for r in results)


def test_run_suite_with_warmup():
    """Test running benchmark suite with warmup iterations"""
    runner = BenchmarkRunner()
    sizes = [1024]

    results = runner.run_suite(data_sizes=sizes, iterations=5, warmup=2)

    assert len(results) == 1
    assert 'round_trip' in results[0]


def test_compare_with_baseline():
    """Test comparing benchmark results with baseline"""
    runner = BenchmarkRunner()

    # Create a temporary baseline file
    baseline = {
        'version': '1.0',
        'baselines': {
            '1024': {
                'encode': {'avg_time_ms': 1.0, 'throughput_mb_s': 1.0},
                'decode': {'avg_time_ms': 0.5, 'throughput_mb_s': 2.0},
                'round_trip': {'avg_time_ms': 1.5, 'throughput_mb_s': 0.67}
            }
        }
    }

    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        json.dump(baseline, f)
        baseline_path = f.name

    try:
        # Run benchmark
        test_data = b'\x00' * 1024
        results = runner.run_suite(data_sizes=[1024], iterations=5)

        # Compare with baseline
        comparison = runner.compare_with_baseline(results[0], baseline_path)

        assert comparison is not None
        assert 'baseline' in comparison
        assert 'current' in comparison
        assert 'encode' in comparison['delta_pct']
    finally:
        Path(baseline_path).unlink()


def test_save_results():
    """Test saving benchmark results to file"""
    runner = BenchmarkRunner()
    test_data = b'\x00' * 1024

    results = runner.run_suite(data_sizes=[1024], iterations=5)

    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        output_path = f.name

    try:
        runner.save_results(results, output_path)

        # Verify file exists and has correct structure
        assert Path(output_path).exists()

        with open(output_path, 'r') as f:
            saved_data = json.load(f)

        assert 'version' in saved_data
        assert 'timestamp' in saved_data
        assert 'results' in saved_data
        assert len(saved_data['results']) == 1
    finally:
        if Path(output_path).exists():
            Path(output_path).unlink()


def test_benchmark_result_dataclass():
    """Test BenchmarkResult dataclass"""
    from dataclasses import dataclass

    # Create a benchmark result
    result = BenchmarkResult(
        operation='encode',
        data_size=1024,
        iterations=10,
        avg_time_ms=1.5,
        min_time_ms=1.2,
        max_time_ms=1.8,
        throughput_mb_s=0.67,
        verified=True
    )

    assert result.operation == 'encode'
    assert result.data_size == 1024
    assert result.iterations == 10
    assert result.avg_time_ms == 1.5
    assert result.min_time_ms == 1.2
    assert result.max_time_ms == 1.8
    assert result.throughput_mb_s == 0.67
    assert result.verified is True


def test_benchmark_with_different_modes():
    """Test benchmarking with different encoding modes"""
    runner = BenchmarkRunner()
    test_data = b'\x00' * 1024

    # Test standard mode
    result_standard = runner.benchmark_encode(test_data, mode='standard', iterations=5)
    assert result_standard is not None

    # Test code mode
    result_code = runner.benchmark_encode(test_data, mode='code', iterations=5)
    assert result_code is not None


def test_benchmark_large_data():
    """Test benchmarking with larger data sizes"""
    runner = BenchmarkRunner()
    test_data = b'\x00' * 102400  # 100 KB

    result = runner.benchmark_round_trip(test_data, iterations=3)

    assert result is not None
    assert result.data_size == 102400
    assert result.avg_time_ms > 0


def test_benchmark_result_to_dict():
    """Test BenchmarkResult to_dict conversion"""
    result = BenchmarkResult(
        operation='encode',
        data_size=2048,
        iterations=10,
        avg_time_ms=2.5,
        min_time_ms=2.0,
        max_time_ms=3.0,
        throughput_mb_s=0.82,
        verified=True
    )

    result_dict = result.to_dict()

    assert result_dict['operation'] == 'encode'
    assert result_dict['data_size'] == 2048
    assert result_dict['iterations'] == 10
    assert result_dict['avg_time_ms'] == 2.5
    assert result_dict['min_time_ms'] == 2.0
    assert result_dict['max_time_ms'] == 3.0
    assert result_dict['throughput_mb_s'] == 0.82
    assert result_dict['verified'] is True
