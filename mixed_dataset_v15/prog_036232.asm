; DESCRIPTION: Composite: Sets a single red pixel at (285, 139) then Renders a blue line between points (413, 1) and (48, 93).
; PLAN: r0=285(x), r1=139(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=413(x1), r6=1(y1), r7=48(x2), r8=93(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 139
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 413
LDI r6, 1
LDI r7, 48
LDI r8, 93
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
