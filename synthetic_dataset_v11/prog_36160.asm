; DESCRIPTION: Composite: . Then Renders a orange line between points (67, 1) and (51, 122). Then Sets a single purple pixel at (26, 44).
; PLAN: r0=67(x1), r1=1(y1), r2=51(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=26(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (67, 1) and (51, 122).
; PLAN: r0=67(x1), r1=1(y1), r2=51(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 1
LDI r2, 51
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (26, 44).
; PLAN: r0=26(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
