; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; fire.asm -- scrolling fire animation using SCROLL + FRAME
;
; Each frame:
;   1. SCROLL screen up 1 pixel
;   2. Draw a new ember row at y=254 with position-varied orange/red
;   3. FRAME -- display this state and continue
;
; r3 = x counter  r1 = y (254)  r8 = frame counter
; r7 = scroll amt  r15 = 256

LDI r1, 254
LDI r7, 1
LDI r15, 256

frame_loop:
  SCROLL r7

  LDI r3, 0

ember_loop:
  ; brightness = (x * 7 + frame) & 0xFF
  LDI r4, 7
  MUL r4, r3
  ADD r4, r8
  LDI r0, 0xFF
  AND r4, r0

  ; threshold: skip if brightness < 64
  LDI r0, 64
  CMP r4, r0
  BLT r9, next_x

  ; green = brightness >> 1, red = 0xFF
  LDI r0, 2
  DIV r4, r0
  LDI r0, 8
  SHL r4, r0
  LDI r0, 0xFF0000
  OR r4, r0

  PSET r3, r1, r4

next_x:
  LDI r0, 1
  ADD r3, r0
  CMP r3, r15
  JZ r9, end_row
  JMP ember_loop

end_row:
  LDI r0, 1
  ADD r8, r0
  FRAME
  JMP frame_loop
