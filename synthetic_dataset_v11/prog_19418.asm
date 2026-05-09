; DESCRIPTION: Places a orange line segment connecting (58, 128) to (231, 179).
; PLAN: r0=58(x1), r1=128(y1), r2=231(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 128
LDI r2, 231
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
