; DESCRIPTION: Composite: Draws a magenta line from (28, 104) to (426, 24) then Places a green dot at position (64, 142) then Draws a cyan rectangle at (434, 8) with width 21 and height 23.
; PLAN: r0=28(x1), r1=104(y1), r2=426(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=142(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=434(x), r11=8(y), r12=21(width), r13=23(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 28
LDI r1, 104
LDI r2, 426
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 142
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 434
LDI r11, 8
LDI r12, 21
LDI r13, 23
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
