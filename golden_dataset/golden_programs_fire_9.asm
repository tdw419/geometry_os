; DESCRIPTION: Geometry OS program to draw a colored object.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r8 = x counter  r7 = y (254)  r0 = frame counter
; r3 = scroll amt  r15 = 256

LDI r7, 254
LDI r3, 1
LDI r15, 256

frame_loop:
  SCROLL r3

  LDI r8, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r6, 7
  MUL r6, r8
  ADD r6, r0
  LDI r2, 0xFF
  AND r6, r2

  ; threshold: skip if brightness < 64
  LDI r2, 64
  CMP r6, r2
  BLT r4, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r2, 2
  DIV r6, r2
  LDI r2, 8
  SHL r6, r2
  LDI r2, 0xFF0000
  OR r6, r2

  PSET r8, r7, r6

next_x:
  LDI r2, 1
  ADD r8, r2
  CMP r8, r15
  JZ r4, end_row
  JMP ember_loop

end_row:
  LDI r2, 1
  ADD r0, r2
  FRAME
  JMP frame_loop
