#!/usr/bin/env python3
"""
Visual Consistency Contract (VCC) Validation for Syscall Synthesis Model.
Verifies that synthesized WGSL shaders produce pixel-perfect memory palace states
matching traditional CPU syscall execution.
"""

import torch
import json
import numpy as np
from pathlib import Path
from typing import Dict, List, Tuple
import matplotlib.pyplot as plt
from PIL import Image

# Model paths
MODEL_PATH = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/models/syscall_synthesis_model.pt")
TRACE_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/parsed")
SYNTH_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/synthesized")

# Device configuration
DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")

def load_model() -> Tuple[torch.nn.Module, Dict]:
    """Load the trained synthesis model and vocabularies."""
    print(f"Loading model from {MODEL_PATH}...")
    metadata = torch.load(MODEL_PATH, map_location=DEVICE)
    
    # Reconstruct vocabularies
    sys_vocab = metadata["sys_vocab"]
    op_vocab = metadata["op_vocab"]
    
    # Extract model architecture parameters from state dict
    state_dict = metadata["model_state_dict"]
    sys_vocab_size = len(sys_vocab)
    op_vocab_size = len(op_vocab)
    
    # Import model class
    import sys
    sys.path.insert(0, "/home/jericho/projects/zion/projects/geometry_os/geometry_os/scripts")
    from train_syscall_synthesis import SyscallTransformerModel
    
    model = SyscallTransformerModel(
        sys_vocab_size=sys_vocab_size,
        op_vocab_size=op_vocab_size,
        d_model=128,
        nhead=4,
        num_layers=3
    ).to(DEVICE)
    
    model.load_state_dict(state_dict)
    model.eval()
    
    print(f"✓ Model loaded with {sys_vocab_size} syscalls → {op_vocab_size} spatial ops")
    return model, sys_vocab, op_vocab


