; DESCRIPTION: Places a orange line segment connecting (257, 198) to (231, 62).
; PLAN: r0=257(x1), r1=198(y1), r2=231(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 198
LDI r2, 231
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
