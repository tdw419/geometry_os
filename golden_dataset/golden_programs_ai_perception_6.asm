; DESCRIPTION: Geometry OS program to draw a red square.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r8, 1              ; increment
LDI r6, 0xFFFFFF       ; white
LDI r10, 20             ; x start
LDI r11, 60             ; x end
LDI r13, 20             ; y start
LDI r2, 60             ; y end

draw_white_y:
  MOV r0, r10           ; x = x_start
  draw_white_x:
    PSET r0, r13, r6
    ADD r0, r8
    CMP r0, r11
    BLT r3, draw_white_x
  ADD r13, r8
  CMP r13, r2
  BLT r3, draw_white_y

; ── Draw red square (middle) ──
LDI r6, 0xFF0000       ; red
LDI r10, 100
LDI r11, 140
LDI r13, 100
LDI r2, 140

draw_red_y:
  MOV r0, r10
  draw_red_x:
    PSET r0, r13, r6
    ADD r0, r8
    CMP r0, r11
    BLT r3, draw_red_x
  ADD r13, r8
  CMP r13, r2
  BLT r3, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r6, 0x00FF00       ; green
LDI r10, 180
LDI r11, 220
LDI r13, 180
LDI r2, 220

draw_green_y:
  MOV r0, r10
  draw_green_x:
    PSET r0, r13, r6
    ADD r0, r8
    CMP r0, r11
    BLT r3, draw_green_x
  ADD r13, r8
  CMP r13, r2
  BLT r3, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r9, 4             ; op=4: specialized perception
LDI r14, 0             ; mode=0: full screen
AI_AGENT r9           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
