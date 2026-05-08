; DESCRIPTION: This GeOS assembly code draws three colored squares on the screen and uses the AI_AGENT with op=4 to count the distinct objects (the squares). The result is stored in register R0, or set to 0xFFFFFFFF if the vision model is unavailable.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r13, 1              ; increment
LDI r12, 0xFFFFFF       ; white
LDI r6, 20             ; x start
LDI r5, 60             ; x end
LDI r8, 20             ; y start
LDI r11, 60             ; y end

draw_white_y:
  MOV r15, r6           ; x = x_start
  draw_white_x:
    PSET r15, r8, r12
    ADD r15, r13
    CMP r15, r5
    BLT r4, draw_white_x
  ADD r8, r13
  CMP r8, r11
  BLT r4, draw_white_y

; ── Draw red square (middle) ──
LDI r12, 0xFF0000       ; red
LDI r6, 100
LDI r5, 140
LDI r8, 100
LDI r11, 140

draw_red_y:
  MOV r15, r6
  draw_red_x:
    PSET r15, r8, r12
    ADD r15, r13
    CMP r15, r5
    BLT r4, draw_red_x
  ADD r8, r13
  CMP r8, r11
  BLT r4, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r12, 0x00FF00       ; green
LDI r6, 180
LDI r5, 220
LDI r8, 180
LDI r11, 220

draw_green_y:
  MOV r15, r6
  draw_green_x:
    PSET r15, r8, r12
    ADD r15, r13
    CMP r15, r5
    BLT r4, draw_green_x
  ADD r8, r13
  CMP r8, r11
  BLT r4, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r14, 4             ; op=4: specialized perception
LDI r10, 0             ; mode=0: full screen
AI_AGENT r14           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
