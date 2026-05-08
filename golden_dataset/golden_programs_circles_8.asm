; DESCRIPTION: A red circle centered at the screen with fixed size.

; circles.asm -- concentric circles with cycling colors

; center
LDI r4, 128
LDI r9, 128

; radius counter
LDI r2, 10

; loop count
LDI r5, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r8, 20
  MUL r8, r2

  ; shift into blue channel for variation
  LDI r1, 0x000100
  MUL r1, r2
  LDI r11, 0xFF
  AND r11, r8
  OR r1, r11

  CIRCLE r4, r9, r2, r1

  ; radius += 20
  LDI r12, 20
  ADD r2, r12

  ; loop
  LDI r12, 1
  SUB r5, r12
  JNZ r5, loop

HALT
