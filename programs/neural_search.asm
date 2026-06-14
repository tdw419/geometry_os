; --- NEURAL SEARCH AGENT (v5 Hybrid) ---
; Uses text-mode LLM (0x9C) for headless reliability.

#define PROMPT_RAM 0x5000
#define RESP_RAM   0x6400

LDI r1, 0x1a1a2e
FILL r1

LDI r1, 10
LDI r2, 10
LDI r3, :header_txt
LDI r4, 0x00FF00
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5

LDI r1, 10
LDI r2, 30
LDI r3, :item_0_txt
LDI r4, 0xFFFFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5
LDI r1, 10
LDI r2, 42
LDI r3, :item_1_txt
LDI r4, 0xFFFFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5
LDI r1, 10
LDI r2, 54
LDI r3, :item_2_txt
LDI r4, 0xFFFFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5

; --- Setup Text-Mode LLM call ---
LDI r10, :full_prompt
LDI r11, RESP_RAM
LDI r12, 512
LLM r10, r11, r12

; Draw Response Label
LDI r1, 10
LDI r2, 150
LDI r3, :resp_label
LDI r4, 0x00FFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5

; Draw LLM Response (Multi-line wrap)
LDI r1, 10
LDI r2, 165
LDI r13, RESP_RAM
LDI r14, 0xFFFFFF
LDI r15, 0
DRAWTEXT r1, r2, r13, r14, r15
LDI r2, 177
LDI r12, 42
ADD r13, r12
DRAWTEXT r1, r2, r13, r14, r15

HALT

:header_txt .str "NEURAL REGISTRY SEARCH (HEADLESS)"
:resp_label .str "AI SEARCH RESULT:"
:item_0_txt .str "lsystem.asm: lsystem.asm -- L-System Fractal Generator Int"
:item_1_txt .str "lsystem_tree.asm: lsystem_tree.asm -- L-System Fractal Tree  L-"
:item_2_txt .str "about.asm: about.asm -- System Information Panel for Geo"
:full_prompt .str "Task: Search this registry for 'lsystem'. Return the filename and a reason.\n\nRegistry:\n- lsystem.asm: lsystem.asm -- L-System Fractal Generator Interactive fractal renderer with 5 presets Keys: 1-5 swit...\n- lsystem_tree.asm: lsystem_tree.asm -- L-System Fractal Tree  L-System: F -> FF+[+F-F-F]-[-F+F+F], Axiom: F, 3 iteratio...\n- about.asm: about.asm -- System Information Panel for Geometry OS  Shows: version, opcode count, RAM size, scree..."
