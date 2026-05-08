; DESCRIPTION: Draws a colored object at the screen with fixed size.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r15 = x counter  r5 = y (254)  r12 = frame counter
; r1 = scroll amt  r10 = 256

LDI r5, 254
LDI r1, 1
LDI r10, 256

frame_loop:
  SCROLL r1

  LDI r15, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r9, 7
  MUL r9, r15
  ADD r9, r12
  LDI r2, 0xFF
  AND r9, r2

  ; threshold: skip if brightness < 64
  LDI r2, 64
  CMP r9, r2
  BLT r8, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r2, 2
  DIV r9, r2
  LDI r2, 8
  SHL r9, r2
  LDI r2, 0xFF0000
  OR r9, r2

  PSET r15, r5, r9

next_x:
  LDI r2, 1
  ADD r15, r2
  CMP r15, r10
  JZ r8, end_row
  JMP ember_loop

end_row:
  LDI r2, 1
  ADD r12, r2
  FRAME
  JMP frame_loop
