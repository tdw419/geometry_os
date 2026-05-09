; DESCRIPTION: Composite: Sets a single blue pixel at (88, 135) then Renders a purple line between points (402, 26) and (120, 78) then Creates a black circular shape at (74, 162) with radius 42.
; PLAN: r0=88(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=402(x1), r6=26(y1), r7=120(x2), r8=78(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=162(y), r12=42(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 402
LDI r6, 26
LDI r7, 120
LDI r8, 78
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 162
LDI r12, 42
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
