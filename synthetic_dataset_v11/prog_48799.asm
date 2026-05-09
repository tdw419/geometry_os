; DESCRIPTION: Places a orange line segment connecting (192, 76) to (143, 0).
; PLAN: r0=192(x1), r1=76(y1), r2=143(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 76
LDI r2, 143
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
