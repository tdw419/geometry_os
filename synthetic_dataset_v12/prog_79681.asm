; DESCRIPTION: Places a orange line segment connecting (321, 95) to (414, 10).
; PLAN: r0=321(x1), r1=95(y1), r2=414(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 95
LDI r2, 414
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
