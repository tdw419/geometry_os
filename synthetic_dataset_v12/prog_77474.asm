; DESCRIPTION: Composite: Draws a purple line from (327, 97) to (64, 245) then Sets a single blue pixel at (452, 191) then Creates a white circular shape at (122, 150) with radius 54.
; PLAN: r0=327(x1), r1=97(y1), r2=64(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=191(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=122(x), r11=150(y), r12=54(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 97
LDI r2, 64
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 191
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 122
LDI r11, 150
LDI r12, 54
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
