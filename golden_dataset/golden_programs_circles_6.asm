; DESCRIPTION: The GeOS assembly code draws concentric circles centered at (128, 128) with cycling colors. The radius of each circle starts at 10 and increases by 20 in each iteration until a total of 12 circles are drawn, with each circle's color calculated to cycle through hues.

; circles.asm -- concentric circles with cycling colors

; center
LDI r4, 128
LDI r12, 128

; radius counter
LDI r14, 10

; loop count
LDI r13, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r2, 20
  MUL r2, r14

  ; shift into blue channel for variation
  LDI r8, 0x000100
  MUL r8, r14
  LDI r0, 0xFF
  AND r0, r2
  OR r8, r0

  CIRCLE r4, r12, r14, r8

  ; radius += 20
  LDI r11, 20
  ADD r14, r11

  ; loop
  LDI r11, 1
  SUB r13, r11
  JNZ r13, loop

HALT
