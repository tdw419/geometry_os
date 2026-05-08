; DESCRIPTION: The GeOS assembly code draws concentric circles centered at (128, 128) with cycling colors. The radius of each circle starts at 10 and increases by 20 in each iteration until a total of 12 circles are drawn, with each circle's color calculated to cycle through hues.

; circles.asm -- concentric circles with cycling colors

; center
LDI r14, 128
LDI r5, 128

; radius counter
LDI r6, 10

; loop count
LDI r2, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r13, 20
  MUL r13, r6

  ; shift into blue channel for variation
  LDI r4, 0x000100
  MUL r4, r6
  LDI r12, 0xFF
  AND r12, r13
  OR r4, r12

  CIRCLE r14, r5, r6, r4

  ; radius += 20
  LDI r8, 20
  ADD r6, r8

  ; loop
  LDI r8, 1
  SUB r2, r8
  JNZ r2, loop

HALT
