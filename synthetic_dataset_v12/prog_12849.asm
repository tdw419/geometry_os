; DESCRIPTION: Composite: Renders a yellow line between points (143, 163) and (139, 105) then Sets a single blue pixel at (418, 158).
; PLAN: r0=143(x1), r1=163(y1), r2=139(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=158(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 143
LDI r1, 163
LDI r2, 139
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 158
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
