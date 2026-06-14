#!/usr/bin/env python3
"""Debug real openat predictions."""
import torch, json, numpy as np
from pathlib import Path

MODEL_PATH = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/models/syscall_synthesis_model.pt")
TRACE_FILE = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces/parsed/syscalls_cat_init.json")
DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# Load model
metadata = torch.load(MODEL_PATH, map_location=DEVICE)
sys_vocab = metadata["sys_vocab"]
op_vocab = metadata["op_vocab"]
state_dict = metadata["model_state_dict"]

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

idx_to_op = {v: k for k, v in op_vocab.items()}

# Load test trace
data = json.loads(TRACE_FILE.read_text())
syscalls = data["syscalls"]

# Find openat syscalls
openat_calls = [s for s in syscalls if s["syscall"]["name"] == "openat"]

print(f"Found {len(openat_calls)} openat syscalls in {TRACE_FILE.name}\n")

for i, syscall in enumerate(openat_calls[:3]):
    print(f"Syscall {i+1}:")
    print(f"  Arguments: a0={syscall['arguments']['a0']}, a1={syscall['arguments']['a1']}, a2={syscall['arguments']['a2']}")
    print(f"  Return: {syscall['return_value']}")
    print(f"  Ground truth ops: {syscall['semantics']['spatial_ops']}")

    # Predict
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

    max_len = 64
    tokens = [sys_vocab["<SOS>"], sys_idx, sys_vocab["<EOS>"]]
    log_args = [float(np.log1p(abs(a))) * np.sign(a) for a in args]
    params = [[0.0]*7, log_args, [0.0]*7]

    tokens.extend([sys_vocab["<PAD>"]] * (max_len - len(tokens)))
    params.extend([[0.0]*7] * (max_len - len(params)))

    sys_tokens = torch.tensor([tokens], dtype=torch.long).to(DEVICE)
    sys_params = torch.tensor([params], dtype=torch.float32).to(DEVICE)

    with torch.no_grad():
        logits = model(sys_tokens, sys_params)
        probs = torch.sigmoid(logits)
        predicted = (probs > 0.5).cpu().numpy()
        predicted_ops = [idx_to_op[i] for i in range(predicted.shape[2]) if predicted[0, 1, i]]

    # Show top probabilities
    top_probs = probs[0, 1, :].cpu().numpy()
    top_indices = np.argsort(-top_probs)[:5]
    print(f"  Top 5 predicted ops with probs:")
    for idx in top_indices:
        op_name = idx_to_op[idx]
        prob = top_probs[idx]
        print(f"    {op_name}: {prob:.4f}")

    print(f"  Predicted ops (threshold 0.5): {predicted_ops}")
    print(f"  Match: {set(predicted_ops) == set(syscall['semantics']['spatial_ops'])}\n")