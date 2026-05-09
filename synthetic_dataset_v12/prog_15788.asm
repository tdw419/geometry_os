; DESCRIPTION: Composite: Renders a yellow line between points (46, 123) and (348, 156) then Creates a red rectangular region at (432, 109) spanning 58 by 105 pixels then Renders a black disk with center (374, 54) and radius 52.
; PLAN: r0=46(x1), r1=123(y1), r2=348(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=109(y), r7=58(width), r8=105(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x), r11=54(y), r12=52(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 46
LDI r1, 123
LDI r2, 348
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 109
LDI r7, 58
LDI r8, 105
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 54
LDI r12, 52
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
