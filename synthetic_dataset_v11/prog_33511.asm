; DESCRIPTION: Composite: . Then Sets a single purple pixel at (122, 97). Then Places a white line segment connecting (26, 41) to (15, 200).
; PLAN: r0=122(x), r1=97(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=26(x1), r1=41(y1), r2=15(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (122, 97).
; PLAN: r0=122(x), r1=97(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 97
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a white line segment connecting (26, 41) to (15, 200).
; PLAN: r0=26(x1), r1=41(y1), r2=15(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 41
LDI r2, 15
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
