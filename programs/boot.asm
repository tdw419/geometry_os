; --- GEOMETRY OS INTELLIGENT BOOT (v1) ---
; Self-Indexing Cognitive Entry Point

LDI r1, 0x050508
FILL r1

LDI r1, 10
LDI r2, 10
LDI r3, :title_txt
LDI r4, 0x00FFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5

LDI r1, 10
LDI r2, 30
LDI r3, :stats_txt
LDI r4, 0xFFFFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5
LDI r1, 10
LDI r2, 42
LDI r3, :density_txt
LDI r4, 0x00FF00
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5

LDI r1, 10
LDI r2, 60
LDI r3, :summary_label
LDI r4, 0xAAAAAA
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5
LDI r1, 10
LDI r2, 72
LDI r3, :summary_txt
LDI r4, 0xFFFFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5

LDI r1, 10
LDI r2, 100
LDI r3, :launch_txt
LDI r4, 0x00FFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5
LDI r1, 15
LDI r2, 115
LDI r3, :opt1
LDI r4, 0xFFFFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5
LDI r1, 15
LDI r2, 127
LDI r3, :opt2
LDI r4, 0xFFFFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5
LDI r1, 15
LDI r2, 139
LDI r3, :opt3
LDI r4, 0xFFFFFF
LDI r5, 0
DRAWTEXT r1, r2, r3, r4, r5

:input_loop
FRAME
IKEY r10
CMPI r10, 115
JZ r0, :start_search
CMPI r10, 116
JZ r0, :start_term
CMPI r10, 114
JZ r0, :start_reg
JMP :input_loop

:start_search
LDI r1, :search_path
CHAIN r1
HALT

:start_term
LDI r1, :term_path
CHAIN r1
HALT

:start_reg
LDI r1, :reg_path
CHAIN r1
HALT

:title_txt .str "GEOMETRY OS: INTELLIGENT BOOT"
:stats_txt .str "SYSTEM: 239 Programs Indexed"
:density_txt .str "STORAGE DENSITY: 13.6 BPP"
:summary_label .str "SEMANTIC LANDSCAPE:"
:summary_txt .str "Utility: 239..."
:launch_txt .str "INTENT-BASED LAUNCH:"
:opt1 .str "[S] SEARCH - Neural Discovery"
:opt2 .str "[T] TOOLS  - System Utilities"
:opt3 .str "[R] REGISTRY - Visual Index"
:search_path .str "programs/neural_search.asm"
:term_path .str "programs/hermes_term.asm"
:reg_path .str "programs/hello.asm" ; Placeholder for registry browser
