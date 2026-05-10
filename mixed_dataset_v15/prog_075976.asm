; DESCRIPTION: Composite: Renders a orange disk with center (426, 181) and radius 62 then Renders a yellow line between points (507, 60) and (199, 106) then Draws a purple rectangle at (77, 75) with width 52 and height 105.
; PLAN: r0=426(x), r1=181(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=507(x1), r6=60(y1), r7=199(x2), r8=106(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=77(x), r11=75(y), r12=52(width), r13=105(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 181
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 507
LDI r6, 60
LDI r7, 199
LDI r8, 106
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 77
LDI r11, 75
LDI r12, 52
LDI r13, 105
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
