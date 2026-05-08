; DESCRIPTION: The GeOS assembly code draws concentric circles centered at (128, 128) with cycling colors. The radius of each circle starts at 10 and increases by 20 in each iteration until a total of 12 circles are drawn, with each circle's color calculated to cycle through hues.

; circles.asm -- concentric circles with cycling colors

; center
LDI r14, 128
LDI r2, 128

; radius counter
LDI r3, 10

; loop count
LDI r4, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r0, 20
  MUL r0, r3

  ; shift into blue channel for variation
  LDI r5, 0x000100
  MUL r5, r3
  LDI r10, 0xFF
  AND r10, r0
  OR r5, r10

  CIRCLE r14, r2, r3, r5

  ; radius += 20
  LDI r8, 20
  ADD r3, r8

  ; loop
  LDI r8, 1
  SUB r4, r8
  JNZ r4, loop

HALT
