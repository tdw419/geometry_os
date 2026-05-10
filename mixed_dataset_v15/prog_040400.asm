; DESCRIPTION: Composite: Draws a magenta line from (328, 216) to (29, 7) then Sets a single blue pixel at (194, 65) then Creates a black circular shape at (288, 95) with radius 49.
; PLAN: r0=328(x1), r1=216(y1), r2=29(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=65(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=288(x), r11=95(y), r12=49(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 328
LDI r1, 216
LDI r2, 29
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 65
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 288
LDI r11, 95
LDI r12, 49
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
