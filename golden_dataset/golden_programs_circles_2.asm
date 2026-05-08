; DESCRIPTION: Render a red circle at the screen.

; circles.asm -- concentric circles with cycling colors

; center
LDI r4, 128
LDI r8, 128

; radius counter
LDI r12, 10

; loop count
LDI r13, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r7, 20
  MUL r7, r12

  ; shift into blue channel for variation
  LDI r14, 0x000100
  MUL r14, r12
  LDI r3, 0xFF
  AND r3, r7
  OR r14, r3

  CIRCLE r4, r8, r12, r14

  ; radius += 20
  LDI r9, 20
  ADD r12, r9

  ; loop
  LDI r9, 1
  SUB r13, r9
  JNZ r13, loop

HALT
