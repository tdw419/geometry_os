; DESCRIPTION: Composite: . Then Renders a purple line between points (76, 5) and (121, 110). Then Sets a single orange pixel at (203, 112).
; PLAN: r0=76(x1), r1=5(y1), r2=121(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=203(x), r1=112(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (76, 5) and (121, 110).
; PLAN: r0=76(x1), r1=5(y1), r2=121(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 5
LDI r2, 121
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (203, 112).
; PLAN: r0=203(x), r1=112(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 112
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
