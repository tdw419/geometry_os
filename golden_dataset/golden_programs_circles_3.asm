; DESCRIPTION: Render a red circle at the screen.

; circles.asm -- concentric circles with cycling colors

; center
LDI r10, 128
LDI r5, 128

; radius counter
LDI r2, 10

; loop count
LDI r8, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r6, 20
  MUL r6, r2

  ; shift into blue channel for variation
  LDI r4, 0x000100
  MUL r4, r2
  LDI r15, 0xFF
  AND r15, r6
  OR r4, r15

  CIRCLE r10, r5, r2, r4

  ; radius += 20
  LDI r11, 20
  ADD r2, r11

  ; loop
  LDI r11, 1
  SUB r8, r11
  JNZ r8, loop

HALT
