; DESCRIPTION: Composite: Renders a red line between points (325, 22) and (491, 217) then Draws a yellow circle centered at (156, 107) with radius 77.
; PLAN: r0=325(x1), r1=22(y1), r2=491(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=107(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 325
LDI r1, 22
LDI r2, 491
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 107
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
