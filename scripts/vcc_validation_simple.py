#!/usr/bin/env python3
"""
Simplified VCC validation focusing on syscall → spatial op mapping correctness.
"""

import torch
import json
import numpy as np
from pathlib import Path

MODEL_PATH = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/models/syscall_synthesis_model.pt")
TRACE_DIRS = [Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/parsed"),
              Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/synthetic")]

DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")


def load_model():
    """Load model and vocabularies."""
    metadata = torch.load(MODEL_PATH, map_location=DEVICE)
    
    sys_vocab = metadata["sys_vocab"]
    op_vocab = metadata["op_vocab"]
    state_dict = metadata["model_state_dict"]
    
    # Import model
    import sys
    sys.path.insert(0, "/home/jericho/projects/zion/projects/geometry_os/geometry_os/scripts")
    from train_syscall_synthesis import SyscallTransformerModel
    
    model = SyscallTransformerModel(
        sys_vocab_size=len(sys_vocab),
        op_vocab_size=len(op_vocab),
        d_model=128,
        nhead=4,
        num_layers=3
    ).to(DEVICE)
    
    model.load_state_dict(state_dict)
    model.eval()
    
    return model, sys_vocab, op_vocab


def predict_spatial_ops(syscall, model, sys_vocab, op_vocab):
    """Predict spatial operations for a single syscall."""
    sys_name = syscall["syscall"]["name"]
    sys_idx = sys_vocab.get(sys_name, sys_vocab["<UNK>"])
    
    args = [
        syscall["arguments"].get("a0", 0),
        syscall["arguments"].get("a1", 0),
        syscall["arguments"].get("a2", 0),
        syscall["arguments"].get("a3", 0),
        syscall["arguments"].get("a4", 0),
        syscall["arguments"].get("a5", 0),
        syscall.get("return_value", 0)
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
    
    # Predict
    with torch.no_grad():
        logits = model(sys_tokens, sys_params)
        probs = torch.sigmoid(logits)
        predicted = (probs > 0.5).cpu().numpy()
    
    # Extract predicted ops (at index 1 where the actual syscall resides)
    idx_to_op = {v: k for k, v in op_vocab.items()}
    predicted_ops = [idx_to_op[i] for i in range(predicted.shape[2]) if predicted[0, 1, i]]

    
    # Get ground truth from semantics
    semantics = syscall.get("semantics", {})
    ground_truth = semantics.get("spatial_ops", [])
    
    return predicted_ops, ground_truth


def run_validation():
    """Run VCC validation on syscall → spatial op mapping."""
    print("=" * 70)
    print("VCC VALIDATION: Syscall → Spatial Operation Mapping")
    print("=" * 70)
    
    model, sys_vocab, op_vocab = load_model()
    
    trace_files = []
    for trace_dir in TRACE_DIRS:
        trace_files.extend(list(trace_dir.glob("*.json")))
    print(f"\nValidating {len(trace_files)} trace files...\n")
    
    results = []
    total_correct = 0
    total_predictions = 0
    
    for trace_file in trace_files:
        trace_name = trace_file.stem
        print(f"{trace_name}:")
        
        try:
            data = json.loads(trace_file.read_text())
            syscalls = data.get("syscalls", [])
            
            trace_correct = 0
            trace_total = 0
            
            for syscall in syscalls:
                predicted, ground_truth = predict_spatial_ops(syscall, model, sys_vocab, op_vocab)
                
                # Calculate accuracy
                if len(ground_truth) > 0:
                    # Convert to sets for comparison
                    pred_set = set(predicted)
                    truth_set = set(ground_truth)
                    
                    # True positives, false positives, false negatives
                    tp = len(pred_set & truth_set)
                    fp = len(pred_set - truth_set)
                    fn = len(truth_set - pred_set)
                    
                    # Accuracy
                    if len(truth_set) > 0:
                        accuracy = tp / len(truth_set)
                    else:
                        accuracy = 1.0 if len(pred_set) == 0 else 0.0
                    
                    trace_correct += accuracy
                    trace_total += 1
                    
                    results.append({
                        "trace": trace_name,
                        "syscall": syscall["syscall"]["name"],
                        "predicted": predicted,
                        "ground_truth": ground_truth,
                        "accuracy": accuracy,
                        "tp": tp,
                        "fp": fp,
                        "fn": fn
                    })
            
            if trace_total > 0:
                avg_acc = trace_correct / trace_total * 100
                print(f"  {trace_total} syscalls, avg accuracy: {avg_acc:.2f}%")
                total_correct += trace_correct
                total_predictions += trace_total
        
        except Exception as e:
            print(f"  ERROR: {e}")
    
    # Overall summary
    print("\n" + "=" * 70)
    print("VCC VALIDATION SUMMARY")
    print("=" * 70)
    
    if total_predictions > 0:
        overall_accuracy = total_correct / total_predictions * 100
        print(f"Total syscalls validated: {total_predictions}")
        print(f"Overall mapping accuracy: {overall_accuracy:.2f}%")
        
        # Per-syscall breakdown
        syscall_stats = {}
        for r in results:
            name = r["syscall"]
            if name not in syscall_stats:
                syscall_stats[name] = {"correct": 0, "total": 0}
            syscall_stats[name]["correct"] += r["accuracy"]
            syscall_stats[name]["total"] += 1
        
        print("\nPer-syscall accuracy:")
        for name, stats in sorted(syscall_stats.items()):
            avg = stats["correct"] / stats["total"] * 100
            print(f"  {name:15s}: {avg:5.2f}% ({stats['total']} calls)")
    
    # VCC threshold: 95% accuracy required
    vcc_passed = overall_accuracy >= 95.0 if total_predictions > 0 else False
    print(f"\nVCC Status: {'✓ PASSED' if vcc_passed else '✗ FAILED'} (threshold: 95%)")
    print("=" * 70)
    
    return results, vcc_passed


if __name__ == "__main__":
    results, passed = run_validation()
    
    # Save results
    output = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/vcc_validation_results.json")
    with open(output, "w") as f:
        json.dump(results, f, indent=2)
    
    print(f"\n✓ Results saved to: {output}")