; DESCRIPTION: Draws a red circle at the screen with fixed size.

; circles.asm -- concentric circles with cycling colors

; center
LDI r6, 128
LDI r0, 128

; radius counter
LDI r7, 10

; loop count
LDI r1, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r10, 20
  MUL r10, r7

  ; shift into blue channel for variation
  LDI r4, 0x000100
  MUL r4, r7
  LDI r8, 0xFF
  AND r8, r10
  OR r4, r8

  CIRCLE r6, r0, r7, r4

  ; radius += 20
  LDI r5, 20
  ADD r7, r5

  ; loop
  LDI r5, 1
  SUB r1, r5
  JNZ r1, loop

HALT
