; DESCRIPTION: Composite: Sets a single red pixel at (238, 75) then Renders a cyan line between points (483, 251) and (258, 234).
; PLAN: r0=238(x), r1=75(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=483(x1), r6=251(y1), r7=258(x2), r8=234(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 75
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 483
LDI r6, 251
LDI r7, 258
LDI r8, 234
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
