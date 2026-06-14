import os
import json
import torch
from pathlib import Path
from PIL import Image
from torch.utils.data import Dataset
from unsloth import FastVisionModel
from transformers import TrainingArguments, Trainer
from peft import LoraConfig, get_peft_model, prepare_model_for_kbit_training

# --- CONFIGURATION ---
MODEL_ID = "HiDream-ai/HiDream-O1-Image-Dev"
DATASET_PATH = "hidream_dataset_v1/hidream_dataset.json"
OUTPUT_DIR = "./pixelgpt-hidream-v1"

# QLoRA config
LORA_R = 64
LORA_ALPHA = 128
LORA_DROPOUT = 0.05

# Training config
BATCH_SIZE = 1  # Using Unsloth optimization, might increase later
GRADIENT_ACCUMULATION = 8
LEARNING_RATE = 2e-4
NUM_EPOCHS = 3
SAVE_STEPS = 100

class GeOSDataset(Dataset):
    """Dataset for Geometry OS programs with reasoning chains."""
    
    def __init__(self, dataset_path, processor, max_length=1024):
        self.processor = processor
        self.max_length = max_length
        
        # Load large dataset (handling potential memory issues)
        print(f"Loading dataset from {dataset_path}...")
        with open(dataset_path) as f:
            data = json.load(f)
        
        self.entries = data['entries']
        self.base_path = Path(dataset_path).parent
        print(f"Loaded {len(self.entries)} samples.")
    
    def __len__(self):
        return len(self.entries)
    
    def __getitem__(self, idx):
        entry = self.entries[idx]
        
        # Load image (The Pixel Target)
        img_path = self.base_path / entry['image_path']
        image = Image.open(img_path).convert('RGB')
        
        # Instruction + Reasoning (The Context)
        instruction = entry['instruction']
        reasoning = entry['reasoning']
        
        # HiDream-O1 specific message structure
        # User asks for program -> Model provides reasoning -> Model generates image
        messages = [
            {
                "role": "user",
                "content": [
                    {"type": "text", "text": f"Generate a Geometry OS program: {instruction}"},
                ]
            },
            {
                "role": "assistant",
                "content": [
                    {"type": "text", "text": f"<think>\n{reasoning}\n</think>\n<|vision_start|><|image_pad|><|vision_end|>"}
                ]
            }
        ]
        
        # Apply chat template
        text = self.processor.apply_chat_template(messages, add_generation_prompt=False)
        
        # Process for the model
        inputs = self.processor(
            images=image,
            text=text,
            return_tensors="pt",
            padding="max_length",
            truncation=True,
            max_length=self.max_length
        )
        
        # Squeeze out batch dim
        for k in inputs:
            inputs[k] = inputs[k].squeeze(0)
            
        # We need labels for training
        inputs["labels"] = inputs["input_ids"].clone()
        
        return inputs

def main():
    print(f"Loading {MODEL_ID} with Unsloth...")
    
    # Load model and processor using Unsloth's FastVisionModel
    model, processor = FastVisionModel.from_pretrained(
        model_name = MODEL_ID,
        load_in_4bit = True,
        use_gradient_checkpointing = "unsloth", # Optimize memory
    )

    # Patch model for LoRA
    model = FastVisionModel.get_peft_model(
        model,
        r = LORA_R,
        target_modules = [
            "q_proj", "k_proj", "v_proj", "o_proj",
            "gate_proj", "up_proj", "down_proj",
        ],
        lora_alpha = LORA_ALPHA,
        lora_dropout = LORA_DROPOUT,
        bias = "none",
        random_state = 3407,
        use_rslora = False,
        loftq_config = None,
    )

    # Load dataset
    dataset = GeOSDataset(DATASET_PATH, processor)

    # Training Arguments
    training_args = TrainingArguments(
        output_dir = OUTPUT_DIR,
        per_device_train_batch_size = BATCH_SIZE,
        gradient_accumulation_steps = GRADIENT_ACCUMULATION,
        warmup_steps = 5,
        max_steps = 1000, # Initial target
        learning_rate = LEARNING_RATE,
        fp16 = not torch.cuda.is_bf16_supported(),
        bf16 = torch.cuda.is_bf16_supported(),
        logging_steps = 1,
        optim = "adamw_8bit",
        weight_decay = 0.01,
        lr_scheduler_type = "linear",
        seed = 3407,
        save_steps = SAVE_STEPS,
        report_to = "none", # Disable wandb for now
    )

    # Initialize Trainer
    trainer = Trainer(
        model = model,
        args = training_args,
        train_dataset = dataset,
        # data_collator will be handled by Trainer automatically if dataset returns dict
    )

    print("\nStarting training (The Geometry OS Pixel-Logic Ascension)...")
    trainer.train()

    # Save the adapter
    model.save_pretrained(f"{OUTPUT_DIR}/adapter")
    processor.save_pretrained(f"{OUTPUT_DIR}/adapter")
    print(f"Training finished. Adapter saved to {OUTPUT_DIR}/adapter")

if __name__ == "__main__":
    main()
