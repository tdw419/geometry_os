; DESCRIPTION: Composite: Sets a single red pixel at (436, 162) then Renders a red line between points (69, 185) and (118, 93).
; PLAN: r0=436(x), r1=162(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=69(x1), r6=185(y1), r7=118(x2), r8=93(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 162
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 69
LDI r6, 185
LDI r7, 118
LDI r8, 93
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
