; DESCRIPTION: Render a red square at the screen.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r5, 1              ; increment
LDI r0, 0xFFFFFF       ; white
LDI r10, 20             ; x start
LDI r9, 60             ; x end
LDI r6, 20             ; y start
LDI r13, 60             ; y end

draw_white_y:
  MOV r8, r10           ; x = x_start
  draw_white_x:
    PSET r8, r6, r0
    ADD r8, r5
    CMP r8, r9
    BLT r3, draw_white_x
  ADD r6, r5
  CMP r6, r13
  BLT r3, draw_white_y

; ── Draw red square (middle) ──
LDI r0, 0xFF0000       ; red
LDI r10, 100
LDI r9, 140
LDI r6, 100
LDI r13, 140

draw_red_y:
  MOV r8, r10
  draw_red_x:
    PSET r8, r6, r0
    ADD r8, r5
    CMP r8, r9
    BLT r3, draw_red_x
  ADD r6, r5
  CMP r6, r13
  BLT r3, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r0, 0x00FF00       ; green
LDI r10, 180
LDI r9, 220
LDI r6, 180
LDI r13, 220

draw_green_y:
  MOV r8, r10
  draw_green_x:
    PSET r8, r6, r0
    ADD r8, r5
    CMP r8, r9
    BLT r3, draw_green_x
  ADD r6, r5
  CMP r6, r13
  BLT r3, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r7, 4             ; op=4: specialized perception
LDI r2, 0             ; mode=0: full screen
AI_AGENT r7           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
