; DESCRIPTION: Draw square: pos=the screen, color=red, size=fixed size.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r4, 1              ; increment
LDI r5, 0xFFFFFF       ; white
LDI r10, 20             ; x start
LDI r0, 60             ; x end
LDI r15, 20             ; y start
LDI r1, 60             ; y end

draw_white_y:
  MOV r9, r10           ; x = x_start
  draw_white_x:
    PSET r9, r15, r5
    ADD r9, r4
    CMP r9, r0
    BLT r7, draw_white_x
  ADD r15, r4
  CMP r15, r1
  BLT r7, draw_white_y

; ── Draw red square (middle) ──
LDI r5, 0xFF0000       ; red
LDI r10, 100
LDI r0, 140
LDI r15, 100
LDI r1, 140

draw_red_y:
  MOV r9, r10
  draw_red_x:
    PSET r9, r15, r5
    ADD r9, r4
    CMP r9, r0
    BLT r7, draw_red_x
  ADD r15, r4
  CMP r15, r1
  BLT r7, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r5, 0x00FF00       ; green
LDI r10, 180
LDI r0, 220
LDI r15, 180
LDI r1, 220

draw_green_y:
  MOV r9, r10
  draw_green_x:
    PSET r9, r15, r5
    ADD r9, r4
    CMP r9, r0
    BLT r7, draw_green_x
  ADD r15, r4
  CMP r15, r1
  BLT r7, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r8, 4             ; op=4: specialized perception
LDI r13, 0             ; mode=0: full screen
AI_AGENT r8           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
