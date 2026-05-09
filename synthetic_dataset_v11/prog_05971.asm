; DESCRIPTION: Composite: . Then Renders a orange line between points (22, 70) and (157, 181). Then Sets a single orange pixel at (52, 63).
; PLAN: r0=22(x1), r1=70(y1), r2=157(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=52(x), r1=63(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (22, 70) and (157, 181).
; PLAN: r0=22(x1), r1=70(y1), r2=157(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 70
LDI r2, 157
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (52, 63).
; PLAN: r0=52(x), r1=63(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 63
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
