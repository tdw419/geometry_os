; DESCRIPTION: Places a orange line segment connecting (167, 218) to (257, 2).
; PLAN: r0=167(x1), r1=218(y1), r2=257(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 218
LDI r2, 257
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
