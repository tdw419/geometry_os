; DESCRIPTION: Render a colored object at the screen.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r4 = x counter  r10 = y (254)  r8 = frame counter
; r1 = scroll amt  r14 = 256

LDI r10, 254
LDI r1, 1
LDI r14, 256

frame_loop:
  SCROLL r1

  LDI r4, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r15, 7
  MUL r15, r4
  ADD r15, r8
  LDI r3, 0xFF
  AND r15, r3

  ; threshold: skip if brightness < 64
  LDI r3, 64
  CMP r15, r3
  BLT r9, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r3, 2
  DIV r15, r3
  LDI r3, 8
  SHL r15, r3
  LDI r3, 0xFF0000
  OR r15, r3

  PSET r4, r10, r15

next_x:
  LDI r3, 1
  ADD r4, r3
  CMP r4, r14
  JZ r9, end_row
  JMP ember_loop

end_row:
  LDI r3, 1
  ADD r8, r3
  FRAME
  JMP frame_loop
