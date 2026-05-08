; DESCRIPTION: Geometry OS program to draw a colored object.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r6 = x counter  r9 = y (254)  r14 = frame counter
; r4 = scroll amt  r1 = 256

LDI r9, 254
LDI r4, 1
LDI r1, 256

frame_loop:
  SCROLL r4

  LDI r6, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r0, 7
  MUL r0, r6
  ADD r0, r14
  LDI r10, 0xFF
  AND r0, r10

  ; threshold: skip if brightness < 64
  LDI r10, 64
  CMP r0, r10
  BLT r11, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r10, 2
  DIV r0, r10
  LDI r10, 8
  SHL r0, r10
  LDI r10, 0xFF0000
  OR r0, r10

  PSET r6, r9, r0

next_x:
  LDI r10, 1
  ADD r6, r10
  CMP r6, r1
  JZ r11, end_row
  JMP ember_loop

end_row:
  LDI r10, 1
  ADD r14, r10
  FRAME
  JMP frame_loop
