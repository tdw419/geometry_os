; DESCRIPTION: Composite: . Then Renders a orange line between points (88, 118) and (118, 153). Then Sets a single yellow pixel at (87, 140).
; PLAN: r0=88(x1), r1=118(y1), r2=118(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=87(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (88, 118) and (118, 153).
; PLAN: r0=88(x1), r1=118(y1), r2=118(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 118
LDI r2, 118
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (87, 140).
; PLAN: r0=87(x), r1=140(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 140
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
