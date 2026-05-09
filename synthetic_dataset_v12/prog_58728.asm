; DESCRIPTION: Composite: Draws a yellow line from (426, 92) to (155, 49) then Creates a orange rectangular region at (328, 205) spanning 96 by 38 pixels then Renders a blue disk with center (413, 123) and radius 34.
; PLAN: r0=426(x1), r1=92(y1), r2=155(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=205(y), r7=96(width), r8=38(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x), r11=123(y), r12=34(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 92
LDI r2, 155
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 205
LDI r7, 96
LDI r8, 38
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 123
LDI r12, 34
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
