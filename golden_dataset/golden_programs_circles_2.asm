; DESCRIPTION: The GeOS assembly code draws concentric circles centered at (128, 128) with cycling colors. The radius of each circle starts at 10 and increases by 20 in each iteration until a total of 12 circles are drawn, with each circle's color calculated to cycle through hues.

; circles.asm -- concentric circles with cycling colors

; center
LDI r11, 128
LDI r5, 128

; radius counter
LDI r12, 10

; loop count
LDI r4, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r1, 20
  MUL r1, r12

  ; shift into blue channel for variation
  LDI r0, 0x000100
  MUL r0, r12
  LDI r2, 0xFF
  AND r2, r1
  OR r0, r2

  CIRCLE r11, r5, r12, r0

  ; radius += 20
  LDI r6, 20
  ADD r12, r6

  ; loop
  LDI r6, 1
  SUB r4, r6
  JNZ r4, loop

HALT
