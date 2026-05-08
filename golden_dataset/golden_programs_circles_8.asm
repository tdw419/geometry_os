; DESCRIPTION: The GeOS assembly code draws concentric circles centered at (128, 128) with cycling colors. The radius of each circle starts at 10 and increases by 20 in each iteration until a total of 12 circles are drawn, with each circle's color calculated to cycle through hues.

; circles.asm -- concentric circles with cycling colors

; center
LDI r8, 128
LDI r2, 128

; radius counter
LDI r14, 10

; loop count
LDI r3, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r13, 20
  MUL r13, r14

  ; shift into blue channel for variation
  LDI r9, 0x000100
  MUL r9, r14
  LDI r7, 0xFF
  AND r7, r13
  OR r9, r7

  CIRCLE r8, r2, r14, r9

  ; radius += 20
  LDI r12, 20
  ADD r14, r12

  ; loop
  LDI r12, 1
  SUB r3, r12
  JNZ r3, loop

HALT
