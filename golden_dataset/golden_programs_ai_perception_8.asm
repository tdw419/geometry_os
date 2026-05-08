; DESCRIPTION: Render a red square at the screen.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r7, 1              ; increment
LDI r13, 0xFFFFFF       ; white
LDI r10, 20             ; x start
LDI r1, 60             ; x end
LDI r3, 20             ; y start
LDI r6, 60             ; y end

draw_white_y:
  MOV r5, r10           ; x = x_start
  draw_white_x:
    PSET r5, r3, r13
    ADD r5, r7
    CMP r5, r1
    BLT r12, draw_white_x
  ADD r3, r7
  CMP r3, r6
  BLT r12, draw_white_y

; ── Draw red square (middle) ──
LDI r13, 0xFF0000       ; red
LDI r10, 100
LDI r1, 140
LDI r3, 100
LDI r6, 140

draw_red_y:
  MOV r5, r10
  draw_red_x:
    PSET r5, r3, r13
    ADD r5, r7
    CMP r5, r1
    BLT r12, draw_red_x
  ADD r3, r7
  CMP r3, r6
  BLT r12, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r13, 0x00FF00       ; green
LDI r10, 180
LDI r1, 220
LDI r3, 180
LDI r6, 220

draw_green_y:
  MOV r5, r10
  draw_green_x:
    PSET r5, r3, r13
    ADD r5, r7
    CMP r5, r1
    BLT r12, draw_green_x
  ADD r3, r7
  CMP r3, r6
  BLT r12, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r9, 4             ; op=4: specialized perception
LDI r15, 0             ; mode=0: full screen
AI_AGENT r9           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
