; DESCRIPTION: Composite: Draws a red line from (358, 199) to (115, 241) then Sets a single green pixel at (297, 57).
; PLAN: r0=358(x1), r1=199(y1), r2=115(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=57(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 358
LDI r1, 199
LDI r2, 115
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 57
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
