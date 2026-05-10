; DESCRIPTION: Composite: Renders a orange line between points (194, 142) and (276, 160) then Sets a single blue pixel at (506, 146).
; PLAN: r0=194(x1), r1=142(y1), r2=276(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=506(x), r6=146(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 194
LDI r1, 142
LDI r2, 276
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 146
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
