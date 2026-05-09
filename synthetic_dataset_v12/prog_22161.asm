; DESCRIPTION: Composite: Renders a purple line between points (41, 23) and (311, 49) then Sets a single green pixel at (68, 47).
; PLAN: r0=41(x1), r1=23(y1), r2=311(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=47(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 23
LDI r2, 311
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 47
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
