; DESCRIPTION: Composite: Sets a single yellow pixel at (441, 74) then Renders a white line between points (110, 102) and (178, 30).
; PLAN: r0=441(x), r1=74(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=110(x1), r6=102(y1), r7=178(x2), r8=30(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 74
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 110
LDI r6, 102
LDI r7, 178
LDI r8, 30
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
