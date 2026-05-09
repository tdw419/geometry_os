; DESCRIPTION: Composite: Places a orange line segment connecting (90, 144) to (272, 87) then Sets a single red pixel at (196, 148) then Creates a black circular shape at (382, 98) with radius 64.
; PLAN: r0=90(x1), r1=144(y1), r2=272(x2), r3=87(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=148(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=382(x), r11=98(y), r12=64(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 90
LDI r1, 144
LDI r2, 272
LDI r3, 87
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 148
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 382
LDI r11, 98
LDI r12, 64
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
