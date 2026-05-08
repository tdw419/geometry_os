; DESCRIPTION: This GeOS assembly code implements a scrolling fire animation by repeatedly scrolling the screen up by one pixel and drawing a new row of embers at y=254 with varying brightness and color. The ember's brightness is calculated based on its x-position and a frame counter, and it skips drawing if below a certain threshold, creating a dynamic and flickering flame effect.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r10 = x counter  r5 = y (254)  r4 = frame counter
; r15 = scroll amt  r12 = 256

LDI r5, 254
LDI r15, 1
LDI r12, 256

frame_loop:
  SCROLL r15

  LDI r10, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r9, 7
  MUL r9, r10
  ADD r9, r4
  LDI r6, 0xFF
  AND r9, r6

  ; threshold: skip if brightness < 64
  LDI r6, 64
  CMP r9, r6
  BLT r0, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r6, 2
  DIV r9, r6
  LDI r6, 8
  SHL r9, r6
  LDI r6, 0xFF0000
  OR r9, r6

  PSET r10, r5, r9

next_x:
  LDI r6, 1
  ADD r10, r6
  CMP r10, r12
  JZ r0, end_row
  JMP ember_loop

end_row:
  LDI r6, 1
  ADD r4, r6
  FRAME
  JMP frame_loop
