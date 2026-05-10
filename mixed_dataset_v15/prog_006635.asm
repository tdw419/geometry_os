; DESCRIPTION: Composite: Sets a single red pixel at (132, 193) then Places a red line segment connecting (247, 219) to (396, 39) then Creates a green circular shape at (414, 158) with radius 65.
; PLAN: r0=132(x), r1=193(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=247(x1), r6=219(y1), r7=396(x2), r8=39(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=414(x), r11=158(y), r12=65(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 193
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 247
LDI r6, 219
LDI r7, 396
LDI r8, 39
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 158
LDI r12, 65
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
