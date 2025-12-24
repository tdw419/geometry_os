#!/usr/bin/env python3
"""
Multi-Model GGUF Intelligence Extractor
Extracts intelligence from multiple GGUF models and categorizes them by capability type.
"""

import os
import sys
import json
import time
import numpy as np
from pathlib import Path

# Mock GGUF extraction for demonstration if gguf lib is missing
try:
    import gguf
except ImportError:
    gguf = None

class IntelligenceExtractor:
    def __init__(self, models_dir="/home/jericho/zion/ai/llms/models"):
        self.models_dir = Path(models_dir)
        self.blueprints_dir = Path("blueprints_gguf")
        self.blueprints_dir.mkdir(exist_ok=True)
        
        # Intelligence type mappings
        self.intelligence_types = {
            "coding": ["deepseek", "codestral", "qwen", "coder"],
            "creative": ["llama", "mistral", "phi", "tinyllama"],
            "mathematical": ["qwen", "math", "phi"],
            "general": ["llama", "mistral", "phi", "tinyllama"]
        }
    
    def find_gguf_models(self):
        """Find all GGUF models in the models directory"""
        models = []
        for gguf_file in self.models_dir.rglob("*.gguf"):
            models.append(str(gguf_file))
        return models
    
    def categorize_model(self, model_path):
        """Categorize model by intelligence type based on filename"""
        filename = Path(model_path).name.lower()
        
        for intelligence_type, keywords in self.intelligence_types.items():
            for keyword in keywords:
                if keyword in filename:
                    return intelligence_type
        return "general"
    
    def extract_brain(self, gguf_path, output_name, layers=None, intelligence_type="general"):
        """
        Extracts specific tensors from a GGUF file and packages them into a VectorOS Blueprint.
        """
        print(f"🧠 [Neurosurgeon] Opening GGUF: {gguf_path}")
        print(f"   📊 Intelligence Type: {intelligence_type.upper()}")
        
        blueprint = {
            "id": f"bp_{int(time.time())}",
            "name": output_name,
            "type": f"extracted_brain_{intelligence_type}",
            "intelligence_type": intelligence_type,
            "tensors": {},
            "metadata": {
                "source": os.path.basename(gguf_path),
                "extraction_date": time.ctime(),
                "model_path": gguf_path,
                "layers_extracted": layers or ["all"]
            }
        }
        
        if gguf and os.path.exists(gguf_path):
            reader = gguf.GGUFReader(gguf_path)
            
            tensor_count = 0
            for tensor in reader.tensors:
                if layers and not any(l in tensor.name for l in layers):
                    continue
                
                # Limit extraction to first 5 tensors for demo
                if tensor_count >= 5:
                    break
                    
                print(f"   - Extracting: {tensor.name} {tensor.shape}")
                tensor_count += 1
                
                # Store tensor metadata
                blueprint["tensors"][tensor.name] = {
                    "shape": [int(d) for d in tensor.shape],
                    "dtype": str(tensor.tensor_type),
                    "simulated_data": [0.0] * min(4, len(tensor.shape))  # Truncated for demo
                }
        else:
            print("   ⚠️  GGUF library not found or file missing. Simulating extraction...")
            # Simulation of extracting different types of intelligence
            if intelligence_type == "coding":
                blueprint["tensors"]["code_transformer.weight"] = {
                    "shape": [4096, 4096],
                    "dtype": "float32",
                    "simulated_data": [0.8, -0.2, 0.9, 0.1]
                }
                blueprint["tensors"]["syntax_parser.weight"] = {
                    "shape": [2048, 4096],
                    "dtype": "float32", 
                    "simulated_data": [0.7, 0.3, -0.1, 0.6]
                }
            elif intelligence_type == "creative":
                blueprint["tensors"]["creativity_head.weight"] = {
                    "shape": [4096, 4096],
                    "dtype": "float32",
                    "simulated_data": [0.5, 0.8, -0.3, 0.9]
                }
                blueprint["tensors"]["language_flow.weight"] = {
                    "shape": [2048, 4096],
                    "dtype": "float32",
                    "simulated_data": [0.6, 0.4, 0.7, -0.2]
                }
            elif intelligence_type == "mathematical":
                blueprint["tensors"]["math_processor.weight"] = {
                    "shape": [4096, 4096],
                    "dtype": "float32",
                    "simulated_data": [0.9, 0.1, 0.8, 0.2]
                }
                blueprint["tensors"]["logic_engine.weight"] = {
                    "shape": [2048, 4096],
                    "dtype": "float32",
                    "simulated_data": [0.8, 0.5, 0.9, 0.3]
                }
        
        output_file = self.blueprints_dir / f"{output_name}.json"
        with open(output_file, "w") as f:
            json.dump(blueprint, f, indent=2)
            
        print(f"✨ [Neurosurgeon] Brain extracted to {output_file}")
        return str(output_file)
    
    def extract_all_intelligences(self):
        """Extract intelligence from all available models"""
        models = self.find_gguf_models()
        print(f"🔍 Found {len(models)} GGUF models")
        
        extracted_files = []
        
        for model_path in models:
            intelligence_type = self.categorize_model(model_path)
            model_name = Path(model_path).stem
            output_name = f"{intelligence_type}_{model_name}_Core"
            
            print(f"\n🚀 Extracting {intelligence_type.upper()} intelligence from {model_name}")
            
            try:
                extracted_file = self.extract_brain(
                    model_path, 
                    output_name, 
                    layers=["blk.0", "blk.1"], 
                    intelligence_type=intelligence_type
                )
                extracted_files.append((extracted_file, intelligence_type))
            except Exception as e:
                print(f"   ❌ Failed to extract from {model_path}: {e}")
        
        return extracted_files

def main():
    extractor = IntelligenceExtractor()
    
    print("=== Multi-Model Intelligence Extraction System ===")
    print(f"📁 Models Directory: {extractor.models_dir}")
    print(f"📁 Blueprints Directory: {extractor.blueprints_dir}")
    
    # Extract all intelligences
    extracted_files = extractor.extract_all_intelligences()
    
    print(f"\n=== Extraction Summary ===")
    print(f"✅ Successfully extracted {len(extracted_files)} intelligence blueprints:")
    
    for file_path, intelligence_type in extracted_files:
        print(f"   - {Path(file_path).name} ({intelligence_type.upper()})")
    
    print(f"\n🎯 Next Steps:")
    print(f"   1. Import these blueprints into VectorOS Kernel")
    print(f"   2. Use blueprint blending to create hybrid intelligences")
    print(f"   3. Test kernel performance with multiple intelligences")

if __name__ == "__main__":
    main()