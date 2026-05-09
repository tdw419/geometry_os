; DESCRIPTION: Composite: Sets a single purple pixel at (238, 85) then Draws a white line from (119, 89) to (59, 86).
; PLAN: r0=238(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=119(x1), r6=89(y1), r7=59(x2), r8=86(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 85
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 89
LDI r7, 59
LDI r8, 86
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