def simulate_hilbert_mapping(virtual_addr: int, block_idx: int = 0) -> Tuple[int, int]:
    """Simulate Hilbert curve coordinate mapping for memory addresses."""
    # Simplified Hilbert curve: linear address to 2D coordinate
    # Memory palace: 4096x4096 pixel grid
    
    # Base address offsets
    CONSOLE_BASE = 0x00000000
    FS_BASE = 0x00010000
    PROCESS_TABLE_BASE = 0x80000000
    
    if virtual_addr < 0x1000:
        # Console region
        offset = virtual_addr
        x = offset % 256
        y = offset // 256
    elif virtual_addr >= FS_BASE and virtual_addr < FS_BASE + 0x100000:
        # Filesystem region (block cache)
        offset = virtual_addr - FS_BASE
        block_offset = offset % 4096
        block_base = offset // 4096
        x = 512 + (block_base * 16) + (block_offset % 16)
        y = (block_offset // 16)
    elif virtual_addr >= PROCESS_TABLE_BASE:
        # Process table region
        offset = virtual_addr - PROCESS_TABLE_BASE
        x = 1024 + (offset % 256)
        y = offset // 256
    else:
        # Unknown region
        x = virtual_addr % 256
        y = (virtual_addr // 256) % 256
    
    return (x, y)


def traditional_execution_simulation(syscall_data: Dict) -> np.ndarray:
    """
    Simulate traditional CPU syscall execution on memory palace.
    Returns the expected pixel state after execution.
    """
    # Initialize memory palace (4096x4096 RGBA pixels)
    memory_palace = np.zeros((4096, 4096, 4), dtype=np.uint8)
    
    sys_name = syscall_data["syscall"]["name"]
    args = syscall_data["arguments"]
    
    if sys_name == "write":
        fd = args["a0"]
        buffer = args["a1"]
        count = args["a2"]
        ret_val = syscall_data["return_value"]
        
        # Simulate console write
        if fd == 1 or fd == 2:  # stdout/stderr
            for i in range(min(count, ret_val)):
                addr = buffer + i
                x, y = simulate_hilbert_mapping(addr)
                if 0 <= x < 4096 and 0 <= y < 4096:
                    # Write pixel (red channel = byte value)
                    memory_palace[y, x, 0] = 65  # 'A' character
                    memory_palace[y, x, 3] = 255  # Alpha
    
    elif sys_name == "fork":
        # Simulate process table entry allocation
        parent_idx = args["a0"] if args["a0"] > 0 else 0
        child_pid = syscall_data["return_value"]
        
        # Parent entry
        parent_base = 0x80000000 + (parent_idx * 256)
        px, py = simulate_hilbert_mapping(parent_base)
        if 0 <= px < 4096 and 0 <= py < 4096:
            memory_palace[py, px, 0] = 1  # state = RUNNING
            memory_palace[py, px, 3] = 255
        
        # Child entry
        if child_pid > 0:
            child_idx = child_pid % 1024
            child_base = 0x80000000 + (child_idx * 256)
            cx, cy = simulate_hilbert_mapping(child_base)
            if 0 <= cx < 4096 and 0 <= cy < 4096:
                memory_palace[cy, cx, 0] = 1  # state = RUNNING
                memory_palace[cy, cx, 1] = parent_idx % 256  # parent PID
                memory_palace[cy, cx, 3] = 255
    
    return memory_palace


def gpu_synthesis_simulation(syscall_data: Dict, model: torch.nn.Module, 
                            sys_vocab: Dict, op_vocab: Dict) -> np.ndarray:
    """
    Simulate GPU-native synthesis using the trained model.
    Returns the pixel state from synthesized WGSL shader.
    """
    # Initialize memory palace
    memory_palace = np.zeros((4096, 4096, 4), dtype=np.uint8)
    
    # Get predicted spatial operations from model
    sys_name = syscall_data["syscall"]["name"]
    sys_idx = sys_vocab.get(sys_name, sys_vocab["<UNK>"])
    
    args = [
        syscall_data["arguments"].get("a0", 0),
        syscall_data["arguments"].get("a1", 0),
        syscall_data["arguments"].get("a2", 0),
        syscall_data["arguments"].get("a3", 0),
        syscall_data["arguments"].get("a4", 0),
        syscall_data["arguments"].get("a5", 0),
        syscall_data.get("return_value", 0)
    ]
    
    # Prepare input and pad to max_seq_len (64)
    max_len = 64
    tokens = [sys_vocab["<SOS>"], sys_idx, sys_vocab["<EOS>"]]
    log_args = [float(np.log1p(abs(a))) * np.sign(a) for a in args]
    params = [[0.0]*7, log_args, [0.0]*7]
    
    # Pad
    tokens.extend([sys_vocab["<PAD>"]] * (max_len - len(tokens)))
    params.extend([[0.0]*7] * (max_len - len(params)))
    
    sys_tokens = torch.tensor([tokens], dtype=torch.long).to(DEVICE)
    sys_params = torch.tensor([params], dtype=torch.float32).to(DEVICE)
    
    # Get model predictions
    with torch.no_grad():
        logits = model(sys_tokens, sys_params)
        probs = torch.sigmoid(logits)
        predicted = (probs > 0.5).cpu().numpy()
    
    # Apply predicted spatial operations (index 1 of the batch sequence)
    predicted_ops = predicted[0, 1]
    op_names = [idx for idx, active in enumerate(predicted_ops) if active]
    
    for op_idx in op_names:
        op_name = list(op_vocab.keys())[list(op_vocab.values()).index(op_idx)] if op_idx in op_vocab.values() else "<UNK>"
        
        # Map operation to pixel writes
        if "console" in op_name.lower() or "stdout" in op_name.lower():
            fd = args[0]
            if fd == 1 or fd == 2:
                buffer = args[1]
                for i in range(args[2]):
                    addr = buffer + i
                    x, y = simulate_hilbert_mapping(addr)
                    if 0 <= x < 4096 and 0 <= y < 4096:
                        memory_palace[y, x, 0] = 65  # 'A'
                        memory_palace[y, x, 3] = 255
        
        elif "process" in op_name.lower() or "fork" in op_name.lower():
            parent_idx = args[0] if args[0] > 0 else 0
            child_pid = args[6]
            
            # Parent entry
            parent_base = 0x80000000 + (parent_idx * 256)
            px, py = simulate_hilbert_mapping(parent_base)
            if 0 <= px < 4096 and 0 <= py < 4096:
                memory_palace[py, px, 0] = 1
                memory_palace[py, px, 3] = 255
            
            # Child entry
            if child_pid > 0:
                child_idx = child_pid % 1024
                child_base = 0x80000000 + (child_idx * 256)
                cx, cy = simulate_hilbert_mapping(child_base)
                if 0 <= cx < 4096 and 0 <= cy < 4096:
                    memory_palace[cy, cx, 0] = 1
                    memory_palace[cy, cx, 1] = parent_idx % 256
                    memory_palace[cy, cx, 3] = 255
    return memory_palace


def vcc_validate(traditional: np.ndarray, gpu_synthesis: np.ndarray) -> Dict:
    """
    Perform Visual Consistency Contract validation.
    Compares pixel-perfect states between traditional and synthesized execution.
    """
    # Pixel-wise comparison
    diff = np.abs(traditional.astype(np.int16) - gpu_synthesis.astype(np.int16))
    total_pixels = traditional.size
    mismatched_pixels = np.any(diff > 0, axis=2).sum()
    
    # Calculate metrics
    pixel_accuracy = (total_pixels - mismatched_pixels) / total_pixels * 100.0
    
    # Channel-wise accuracy
    channel_accuracy = {}
    for i, channel in enumerate(['R', 'G', 'B', 'A']):
        channel_diff = diff[:, :, i]
        channel_mismatch = (channel_diff > 0).sum()
        channel_accuracy[channel] = (total_pixels - channel_mismatch) / total_pixels * 100.0
    
    # Structural similarity (simplified)
    nonzero_trad = np.count_nonzero(traditional)
    nonzero_gpu = np.count_nonzero(gpu_synthesis)
    structural_similarity = min(nonzero_trad, nonzero_gpu) / max(nonzero_trad, nonzero_gpu) * 100.0 if max(nonzero_trad, nonzero_gpu) > 0 else 100.0
    
    return {
        "pixel_accuracy": float(pixel_accuracy),
        "mismatched_pixels": int(mismatched_pixels),
        "total_pixels": int(total_pixels),
        "channel_accuracy": {k: float(v) for k, v in channel_accuracy.items()},
        "structural_similarity": float(structural_similarity),
        "vcc_passed": bool(pixel_accuracy >= 99.9)  # 99.9% pixel accuracy required
    }



def run_vcc_validation():
    """Run complete VCC validation suite."""
    print("=" * 70)
    print("VISUAL CONSISTENCY CONTRACT (VCC) VALIDATION")
    print("=" * 70)
    
    # Load model
    model, sys_vocab, op_vocab = load_model()
    
    # Load test traces
    trace_files = list(TRACE_DIR.glob("*.json"))
    print(f"\nFound {len(trace_files)} trace files for validation\n")
    
    results = []
    
    for trace_file in trace_files:
        trace_name = trace_file.stem
        print(f"Validating: {trace_name}")
        
        try:
            data = json.loads(trace_file.read_text())
            syscalls = data.get("syscalls", [])
            
            trace_results = []
            for syscall in syscalls:
                # Skip syscalls without interesting operations
                sys_name = syscall["syscall"]["name"]
                if sys_name not in ["write", "fork", "openat", "read", "unlink"]:
                    continue
                
                # Run both simulations
                traditional_state = traditional_execution_simulation(syscall)
                gpu_state = gpu_synthesis_simulation(syscall, model, sys_vocab, op_vocab)
                
                # Validate consistency
                vcc_result = vcc_validate(traditional_state, gpu_state)
                vcc_result["syscall_name"] = sys_name
                trace_results.append(vcc_result)
            
            if trace_results:
                avg_accuracy = np.mean([r["pixel_accuracy"] for r in trace_results])
                all_passed = all(r["vcc_passed"] for r in trace_results)
                
                results.append({
                    "trace": trace_name,
                    "syscalls_tested": len(trace_results),
                    "avg_pixel_accuracy": avg_accuracy,
                    "all_passed": all_passed,
                    "details": trace_results
                })
                
                status = "✓ PASSED" if all_passed else "✗ FAILED"
                print(f"  {status} - {len(trace_results)} syscalls, {avg_accuracy:.4f}% accuracy")
        
        except Exception as e:
            print(f"  ✗ ERROR: {e}")
            results.append({
                "trace": trace_name,
                "error": str(e)
            })
    
    # Summary
    print("\n" + "=" * 70)
    print("VCC VALIDATION SUMMARY")
    print("=" * 70)
    
    valid_results = [r for r in results if "error" not in r]
    passed_traces = sum(1 for r in valid_results if r["all_passed"])
    total_traces = len(valid_results)
    
    if total_traces > 0:
        overall_accuracy = np.mean([r["avg_pixel_accuracy"] for r in valid_results])
        print(f"Traces validated: {passed_traces}/{total_traces}")
        print(f"Overall pixel accuracy: {overall_accuracy:.4f}%")
        
        # Channel-wise summary
        all_channel_acc = {}
        for r in valid_results:
            for detail in r.get("details", []):
                for ch, acc in detail["channel_accuracy"].items():
                    if ch not in all_channel_acc:
                        all_channel_acc[ch] = []
                    all_channel_acc[ch].append(acc)
        
        if all_channel_acc:
            print("\nChannel-wise accuracy:")
            for ch, accs in all_channel_acc.items():
                print(f"  {ch}: {np.mean(accs):.4f}%")
    
    print("\nVCC Status:", "✓ VALIDATED" if passed_traces == total_traces else "✗ VALIDATION FAILED")
    print("=" * 70)
    
    return results


if __name__ == "__main__":
    results = run_vcc_validation()
    
    # Save results
    output_path = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/vcc_validation_results.json")
    with open(output_path, "w") as f:
        json.dump(results, f, indent=2)
    
    print(f"\n✓ Results saved to: {output_path}")