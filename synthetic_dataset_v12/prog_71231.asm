; DESCRIPTION: Places a orange line segment connecting (53, 160) to (257, 1).
; PLAN: r0=53(x1), r1=160(y1), r2=257(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 160
LDI r2, 257
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
