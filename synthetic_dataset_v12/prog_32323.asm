; DESCRIPTION: Composite: Sets a single yellow pixel at (299, 147) then Draws a cyan line from (47, 199) to (378, 181).
; PLAN: r0=299(x), r1=147(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=47(x1), r6=199(y1), r7=378(x2), r8=181(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 147
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 47
LDI r6, 199
LDI r7, 378
LDI r8, 181
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
