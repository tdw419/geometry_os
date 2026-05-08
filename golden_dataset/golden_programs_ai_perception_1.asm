; DESCRIPTION: Display a square using color red at the screen.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r14, 1              ; increment
LDI r8, 0xFFFFFF       ; white
LDI r0, 20             ; x start
LDI r15, 60             ; x end
LDI r1, 20             ; y start
LDI r9, 60             ; y end

draw_white_y:
  MOV r3, r0           ; x = x_start
  draw_white_x:
    PSET r3, r1, r8
    ADD r3, r14
    CMP r3, r15
    BLT r7, draw_white_x
  ADD r1, r14
  CMP r1, r9
  BLT r7, draw_white_y

; ── Draw red square (middle) ──
LDI r8, 0xFF0000       ; red
LDI r0, 100
LDI r15, 140
LDI r1, 100
LDI r9, 140

draw_red_y:
  MOV r3, r0
  draw_red_x:
    PSET r3, r1, r8
    ADD r3, r14
    CMP r3, r15
    BLT r7, draw_red_x
  ADD r1, r14
  CMP r1, r9
  BLT r7, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r8, 0x00FF00       ; green
LDI r0, 180
LDI r15, 220
LDI r1, 180
LDI r9, 220

draw_green_y:
  MOV r3, r0
  draw_green_x:
    PSET r3, r1, r8
    ADD r3, r14
    CMP r3, r15
    BLT r7, draw_green_x
  ADD r1, r14
  CMP r1, r9
  BLT r7, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r10, 4             ; op=4: specialized perception
LDI r4, 0             ; mode=0: full screen
AI_AGENT r10           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
