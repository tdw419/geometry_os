; DESCRIPTION: Places a orange line segment connecting (399, 77) to (208, 244).
; PLAN: r0=399(x1), r1=77(y1), r2=208(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 77
LDI r2, 208
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
