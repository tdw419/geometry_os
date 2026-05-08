; DESCRIPTION: Draw circle: pos=the screen, color=red, size=fixed size.

; circles.asm -- concentric circles with cycling colors

; center
LDI r10, 128
LDI r13, 128

; radius counter
LDI r11, 10

; loop count
LDI r2, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r4, 20
  MUL r4, r11

  ; shift into blue channel for variation
  LDI r5, 0x000100
  MUL r5, r11
  LDI r1, 0xFF
  AND r1, r4
  OR r5, r1

  CIRCLE r10, r13, r11, r5

  ; radius += 20
  LDI r6, 20
  ADD r11, r6

  ; loop
  LDI r6, 1
  SUB r2, r6
  JNZ r2, loop

HALT
