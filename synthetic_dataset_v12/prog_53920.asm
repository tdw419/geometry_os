; DESCRIPTION: Places a green line segment connecting (222, 52) to (348, 31).
; PLAN: r0=222(x1), r1=52(y1), r2=348(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 52
LDI r2, 348
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
