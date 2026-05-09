; DESCRIPTION: Composite: Renders a white line between points (466, 119) and (131, 15) then Sets a single green pixel at (165, 20).
; PLAN: r0=466(x1), r1=119(y1), r2=131(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=20(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 466
LDI r1, 119
LDI r2, 131
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 20
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
