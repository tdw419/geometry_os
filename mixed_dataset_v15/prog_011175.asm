; DESCRIPTION: Composite: Sets a single magenta pixel at (369, 81) then Renders a red line between points (110, 78) and (479, 201).
; PLAN: r0=369(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=110(x1), r6=78(y1), r7=479(x2), r8=201(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 81
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 110
LDI r6, 78
LDI r7, 479
LDI r8, 201
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
