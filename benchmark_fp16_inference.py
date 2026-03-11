#!/usr/bin/env python3
"""
FP16 GPU Inference Performance Benchmark
"""

import sys
import time
import numpy as np
import torch
from transformers import GPTNeoForCausalLM, GPT2Tokenizer

sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os')
from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

def benchmark_gpu(pipeline, tokens, num_runs=5, max_tokens=20):
    """Benchmark GPU generation."""
    times = []

    # Warmup
    _ = pipeline.generate(tokens, max_tokens=5)

    for _ in range(num_runs):
        start = time.perf_counter()
        _ = pipeline.generate(tokens, max_tokens=max_tokens)
        end = time.perf_counter()
        times.append(end - start)

    return np.mean(times), np.std(times), times

def benchmark_hf(model, tokens_tensor, num_runs=5, max_tokens=20):
    """Benchmark HF generation."""
    times = []

    # Warmup
    with torch.no_grad():
        _ = model.generate(tokens_tensor, max_new_tokens=5, do_sample=False, pad_token_id=50256)

    for _ in range(num_runs):
        start = time.perf_counter()
        with torch.no_grad():
            _ = model.generate(tokens_tensor, max_new_tokens=max_tokens, do_sample=False, pad_token_id=50256)
        end = time.perf_counter()
        times.append(end - start)

    return np.mean(times), np.std(times), times

def main():
    print("=" * 60)
    print("FP16 GPU Inference Benchmark")
    print("=" * 60)

    # Load models
    print("\nLoading models...")
    model_id = "EleutherAI/gpt-neo-125M"
    model = GPTNeoForCausalLM.from_pretrained(model_id)
    tokenizer = GPT2Tokenizer.from_pretrained(model_id)
    model.eval()

    pipeline = PixelBrainPipeline("gpt_neo_125m_brain_fp16.rts.png")

    # Test configurations
    configs = [
        ("Short prompt (1 token)", "Hello", 20),
        ("Medium prompt (4 tokens)", "Once upon a time", 20),
        ("Longer prompt (10 tokens)", "The quick brown fox jumps over the lazy", 20),
    ]

    print(f"\n{'Config':<35} {'GPU (ms)':<12} {'HF (ms)':<12} {'Speedup':<10}")
    print("-" * 70)

    for name, prompt, max_tokens in configs:
        tokens = tokenizer.encode(prompt)
        tokens_tensor = torch.tensor([tokens])

        gpu_mean, gpu_std, _ = benchmark_gpu(pipeline, tokens, num_runs=3, max_tokens=max_tokens)
        hf_mean, hf_std, _ = benchmark_hf(model, tokens_tensor, num_runs=3, max_tokens=max_tokens)

        speedup = hf_mean / gpu_mean
        print(f"{name:<35} {gpu_mean*1000:>8.1f}±{gpu_std*1000:.1f} {hf_mean*1000:>8.1f}±{hf_std*1000:.1f} {speedup:>6.2f}x")

    # Tokens per second
    print("\n" + "=" * 60)
    print("Throughput Analysis")
    print("=" * 60)

    prompt = "Hello world"
    tokens = tokenizer.encode(prompt)
    max_tokens = 50

    gpu_mean, _, _ = benchmark_gpu(pipeline, tokens, num_runs=3, max_tokens=max_tokens)
    hf_mean, _, _ = benchmark_hf(model, torch.tensor([tokens]), num_runs=3, max_tokens=max_tokens)

    total_tokens = len(tokens) + max_tokens
    gpu_tps = total_tokens / gpu_mean
    hf_tps = total_tokens / hf_mean

    print(f"Generated {max_tokens} new tokens from {len(tokens)} prompt tokens")
    print(f"GPU: {gpu_tps:.1f} tokens/sec")
    print(f"HF:  {hf_tps:.1f} tokens/sec")
    print(f"Speedup: {hf_mean/gpu_mean:.2f}x")

    # Memory usage
    print("\n" + "=" * 60)
    print("Memory Usage")
    print("=" * 60)

    # Get GPU memory from pipeline
    if hasattr(pipeline, 'atlas'):
        atlas_mb = pipeline.atlas.nbytes / (1024 * 1024)
        print(f"Atlas texture: {atlas_mb:.1f} MB")

    # Get HF model size
    hf_params = sum(p.numel() for p in model.parameters())
    hf_mb = hf_params * 2 / (1024 * 1024)  # FP16
    print(f"HF model (FP16 equiv): {hf_mb:.1f} MB")

if __name__ == "__main__":
    main()
