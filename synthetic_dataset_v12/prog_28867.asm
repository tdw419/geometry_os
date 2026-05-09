; DESCRIPTION: Composite: Renders a red line between points (184, 171) and (198, 201) then Creates a black rectangular region at (183, 132) spanning 49 by 55 pixels then Sets a single blue pixel at (54, 129).
; PLAN: r0=184(x1), r1=171(y1), r2=198(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=132(y), r7=49(width), r8=55(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x), r11=129(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 171
LDI r2, 198
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 132
LDI r7, 49
LDI r8, 55
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 129
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
