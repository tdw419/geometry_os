; DESCRIPTION: Display a circle using color red at the screen.

; circles.asm -- concentric circles with cycling colors

; center
LDI r13, 128
LDI r8, 128

; radius counter
LDI r5, 10

; loop count
LDI r2, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r3, 20
  MUL r3, r5

  ; shift into blue channel for variation
  LDI r12, 0x000100
  MUL r12, r5
  LDI r15, 0xFF
  AND r15, r3
  OR r12, r15

  CIRCLE r13, r8, r5, r12

  ; radius += 20
  LDI r0, 20
  ADD r5, r0

  ; loop
  LDI r0, 1
  SUB r2, r0
  JNZ r2, loop

HALT
