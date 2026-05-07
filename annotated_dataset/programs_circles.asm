; DESCRIPTION: The GeOS assembly code draws concentric circles centered at (128, 128) with cycling colors. The radius of each circle starts at 10 and increases by 20 in each iteration until a total of 12 circles are drawn, with each circle's color calculated to cycle through hues.

; circles.asm -- concentric circles with cycling colors

; center
LDI r0, 128
LDI r1, 128

; radius counter
LDI r2, 10

; loop count
LDI r6, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r5, 20
  MUL r5, r2

  ; shift into blue channel for variation
  LDI r7, 0x000100
  MUL r7, r2
  LDI r8, 0xFF
  AND r8, r5
  OR r7, r8

  CIRCLE r0, r1, r2, r7

  ; radius += 20
  LDI r9, 20
  ADD r2, r9

  ; loop
  LDI r9, 1
  SUB r6, r9
  JNZ r6, loop

HALT
