; DESCRIPTION: Composite: . Then Places a orange line segment connecting (49, 83) to (104, 120). Then Sets a single purple pixel at (122, 99).
; PLAN: r0=49(x1), r1=83(y1), r2=104(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=122(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (49, 83) to (104, 120).
; PLAN: r0=49(x1), r1=83(y1), r2=104(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 83
LDI r2, 104
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (122, 99).
; PLAN: r0=122(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
