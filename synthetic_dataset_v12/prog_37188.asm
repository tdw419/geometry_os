; DESCRIPTION: Places a orange line segment connecting (43, 28) to (231, 49).
; PLAN: r0=43(x1), r1=28(y1), r2=231(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 28
LDI r2, 231
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
