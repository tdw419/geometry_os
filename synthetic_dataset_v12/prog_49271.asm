; DESCRIPTION: Composite: Renders a yellow line between points (408, 2) and (322, 217) then Sets a single green pixel at (388, 120).
; PLAN: r0=408(x1), r1=2(y1), r2=322(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=120(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 408
LDI r1, 2
LDI r2, 322
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 120
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
