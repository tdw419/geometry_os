; DESCRIPTION: Places a yellow line segment connecting (399, 75) to (100, 227).
; PLAN: r0=399(x1), r1=75(y1), r2=100(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 75
LDI r2, 100
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
