; DESCRIPTION: Composite: Places a red line segment connecting (0, 102) to (378, 171) then Sets a single green pixel at (467, 179).
; PLAN: r0=0(x1), r1=102(y1), r2=378(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=179(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 0
LDI r1, 102
LDI r2, 378
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 179
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
