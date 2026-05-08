; DESCRIPTION: The GeOS assembly code draws concentric circles centered at (128, 128) with cycling colors. The radius of each circle starts at 10 and increases by 20 in each iteration until a total of 12 circles are drawn, with each circle's color calculated to cycle through hues.

; circles.asm -- concentric circles with cycling colors

; center
LDI r3, 128
LDI r8, 128

; radius counter
LDI r6, 10

; loop count
LDI r13, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r4, 20
  MUL r4, r6

  ; shift into blue channel for variation
  LDI r10, 0x000100
  MUL r10, r6
  LDI r15, 0xFF
  AND r15, r4
  OR r10, r15

  CIRCLE r3, r8, r6, r10

  ; radius += 20
  LDI r12, 20
  ADD r6, r12

  ; loop
  LDI r12, 1
  SUB r13, r12
  JNZ r13, loop

HALT
