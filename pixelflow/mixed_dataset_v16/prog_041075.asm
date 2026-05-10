; DESCRIPTION: Places a orange line segment connecting (252, 86) to (257, 206).
; PLAN: r0=252(x1), r1=86(y1), r2=257(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 86
LDI r2, 257
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
