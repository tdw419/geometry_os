; DESCRIPTION: Composite: . Then Sets a single purple pixel at (204, 69). Then Draws a orange line from (29, 89) to (217, 77).
; PLAN: r0=204(x), r1=69(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=29(x1), r1=89(y1), r2=217(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (204, 69).
; PLAN: r0=204(x), r1=69(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 69
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange line from (29, 89) to (217, 77).
; PLAN: r0=29(x1), r1=89(y1), r2=217(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 89
LDI r2, 217
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
