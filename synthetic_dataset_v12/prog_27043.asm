; DESCRIPTION: Composite: Places a black line segment connecting (143, 99) to (222, 140) then Sets a single yellow pixel at (4, 116).
; PLAN: r0=143(x1), r1=99(y1), r2=222(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=4(x), r6=116(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 143
LDI r1, 99
LDI r2, 222
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 4
LDI r6, 116
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
