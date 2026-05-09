; DESCRIPTION: Places a orange line segment connecting (325, 210) to (497, 241).
; PLAN: r0=325(x1), r1=210(y1), r2=497(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 210
LDI r2, 497
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
