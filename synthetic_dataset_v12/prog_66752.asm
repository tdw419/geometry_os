; DESCRIPTION: Composite: Renders a white box of size 63x61 starting at (14, 176) then Renders a yellow line between points (132, 155) and (7, 240) then Draws a orange circle centered at (356, 82) with radius 62.
; PLAN: r0=14(x), r1=176(y), r2=63(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x1), r6=155(y1), r7=7(x2), r8=240(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=356(x), r11=82(y), r12=62(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 14
LDI r1, 176
LDI r2, 63
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 155
LDI r7, 7
LDI r8, 240
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 82
LDI r12, 62
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
