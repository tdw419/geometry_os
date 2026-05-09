; DESCRIPTION: Places a orange line segment connecting (184, 218) to (47, 120).
; PLAN: r0=184(x1), r1=218(y1), r2=47(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 218
LDI r2, 47
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
