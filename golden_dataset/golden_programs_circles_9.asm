; DESCRIPTION: The GeOS assembly code draws concentric circles centered at (128, 128) with cycling colors. The radius of each circle starts at 10 and increases by 20 in each iteration until a total of 12 circles are drawn, with each circle's color calculated to cycle through hues.

; circles.asm -- concentric circles with cycling colors

; center
LDI r15, 128
LDI r6, 128

; radius counter
LDI r0, 10

; loop count
LDI r14, 12

loop:
  ; color = radius * 20 (cycles through hues roughly)
  LDI r13, 20
  MUL r13, r0

  ; shift into blue channel for variation
  LDI r11, 0x000100
  MUL r11, r0
  LDI r8, 0xFF
  AND r8, r13
  OR r11, r8

  CIRCLE r15, r6, r0, r11

  ; radius += 20
  LDI r4, 20
  ADD r0, r4

  ; loop
  LDI r4, 1
  SUB r14, r4
  JNZ r14, loop

HALT
