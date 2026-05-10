; DESCRIPTION: Composite: Places a black line segment connecting (43, 17) to (26, 66) then Sets a single blue pixel at (157, 1).
; PLAN: r0=43(x1), r1=17(y1), r2=26(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=157(x), r6=1(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 43
LDI r1, 17
LDI r2, 26
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 1
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
