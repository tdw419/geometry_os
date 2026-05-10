; DESCRIPTION: Composite: Draws a black line from (441, 95) to (449, 163) then Creates a white circular shape at (163, 212) with radius 44.
; PLAN: r0=441(x1), r1=95(y1), r2=449(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=212(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 441
LDI r1, 95
LDI r2, 449
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 212
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
