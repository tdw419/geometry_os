; DESCRIPTION: Composite: Draws a black line from (506, 137) to (177, 54) then Creates a white circular shape at (163, 119) with radius 15.
; PLAN: r0=506(x1), r1=137(y1), r2=177(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=163(x), r6=119(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 506
LDI r1, 137
LDI r2, 177
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 163
LDI r6, 119
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
