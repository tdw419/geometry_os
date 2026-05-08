; DESCRIPTION: The GeOS assembly code draws concentric circles centered at (128, 128) with cycling colors. The radius of each circle starts at 10 and increases by 20 in each iteration until a total of 12 circles are drawn, with each circle's color calculated to cycle through hues.

; circles.asm -- concentric circles with cycling colors

; center
LDI r1, 128
LDI r10, 128

; radius counter
LDI r12, 10

; loop count
LDI r0, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r14, 20
  MUL r14, r12

  ; shift into blue channel for variation
  LDI r9, 0x000100
  MUL r9, r12
  LDI r8, 0xFF
  AND r8, r14
  OR r9, r8

  CIRCLE r1, r10, r12, r9

  ; radius += 20
  LDI r4, 20
  ADD r12, r4

  ; loop
  LDI r4, 1
  SUB r0, r4
  JNZ r0, loop

HALT
