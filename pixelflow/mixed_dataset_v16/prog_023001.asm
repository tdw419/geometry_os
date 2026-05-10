; DESCRIPTION: Composite: Places a black line segment connecting (355, 108) to (283, 185) then Sets a single blue pixel at (125, 212) then Creates a orange circular shape at (56, 191) with radius 49.
; PLAN: r0=355(x1), r1=108(y1), r2=283(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=212(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=56(x), r11=191(y), r12=49(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 108
LDI r2, 283
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 212
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 56
LDI r11, 191
LDI r12, 49
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
