; DESCRIPTION: Display a square using color red at the screen.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r12, 1              ; increment
LDI r5, 0xFFFFFF       ; white
LDI r0, 20             ; x start
LDI r10, 60             ; x end
LDI r13, 20             ; y start
LDI r15, 60             ; y end

draw_white_y:
  MOV r4, r0           ; x = x_start
  draw_white_x:
    PSET r4, r13, r5
    ADD r4, r12
    CMP r4, r10
    BLT r1, draw_white_x
  ADD r13, r12
  CMP r13, r15
  BLT r1, draw_white_y

; ── Draw red square (middle) ──
LDI r5, 0xFF0000       ; red
LDI r0, 100
LDI r10, 140
LDI r13, 100
LDI r15, 140

draw_red_y:
  MOV r4, r0
  draw_red_x:
    PSET r4, r13, r5
    ADD r4, r12
    CMP r4, r10
    BLT r1, draw_red_x
  ADD r13, r12
  CMP r13, r15
  BLT r1, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r5, 0x00FF00       ; green
LDI r0, 180
LDI r10, 220
LDI r13, 180
LDI r15, 220

draw_green_y:
  MOV r4, r0
  draw_green_x:
    PSET r4, r13, r5
    ADD r4, r12
    CMP r4, r10
    BLT r1, draw_green_x
  ADD r13, r12
  CMP r13, r15
  BLT r1, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r6, 4             ; op=4: specialized perception
LDI r2, 0             ; mode=0: full screen
AI_AGENT r6           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
