; DESCRIPTION: Render a red circle at the screen.

; circles.asm -- concentric circles with cycling colors

; center
LDI r15, 128
LDI r11, 128

; radius counter
LDI r13, 10

; loop count
LDI r6, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r1, 20
  MUL r1, r13

  ; shift into blue channel for variation
  LDI r12, 0x000100
  MUL r12, r13
  LDI r7, 0xFF
  AND r7, r1
  OR r12, r7

  CIRCLE r15, r11, r13, r12

  ; radius += 20
  LDI r3, 20
  ADD r13, r3

  ; loop
  LDI r3, 1
  SUB r6, r3
  JNZ r6, loop

HALT
