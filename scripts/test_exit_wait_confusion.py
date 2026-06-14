#!/usr/bin/env python3
"""Check wait vs exit spatial ops confusion."""
import torch, json, numpy as np
from pathlib import Path

MODEL_PATH = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/models/syscall_synthesis_model.pt")
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

def predict(sys_name, args, ret):
    """Predict spatial ops for a syscall."""
    sys_idx = sys_vocab.get(sys_name, sys_vocab["<UNK>"])

    all_args = args + [ret]
    max_len = 64
    tokens = [sys_vocab["<SOS>"], sys_idx, sys_vocab["<EOS>"]]
    log_args = [float(np.log1p(abs(a))) * np.sign(a) for a in all_args]
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

    return probs[0, 1, :].cpu().numpy(), predicted_ops

# Test exit
print("Testing exit (should predict free_user_memory):")
probs, ops = predict("exit", [0, 0, 0, 0, 0, 0], 0)
print(f"  Predicted ops: {ops}")
print(f"  free_user_memory prob: {probs[op_vocab['free_user_memory']]:.4f}")
print(f"  scan_process_table_pixels prob: {probs[op_vocab['scan_process_table_pixels']]:.4f}")

# Test wait
print("\nTesting wait (should predict scan_process_table_pixels):")
probs, ops = predict("wait", [1000, 0, 0, 0, 0, 0], 1234)
print(f"  Predicted ops: {ops}")
print(f"  free_user_memory prob: {probs[op_vocab['free_user_memory']]:.4f}")
print(f"  scan_process_table_pixels prob: {probs[op_vocab['scan_process_table_pixels']]:.4f}")