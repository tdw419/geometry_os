; DESCRIPTION: The GeOS assembly code draws concentric circles centered at (128, 128) with cycling colors. The radius of each circle starts at 10 and increases by 20 in each iteration until a total of 12 circles are drawn, with each circle's color calculated to cycle through hues.

; circles.asm -- concentric circles with cycling colors

; center
LDI r15, 128
LDI r5, 128

; radius counter
LDI r1, 10

; loop count
LDI r12, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r7, 20
  MUL r7, r1

  ; shift into blue channel for variation
  LDI r10, 0x000100
  MUL r10, r1
  LDI r0, 0xFF
  AND r0, r7
  OR r10, r0

  CIRCLE r15, r5, r1, r10

  ; radius += 20
  LDI r6, 20
  ADD r1, r6

  ; loop
  LDI r6, 1
  SUB r12, r6
  JNZ r12, loop

HALT
