; DESCRIPTION: Composite: Sets a single green pixel at (419, 89) then Draws a cyan line from (379, 177) to (70, 101).
; PLAN: r0=419(x), r1=89(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=379(x1), r6=177(y1), r7=70(x2), r8=101(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 89
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 379
LDI r6, 177
LDI r7, 70
LDI r8, 101
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
