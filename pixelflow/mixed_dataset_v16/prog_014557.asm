; DESCRIPTION: Composite: Draws a red rectangle at (414, 97) with width 23 and height 29 then Renders a red line between points (376, 253) and (143, 218) then Draws a orange circle centered at (114, 105) with radius 20.
; PLAN: r0=414(x), r1=97(y), r2=23(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x1), r6=253(y1), r7=143(x2), r8=218(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=105(y), r12=20(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 414
LDI r1, 97
LDI r2, 23
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 253
LDI r7, 143
LDI r8, 218
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 105
LDI r12, 20
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
