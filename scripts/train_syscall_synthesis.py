#!/usr/bin/env python3
"""
Syscall Synthesis Model Training Pipeline for Geometry OS.
Aggregates XV6 syscall traces, defines a Transformer Seq2Seq architecture,
and trains the model to map syscall sequences to spatial operations and WGSL shader parameters.
"""

import os
import json
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import Dataset, DataLoader
from pathlib import Path
import numpy as np
from typing import Dict, List, Tuple, Any

# Device configuration
DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")
MODEL_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/models")
MODEL_DIR.mkdir(parents=True, exist_ok=True)
MODEL_PATH = MODEL_DIR / "syscall_synthesis_model.pt"
DATA_DIR = Path("/home/jericho/projects/zion/projects/geometry_os/geometry_os/traces")
# Combine both parsed (real) and synthetic traces
TRACE_DIRS = [DATA_DIR / "parsed", DATA_DIR / "synthetic"]

class SyscallVocab:
    def __init__(self):
        self.sys_to_idx = {"<PAD>": 0, "<UNK>": 1, "<SOS>": 2, "<EOS>": 3}
        self.idx_to_sys = {0: "<PAD>", 1: "<UNK>", 2: "<SOS>", 3: "<EOS>"}
        self.op_to_idx = {"<PAD>": 0, "<UNK>": 1, "<SOS>": 2, "<EOS>": 3}
        self.idx_to_op = {0: "<PAD>", 1: "<UNK>", 2: "<SOS>", 3: "<EOS>"}

    def add_syscall(self, name: str):
        if name not in self.sys_to_idx:
            idx = len(self.sys_to_idx)
            self.sys_to_idx[name] = idx
            self.idx_to_sys[idx] = name

    def add_spatial_op(self, name: str):
        if name not in self.op_to_idx:
            idx = len(self.op_to_idx)
            self.op_to_idx[name] = idx
            self.idx_to_op[idx] = name

class SyscallTraceDataset(Dataset):
    def __init__(self, data_dir: Path, vocab: SyscallVocab, max_seq_len: int = 128):
        self.vocab = vocab
        self.max_seq_len = max_seq_len
        self.samples = []
        
        # Load all parsed JSON trace files
        json_files = []
        for trace_dir in TRACE_DIRS:
            json_files.extend(list(trace_dir.glob("*.json")))
        print(f"Loading {len(json_files)} trace files from {TRACE_DIRS}...")
        
        # First pass: Build vocabularies
        for jf in json_files:
            try:
                data = json.loads(jf.read_text())
                for item in data.get("syscalls", []):
                    sys_name = item["syscall"]["name"]
                    self.vocab.add_syscall(sys_name)
                    semantics = item.get("semantics", {})
                    for op in semantics.get("spatial_ops", []):
                        self.vocab.add_spatial_op(op)
            except Exception as e:
                print(f"Error reading {jf}: {e}")
                
        print(f"Syscall Vocab Size: {len(self.vocab.sys_to_idx)}")
        print(f"Spatial Op Vocab Size: {len(self.vocab.op_to_idx)}")
        
        # Second pass: Build sequences
        for jf in json_files:
            try:
                data = json.loads(jf.read_text())
                syscalls = data.get("syscalls", [])
                
                # We chunk long traces into segments of max_seq_len
                for i in range(0, len(syscalls), max_seq_len):
                    chunk = syscalls[i:i+max_seq_len]
                    if not chunk:
                        continue
                        
                    input_seq = []
                    target_seq = []
                    
                    for item in chunk:
                        sys_name = item["syscall"]["name"]
                        sys_idx = self.vocab.sys_to_idx.get(sys_name, 1)
                        
                        # Arguments a0-a5, return value (log normalized or mapped)
                        args = [
                            item["arguments"].get("a0", 0),
                            item["arguments"].get("a1", 0),
                            item["arguments"].get("a2", 0),
                            item["arguments"].get("a3", 0),
                            item["arguments"].get("a4", 0),
                            item["arguments"].get("a5", 0),
                            item.get("return_value", 0)
                        ]
                        # Create token representation
                        input_seq.append((sys_idx, args))
                        
                        # Get target spatial ops
                        semantics = item.get("semantics", {})
                        op_indices = [self.vocab.op_to_idx.get(op, 1) for op in semantics.get("spatial_ops", [])]
                        target_seq.append(op_indices)
                        
                    self.samples.append((input_seq, target_seq))
            except Exception as e:
                print(f"Error parsing trace chunk for {jf}: {e}")
                
        print(f"Created {len(self.samples)} sample segments for training.")

    def __len__(self):
        return len(self.samples)

    def __getitem__(self, idx) -> Tuple[torch.Tensor, torch.Tensor, torch.Tensor, torch.Tensor]:
        input_seq, target_seq = self.samples[idx]
        
        # Format inputs: [SeqLen] tokens for syscalls, and [SeqLen, 7] for parameters
        sys_tokens = [self.vocab.sys_to_idx["<SOS>"]]
        sys_params = [[0.0]*7]
        
        for sys_idx, args in input_seq:
            sys_tokens.append(sys_idx)
            # Log transform args to keep scale manageable
            log_args = [float(np.log1p(abs(a))) * np.sign(a) for a in args]
            sys_params.append(log_args)
            
        sys_tokens.append(self.vocab.sys_to_idx["<EOS>"])
        sys_params.append([0.0]*7)
        
        # Pad inputs
        sys_tokens = sys_tokens[:self.max_seq_len]
        sys_params = sys_params[:self.max_seq_len]
        padding_len = self.max_seq_len - len(sys_tokens)
        
        sys_tokens.extend([self.vocab.sys_to_idx["<PAD>"]] * padding_len)
        sys_params.extend([[0.0]*7] * padding_len)
        
        # Target representation: Multi-label classification for spatial ops at each time step
        # [SeqLen, OpVocabSize]
        targets = np.zeros((self.max_seq_len, len(self.vocab.op_to_idx)), dtype=np.float32)
        for t_idx, op_indices in enumerate(target_seq[:self.max_seq_len - 2]):
            # Shift by 1 to align with sys_tokens start token
            actual_idx = t_idx + 1
            if actual_idx < self.max_seq_len:
                for op_idx in op_indices:
                    targets[actual_idx, op_idx] = 1.0
                    
        return (
            torch.tensor(sys_tokens, dtype=torch.long),
            torch.tensor(sys_params, dtype=torch.float32),
            torch.tensor(targets, dtype=torch.float32)
        )


