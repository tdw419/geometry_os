; DESCRIPTION: Draws a red circle at the screen with fixed size.

; circles.asm -- concentric circles with cycling colors

; center
LDI r5, 128
LDI r14, 128

; radius counter
LDI r4, 10

; loop count
LDI r13, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r9, 20
  MUL r9, r4

  ; shift into blue channel for variation
  LDI r3, 0x000100
  MUL r3, r4
  LDI r11, 0xFF
  AND r11, r9
  OR r3, r11

  CIRCLE r5, r14, r4, r3

  ; radius += 20
  LDI r2, 20
  ADD r4, r2

  ; loop
  LDI r2, 1
  SUB r13, r2
  JNZ r13, loop

HALT
