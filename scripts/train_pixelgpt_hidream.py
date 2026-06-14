#!/usr/bin/env python3
"""
Fine-tune HiDream-O1-Image on Geometry OS programs.

This script trains the 8B parameter HiDream-O1 model using QLoRA
to generate valid GeOS ASM programs as pixel representations.

Architecture:
- Base: HiDream-O1-Image-Dev (8B, 4-bit quantized)
- Adapter: QLoRA (rank 64) on attention blocks
- Data: hidream_dataset_v1 (100k reasoning chains)
- Output: Fine-tuned model that generates .rts.png bootable containers
"""

import os
import json
import torch
from pathlib import Path
from PIL import Image
from torch.utils.data import Dataset, DataLoader
from transformers import (
    AutoModel, 
    AutoProcessor, 
    BitsAndBytesConfig,
    TrainingArguments,
    Trainer
)
from peft import LoraConfig, get_peft_model, prepare_model_for_kbit_training

# Configuration
MODEL_ID = "HiDream-ai/HiDream-O1-Image-Dev"
DATASET_PATH = "hidream_dataset_v1/hidream_dataset.json"
OUTPUT_DIR = "./pixelgpt-hidream-v1"

# QLoRA config
LORA_R = 64
LORA_ALPHA = 128
LORA_DROPOUT = 0.05

# Training config
BATCH_SIZE = 1  # Start small due to 8B model
GRADIENT_ACCUMULATION = 8
LEARNING_RATE = 2e-4
NUM_EPOCHS = 3
WARMUP_STEPS = 100
SAVE_STEPS = 500


class GeOSDataset(Dataset):
    """Dataset for Geometry OS programs with reasoning chains."""
    
    def __init__(self, dataset_path, processor, max_length=512):
        self.processor = processor
        self.max_length = max_length
        
        with open(dataset_path) as f:
            data = json.load(f)
        
        self.entries = data['entries']
        self.base_path = Path(dataset_path).parent
        
        print(f"Loaded {len(self.entries)} samples from {dataset_path}")
    
    def __len__(self):
        return len(self.entries)
    
    def __getitem__(self, idx):
        entry = self.entries[idx]
        
        # Load image
        img_path = self.base_path / entry['image_path']
        image = Image.open(img_path).convert('RGB')
        
        # Build text prompt with reasoning
        instruction = entry['instruction']
        reasoning = entry['reasoning']
        
        # Format: Instruction + Reasoning -> Image
        text = f"Generate a Geometry OS program: {instruction}\n\nReasoning: {reasoning[:500]}"
        
        # Process for HiDream-O1
        # Note: Actual preprocessing depends on HiDream's custom API
        # This is a placeholder for the standard pattern
        inputs = self.processor(
            text=text,
            images=image,
            return_tensors="pt",
            padding=True,
            truncation=True,
            max_length=self.max_length
        )
        
        # Remove batch dimension added by processor
        inputs = {k: v.squeeze(0) for k, v in inputs.items()}
        
        return inputs


def setup_model():
    """Load and configure HiDream-O1 with QLoRA."""
    print(f"Loading {MODEL_ID}...")
    
    # 4-bit quantization
    bnb_config = BitsAndBytesConfig(
        load_in_4bit=True,
        bnb_4bit_quant_type="nf4",
        bnb_4bit_use_double_quant=True,
        bnb_4bit_compute_dtype=torch.bfloat16
    )
    
    # Load model
    model = AutoModel.from_pretrained(
        MODEL_ID,
        trust_remote_code=True,
        quantization_config=bnb_config,
        device_map="auto",
        torch_dtype=torch.bfloat16
    )
    
    # Prepare for k-bit training
    model = prepare_model_for_kbit_training(model)
    
    # Configure LoRA
    # Target attention blocks in the Unified Transformer
    lora_config = LoraConfig(
        r=LORA_R,
        lora_alpha=LORA_ALPHA,
        target_modules=[
            "q_proj", "v_proj", "k_proj", "o_proj",
            "gate_proj", "up_proj", "down_proj"
        ],
        lora_dropout=LORA_DROPOUT,
        bias="none",
        task_type="CAUSAL_LM"
    )
    
    model = get_peft_model(model, lora_config)
    model.print_trainable_parameters()
    
    return model


def train():
    """Main training loop."""
    # Setup
    model = setup_model()
    processor = AutoProcessor.from_pretrained(MODEL_ID, trust_remote_code=True)
    
    # Load dataset
    dataset = GeOSDataset(DATASET_PATH, processor)
    
    # Training arguments
    training_args = TrainingArguments(
        output_dir=OUTPUT_DIR,
        per_device_train_batch_size=BATCH_SIZE,
        gradient_accumulation_steps=GRADIENT_ACCUMULATION,
        learning_rate=LEARNING_RATE,
        num_train_epochs=NUM_EPOCHS,
        warmup_steps=WARMUP_STEPS,
        logging_steps=10,
        save_steps=SAVE_STEPS,
        save_total_limit=3,
        bf16=True,
        optim="paged_adamw_8bit",
        report_to="none",
        remove_unused_columns=False,
        dataloader_num_workers=2
    )
    
    # Trainer
    trainer = Trainer(
        model=model,
        args=training_args,
        train_dataset=dataset,
        data_collator=lambda x: x  # Custom collator needed for multimodal
    )
    
    # Train
    print("\nStarting training...")
    trainer.train()
    
    # Save final model
    model.save_pretrained(f"{OUTPUT_DIR}/final")
    processor.save_pretrained(f"{OUTPUT_DIR}/final")
    
    print(f"\nTraining complete! Model saved to {OUTPUT_DIR}/final")


def verify_installation():
    """Check that all dependencies are available."""
    try:
        import torch
        import transformers
        import peft
        import bitsandbytes
        from PIL import Image
        
        print("✓ All dependencies available")
        print(f"  PyTorch: {torch.__version__}")
        print(f"  Transformers: {transformers.__version__}")
        print(f"  CUDA available: {torch.cuda.is_available()}")
        
        if torch.cuda.is_available():
            print(f"  GPU: {torch.cuda.get_device_name(0)}")
            print(f"  VRAM: {torch.cuda.get_device_properties(0).total_memory / 1e9:.1f} GB")
        
        return True
    except ImportError as e:
        print(f"✗ Missing dependency: {e}")
        return False


if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser()
    parser.add_argument("--verify", action="store_true", help="Check installation")
    parser.add_argument("--dry-run", action="store_true", help="Load model without training")
    
    args = parser.parse_args()
    
    if args.verify:
        verify_installation()
    elif args.dry_run:
        if verify_installation():
            model = setup_model()
            print("\nModel loaded successfully for dry run")
    else:
        if verify_installation():
            train()
