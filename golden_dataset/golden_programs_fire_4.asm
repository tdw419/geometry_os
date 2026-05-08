; DESCRIPTION: This GeOS assembly code implements a scrolling fire animation by repeatedly scrolling the screen up by one pixel and drawing a new row of embers at y=254 with varying brightness and color. The ember's brightness is calculated based on its x-position and a frame counter, and it skips drawing if below a certain threshold, creating a dynamic and flickering flame effect.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r7 = x counter  r9 = y (254)  r15 = frame counter
; r6 = scroll amt  r3 = 256

LDI r9, 254
LDI r6, 1
LDI r3, 256

frame_loop:
  SCROLL r6

  LDI r7, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r14, 7
  MUL r14, r7
  ADD r14, r15
  LDI r4, 0xFF
  AND r14, r4

  ; threshold: skip if brightness < 64
  LDI r4, 64
  CMP r14, r4
  BLT r8, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r4, 2
  DIV r14, r4
  LDI r4, 8
  SHL r14, r4
  LDI r4, 0xFF0000
  OR r14, r4

  PSET r7, r9, r14

next_x:
  LDI r4, 1
  ADD r7, r4
  CMP r7, r3
  JZ r8, end_row
  JMP ember_loop

end_row:
  LDI r4, 1
  ADD r15, r4
  FRAME
  JMP frame_loop
