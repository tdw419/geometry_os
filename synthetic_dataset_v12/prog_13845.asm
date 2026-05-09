; DESCRIPTION: Composite: Sets a single green pixel at (490, 247) then Draws a green line from (86, 109) to (107, 250).
; PLAN: r0=490(x), r1=247(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=86(x1), r6=109(y1), r7=107(x2), r8=250(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 490
LDI r1, 247
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 86
LDI r6, 109
LDI r7, 107
LDI r8, 250
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
