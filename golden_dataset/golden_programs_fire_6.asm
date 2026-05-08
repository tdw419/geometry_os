; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r7 = x counter  r4 = y (254)  r13 = frame counter
; r14 = scroll amt  r15 = 256

LDI r4, 254
LDI r14, 1
LDI r15, 256

frame_loop:
  SCROLL r14

  LDI r7, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r9, 7
  MUL r9, r7
  ADD r9, r13
  LDI r1, 0xFF
  AND r9, r1

  ; threshold: skip if brightness < 64
  LDI r1, 64
  CMP r9, r1
  BLT r0, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r1, 2
  DIV r9, r1
  LDI r1, 8
  SHL r9, r1
  LDI r1, 0xFF0000
  OR r9, r1

  PSET r7, r4, r9

next_x:
  LDI r1, 1
  ADD r7, r1
  CMP r7, r15
  JZ r0, end_row
  JMP ember_loop

end_row:
  LDI r1, 1
  ADD r13, r1
  FRAME
  JMP frame_loop
