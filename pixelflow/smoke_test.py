#!/usr/bin/env python3
import os
import sys
import torch
import subprocess
from pathlib import Path

# Add current dir to path
sys.path.insert(0, os.path.dirname(__file__))
from bilingual_tokenizer import BilingualTokenizer
from train_opcode_llm import OpcodeGPT, generate_asm
from constrained_decoder import generate_constrained

PROMPTS = [
    ("; DESCRIPTION: Draws a red circle at the center of the screen (128, 128) with radius 50.", ["CIRCLE"]),
    ("; DESCRIPTION: Fills the entire 256x256 screen with solid blue color (0x0000FF).", ["FILL", "RECTF"]),
    ("; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).", ["RECTF"]),
    ("; DESCRIPTION: Draws a white diagonal line from the top-left (0, 0) to the bottom-right (255, 255).", ["LINE"]),
    ("; DESCRIPTION: Clears the screen to black and then halts.", ["HALT"]),
    ("; DESCRIPTION: Draws a yellow square at (100, 100) with side length 40.", ["RECTF"]),
    ("; DESCRIPTION: A simple program that loads 10 into r1 and decrements it in a loop until it reaches 0.", ["JNZ", "SUB"]),
    ("; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.", ["LOOP", "RECTF", "JNZ"]),
    ("; DESCRIPTION: Draws a horizontal red line across the middle of the screen.", ["LINE"]),
    ("; DESCRIPTION: Fills the screen with a vertical gradient from black to white.", ["LOOP", "PSET"])
]

def run_vm(asm_path, ppm_path):
    # Run VM in CLI mode and pipe commands
    cmd = f'printf "load {asm_path}\\nrun\\nppm {ppm_path}\\nquit\\n" | ./target/debug/geometry_os --cli'
    process = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    return stdout.decode(), stderr.decode()

def main():
    checkpoint_path = "pixelflow/bilingual_llm_v8_ckpt.pt"
    tokenizer_path = "pixelflow/bilingual_tokenizer_v4"

    output_dir = Path("pixelflow/smoke_results")
    output_dir.mkdir(exist_ok=True)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"[*] Device: {device}")

    tokenizer = BilingualTokenizer.load(tokenizer_path)
    checkpoint = torch.load(checkpoint_path, map_location=device)
    m_args = checkpoint["args"]
    
    model = OpcodeGPT(
        vocab_size=m_args["vocab_size"],
        n_embd=m_args["embd"],
        n_head=m_args["heads"],
        n_layer=m_args["layers"],
        block_size=m_args["context_len"]
    ).to(device)
    
    model.load_state_dict(checkpoint["model"])
    model.eval()
    print(f"[*] Model loaded: {model.param_count():,} parameters")

    report = []

    for i, (prompt, keywords) in enumerate(PROMPTS):
        print(f"\n[Prompt {i+1}] {prompt}")
        generated = generate_constrained(model, tokenizer, prompt, device, max_tokens=256, temperature=0.7)
        
        asm_file = output_dir / f"test_{i+1}.asm"
        ppm_file = output_dir / f"test_{i+1}.ppm"
        
        with open(asm_file, "w") as f:
            f.write(generated)
        
        # Run in VM
        stdout, stderr = run_vm(asm_file, ppm_file)
        
        syntax_ok = "requires" not in stdout and "Unknown opcode" not in stdout and "Error" not in stdout and "undefined" not in stdout
        vm_success = False
        non_black_ratio = 0.0
        
        if ppm_file.exists() and ppm_file.stat().st_size > 100:
            try:
                with open(ppm_file, 'rb') as pf:
                    pf.readline() # P6
                    pf.readline() # dims
                    pf.readline() # maxval
                    data = pf.read()
                
                total_pixels = len(data) // 3
                if total_pixels > 0:
                    non_black = sum(1 for j in range(0, len(data), 3) if data[j:j+3] != b'\x00\x00\x00')
                    non_black_ratio = non_black / total_pixels
                    vm_success = non_black > 0
            except Exception as e:
                pass

        # Final status
        status = "PASSED" if (syntax_ok and vm_success) else "FAILED"
        
        reasons = []
        if not syntax_ok: reasons.append("SYNTAX ERROR")
        if not vm_success: reasons.append("NO VISUAL OUTPUT")
        
        if reasons:
            status += " (" + ", ".join(reasons) + ")"
            
        print(f"  Result: {status} [Visual Output: {non_black_ratio:.2%}]")
        
        report.append({
            "prompt": prompt,
            "asm": generated,
            "success": status.startswith("PASSED"),
            "status": status,
            "ppm": str(ppm_file)
        })

    # Save summary
    with open(output_dir / "report.md", "w") as f:
        f.write("# PixelGPT V8 Smoke Test Report\n\n")
        f.write(f"Checkpoint: {checkpoint_path}\n")
        f.write(f"Epoch: {checkpoint['epoch']}, Loss: {checkpoint['loss']:.4f}\n\n")
        for i, item in enumerate(report):
            status = "✅" if item["success"] else "❌"
            f.write(f"## {i+1}. {item['prompt']}\n")
            f.write(f"Status: {status} ({item['status']})\n\n")
            f.write("### Generated Assembly:\n```\n")
            f.write(item["asm"])
            f.write("\n```\n\n")

    print(f"\n[*] Smoke test complete. Report saved to {output_dir}/report.md")

if __name__ == "__main__":
    main()
