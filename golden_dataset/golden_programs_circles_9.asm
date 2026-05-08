; DESCRIPTION: Geometry OS program to draw a red circle.

; circles.asm -- concentric circles with cycling colors

; center
LDI r1, 128
LDI r3, 128

; radius counter
LDI r9, 10

; loop count
LDI r13, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r15, 20
  MUL r15, r9

  ; shift into blue channel for variation
  LDI r14, 0x000100
  MUL r14, r9
  LDI r0, 0xFF
  AND r0, r15
  OR r14, r0

  CIRCLE r1, r3, r9, r14

  ; radius += 20
  LDI r4, 20
  ADD r9, r4

  ; loop
  LDI r4, 1
  SUB r13, r4
  JNZ r13, loop

HALT