class SyscallTransformerModel(nn.Module):
    """
    Transformer-based sequence tagger mapping XV6 syscall traces to Spatial operations.
    """
    def __init__(self, sys_vocab_size: int, op_vocab_size: int, d_model: int = 64, nhead: int = 4, num_layers: int = 2):
        super().__init__()
        self.sys_embedding = nn.Embedding(sys_vocab_size, d_model)
        self.param_projection = nn.Linear(7, d_model)
        self.combiner = nn.Linear(d_model * 2, d_model)
        
        encoder_layer = nn.TransformerEncoderLayer(
            d_model=d_model, 
            nhead=nhead, 
            dim_feedforward=d_model * 4, 
            dropout=0.1, 
            batch_first=True
        )
        self.transformer = nn.TransformerEncoder(encoder_layer, num_layers=num_layers)
        self.classifier = nn.Linear(d_model, op_vocab_size)

    def forward(self, sys_tokens: torch.Tensor, sys_params: torch.Tensor) -> torch.Tensor:
        # sys_tokens shape: [Batch, SeqLen]
        # sys_params shape: [Batch, SeqLen, 7]
        
        sys_emb = self.sys_embedding(sys_tokens) # [Batch, SeqLen, d_model]
        param_proj = self.param_projection(sys_params) # [Batch, SeqLen, d_model]
        
        combined = torch.cat([sys_emb, param_proj], dim=-1) # [Batch, SeqLen, d_model * 2]
        x = self.combiner(combined) # [Batch, SeqLen, d_model]
        
        features = self.transformer(x) # [Batch, SeqLen, d_model]
        logits = self.classifier(features) # [Batch, SeqLen, op_vocab_size]
        
        return logits


def train_model():
    vocab = SyscallVocab()
    dataset = SyscallTraceDataset(DATA_DIR, vocab, max_seq_len=64)
    dataloader = DataLoader(dataset, batch_size=4, shuffle=True)
    
    model = SyscallTransformerModel(
        sys_vocab_size=len(vocab.sys_to_idx),
        op_vocab_size=len(vocab.op_to_idx),
        d_model=128,
        nhead=4,
        num_layers=3
    ).to(DEVICE)
    
    criterion = nn.BCEWithLogitsLoss()
    optimizer = optim.AdamW(model.parameters(), lr=1e-3, weight_decay=1e-4)
    
    print("\nStarting training loop...")
    model.train()
    
    epochs = 20
    for epoch in range(1, epochs + 1):
        epoch_loss = 0.0
        correct_predictions = 0
        total_elements = 0
        
        for sys_tokens, sys_params, targets in dataloader:
            sys_tokens = sys_tokens.to(DEVICE)
            sys_params = sys_params.to(DEVICE)
            targets = targets.to(DEVICE)
            
            optimizer.zero_grad()
            logits = model(sys_tokens, sys_params)
            
            loss = criterion(logits, targets)
            loss.backward()
            optimizer.step()
            
            epoch_loss += loss.item() * sys_tokens.size(0)
            
            # Compute accuracy thresholded at 0.5
            preds = (torch.sigmoid(logits) > 0.5).float()
            correct_predictions += (preds == targets).sum().item()
            total_elements += targets.numel()
            
        epoch_loss /= len(dataset)
        accuracy = (correct_predictions / total_elements) * 100.0
        
        if epoch % 2 == 0 or epoch == 1:
            print(f"Epoch {epoch:02d}/{epochs} - Loss: {epoch_loss:.4f} - Accuracy: {accuracy:.2f}%")
            
    # Save model and vocab metadata
    metadata = {
        "sys_vocab": vocab.sys_to_idx,
        "op_vocab": vocab.op_to_idx,
        "model_state_dict": model.state_dict()
    }
    torch.save(metadata, MODEL_PATH)
    print(f"\n✓ Model successfully trained and saved to: {MODEL_PATH}")


if __name__ == "__main__":
    train_model()
