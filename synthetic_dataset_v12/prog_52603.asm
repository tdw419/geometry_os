; DESCRIPTION: Composite: Places a orange dot at position (274, 219) then Places a purple line segment connecting (476, 90) to (114, 65) then Creates a black circular shape at (293, 145) with radius 55.
; PLAN: r0=274(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=476(x1), r6=90(y1), r7=114(x2), r8=65(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=145(y), r12=55(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 476
LDI r6, 90
LDI r7, 114
LDI r8, 65
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 145
LDI r12, 55
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
