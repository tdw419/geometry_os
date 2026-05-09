; DESCRIPTION: Composite: Creates a yellow rectangular region at (132, 71) spanning 34 by 61 pixels then Renders a white line between points (49, 120) and (147, 143) then Draws a orange circle centered at (274, 87) with radius 54.
; PLAN: r0=132(x), r1=71(y), r2=34(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=49(x1), r6=120(y1), r7=147(x2), r8=143(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=274(x), r11=87(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 71
LDI r2, 34
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 120
LDI r7, 147
LDI r8, 143
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 274
LDI r11, 87
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
