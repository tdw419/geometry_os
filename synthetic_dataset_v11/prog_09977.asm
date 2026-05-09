; DESCRIPTION: Composite: . Then Renders a black line between points (42, 96) and (159, 66). Then Sets a single red pixel at (161, 123).
; PLAN: r0=42(x1), r1=96(y1), r2=159(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=161(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (42, 96) and (159, 66).
; PLAN: r0=42(x1), r1=96(y1), r2=159(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 96
LDI r2, 159
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (161, 123).
; PLAN: r0=161(x), r1=123(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 123
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
