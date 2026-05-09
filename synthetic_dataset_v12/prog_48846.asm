; DESCRIPTION: Places a orange line segment connecting (63, 99) to (474, 62).
; PLAN: r0=63(x1), r1=99(y1), r2=474(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 99
LDI r2, 474
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
