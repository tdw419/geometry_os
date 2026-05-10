; DESCRIPTION: Composite: Renders a white line between points (376, 54) and (402, 162) then Sets a single black pixel at (316, 102) then Draws a blue circle centered at (302, 116) with radius 45.
; PLAN: r0=376(x1), r1=54(y1), r2=402(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=102(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=302(x), r11=116(y), r12=45(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 376
LDI r1, 54
LDI r2, 402
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 102
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 302
LDI r11, 116
LDI r12, 45
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
