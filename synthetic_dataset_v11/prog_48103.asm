; DESCRIPTION: Composite: . Then Draws a purple line from (17, 19) to (172, 72). Then Sets a single red pixel at (62, 11).
; PLAN: r0=17(x1), r1=19(y1), r2=172(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple line from (17, 19) to (172, 72).
; PLAN: r0=17(x1), r1=19(y1), r2=172(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 19
LDI r2, 172
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (62, 11).
; PLAN: r0=62(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 62
LDI r1, 11
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
