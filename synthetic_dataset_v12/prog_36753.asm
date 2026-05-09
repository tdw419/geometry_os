; DESCRIPTION: Composite: Renders a red line between points (345, 41) and (324, 144) then Sets a single magenta pixel at (162, 130).
; PLAN: r0=345(x1), r1=41(y1), r2=324(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=162(x), r6=130(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 345
LDI r1, 41
LDI r2, 324
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 162
LDI r6, 130
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
