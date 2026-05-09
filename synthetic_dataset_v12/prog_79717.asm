; DESCRIPTION: Composite: Sets a single purple pixel at (343, 184) then Draws a cyan line from (102, 199) to (358, 78).
; PLAN: r0=343(x), r1=184(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=102(x1), r6=199(y1), r7=358(x2), r8=78(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 184
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 102
LDI r6, 199
LDI r7, 358
LDI r8, 78
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
