; DESCRIPTION: Places a white line segment connecting (343, 123) to (257, 84).
; PLAN: r0=343(x1), r1=123(y1), r2=257(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 123
LDI r2, 257
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
