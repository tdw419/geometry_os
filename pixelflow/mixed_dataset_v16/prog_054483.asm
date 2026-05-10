; DESCRIPTION: Composite: Places a white dot at position (180, 45) then Renders a purple line between points (184, 169) and (169, 248).
; PLAN: r0=180(x), r1=45(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=184(x1), r6=169(y1), r7=169(x2), r8=248(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 45
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 184
LDI r6, 169
LDI r7, 169
LDI r8, 248
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
