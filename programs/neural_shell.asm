; neural_shell.asm -- High-Fidelity Dual Substrate Interface (Phase W)
;
; Layout: 40/60 split.
;   Left (40%): Raw Terminal-Green ASCII (PTY / Kernel Logs)
;   Right (60%): Glassmorphic GUI with Neon Accents (Visual Substrate)
;
; Aesthetic:
;   - Radial Gradient Background (#1a1a2e center, #050508 edges)
;   - Neon Green (#00ff66) and Blue (#00e5ff) accents
;   - Glassmorphic panels with blur simulation

#define SCREEN_W 256
#define SCREEN_H 256
#define SPLIT_X 102

#define COLOR_NEON_GREEN 0x00FF66
#define COLOR_NEON_BLUE 0x00E5FF
#define COLOR_GLASS_BG 0x1A1A2E
#define COLOR_TERMINAL_GREEN 0x33FF33

; Using r25 as LAST_KEY, r26 as CURSOR_Y (no register aliases in #define)

:init
    ; --- Step 1: Draw Radial Gradient Background (One-time) ---
    LDI r1, 0 ; y
:bg_y_loop
    LDI r2, 0 ; x
:bg_x_loop
    MOV r3, r2
    SUBI r3, 128
    MUL r3, r3 ; dx^2
    MOV r4, r1
    SUBI r4, 128
    MUL r4, r4 ; dy^2
    ADD r3, r4 ; d^2
    
    LDI r5, 32768
    SUB r5, r3 ; r5 = inverse distance
    LDI r6, 128
    DIV r5, r6 ; scale
    
    LDI r6, 0x050508
    ADD r6, r5 ; tint blue channel
    PSET r2, r1, r6
    
    ADDI r2, 1
    CMPI r2, SCREEN_W
    JNZ r0, :bg_x_loop
    ADDI r1, 1
    CMPI r1, SCREEN_H
    JNZ r0, :bg_y_loop

    ; --- Step 2: Draw Static UI Elements ---
    ; Vertical split line
    LDI r10, SPLIT_X
    LDI r11, 0
    LDI r12, SPLIT_X
    LDI r13, SCREEN_H
    LDI r14, COLOR_NEON_BLUE
    LINE r10, r11, r12, r13, r14

    ; Glassmorphic GUI Panel (Right) -- outline then fill
    LDI r10, 110 ; Panel X
    LDI r11, 20  ; Panel Y
    LDI r12, 136 ; Panel W
    LDI r13, 216 ; Panel H
    LDI r14, COLOR_NEON_BLUE
    RECT r10, r11, r12, r13, r14
    ADDI r10, 1
    ADDI r11, 1
    SUBI r12, 2
    SUBI r13, 2
    LDI r14, COLOR_GLASS_BG
    RECTF r10, r11, r12, r13, r14

    ; Static Labels
    TEXTI 5, 10, "GEOS KERNEL v2.0"
    TEXTI 5, 20, "PHASE W: ACTIVE"
    TEXTI 115, 30, "SUBSTRATE MAPPING"

    ; Decorative circle
    LDI r10, 178
    LDI r11, 128
    LDI r12, 40
    LDI r13, COLOR_NEON_GREEN
    CIRCLE r10, r11, r12, r13

    LDI r26, 50
    LDI r25, 0

:main_loop
    ; --- Step 3: Input Handling ---
    IKEY r1 ; Read keyboard
    JZ r1, :no_key
    
    ; Check if it's the same key as before (simple debounce)
    CMP r1, r25
    JZ r0, :render_gate
    
    MOV r25, r1
    
    ; Echo key to terminal area
    ; Store key at 0x8000, null terminator at 0x8001, then TEXT from 0x8000
    LDI r2, 0x8000
    STORE r2, r1
    LDI r3, 0
    LDI r2, 0x8001
    STORE r2, r3
    LDI r2, 0x8000
    
    LDI r4, 5 ; X
    TEXT r4, r26, r2
    
    ADDI r26, 10
    
    ; Scroll/Wrap check
    CMPI r26, 240
    JNZ r0, :render_gate
    
    ; Simple "clear" of terminal area on wrap
    LDI r10, 0
    LDI r11, 50
    LDI r12, 100
    LDI r13, 200
    LDI r14, 0x050508
    RECTF r10, r11, r12, r13, r14
    LDI r26, 50 ; Reset cursor
    
:no_key
    LDI r25, 0

:render_gate
    FRAME
    JMP :main_loop
