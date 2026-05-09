; DESCRIPTION: Composite: . Then Sets a single purple pixel at (110, 219). Then Places a orange line segment connecting (114, 4) to (61, 136).
; PLAN: r0=110(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=114(x1), r1=4(y1), r2=61(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (110, 219).
; PLAN: r0=110(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 219
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a orange line segment connecting (114, 4) to (61, 136).
; PLAN: r0=114(x1), r1=4(y1), r2=61(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 4
LDI r2, 61
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
