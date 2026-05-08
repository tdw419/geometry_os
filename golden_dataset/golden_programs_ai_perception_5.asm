; DESCRIPTION: This GeOS assembly code draws three colored squares on the screen and uses the AI_AGENT with op=4 to count the distinct objects (the squares). The result is stored in register R0, or set to 0xFFFFFFFF if the vision model is unavailable.

; ai_perception.asm -- Test AI_AGENT op=4 (perception) and op=3 (real VLM)
;
; Draws three colored squares, calls the vision model to count objects.
; Stores the count in R0. If vision model is unavailable, R0 = 0xFFFFFFFF.
;
; Usage: cargo run --release -- ai_perception.asm

; ── Draw white square (top-left) ──
LDI r14, 1              ; increment
LDI r15, 0xFFFFFF       ; white
LDI r9, 20             ; x start
LDI r8, 60             ; x end
LDI r0, 20             ; y start
LDI r11, 60             ; y end

draw_white_y:
  MOV r6, r9           ; x = x_start
  draw_white_x:
    PSET r6, r0, r15
    ADD r6, r14
    CMP r6, r8
    BLT r13, draw_white_x
  ADD r0, r14
  CMP r0, r11
  BLT r13, draw_white_y

; ── Draw red square (middle) ──
LDI r15, 0xFF0000       ; red
LDI r9, 100
LDI r8, 140
LDI r0, 100
LDI r11, 140

draw_red_y:
  MOV r6, r9
  draw_red_x:
    PSET r6, r0, r15
    ADD r6, r14
    CMP r6, r8
    BLT r13, draw_red_x
  ADD r0, r14
  CMP r0, r11
  BLT r13, draw_red_y

; ── Draw green square (bottom-right) ──
LDI r15, 0x00FF00       ; green
LDI r9, 180
LDI r8, 220
LDI r0, 180
LDI r11, 220

draw_green_y:
  MOV r6, r9
  draw_green_x:
    PSET r6, r0, r15
    ADD r6, r14
    CMP r6, r8
    BLT r13, draw_green_x
  ADD r0, r14
  CMP r0, r11
  BLT r13, draw_green_y

; ── Call AI_AGENT op=4 (count objects) ──
LDI r5, 4             ; op=4: specialized perception
LDI r3, 0             ; mode=0: full screen
AI_AGENT r5           ; R0 = count of distinct objects

; ── Display result: draw R0 as digits on screen using simple pixel font ──
; Just halt -- check R0 in registers
HALT
