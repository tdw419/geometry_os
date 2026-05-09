; DESCRIPTION: Composite: Places a orange line segment connecting (282, 75) to (173, 103) then Places a green dot at position (259, 222) then Draws a magenta rectangle at (237, 169) with width 81 and height 45.
; PLAN: r0=282(x1), r1=75(y1), r2=173(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=222(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=237(x), r11=169(y), r12=81(width), r13=45(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 75
LDI r2, 173
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 222
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 237
LDI r11, 169
LDI r12, 81
LDI r13, 45
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
