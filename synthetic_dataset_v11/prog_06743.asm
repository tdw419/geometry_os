; DESCRIPTION: Places a orange line segment connecting (192, 32) to (232, 8).
; PLAN: r0=192(x1), r1=32(y1), r2=232(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 32
LDI r2, 232
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
