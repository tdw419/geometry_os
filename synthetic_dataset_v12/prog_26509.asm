; DESCRIPTION: Composite: Places a black dot at position (96, 211) then Renders a purple line between points (429, 163) and (297, 112).
; PLAN: r0=96(x), r1=211(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=429(x1), r6=163(y1), r7=297(x2), r8=112(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 211
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 429
LDI r6, 163
LDI r7, 297
LDI r8, 112
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
