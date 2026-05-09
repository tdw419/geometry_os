; DESCRIPTION: Places a orange line segment connecting (453, 219) to (223, 233).
; PLAN: r0=453(x1), r1=219(y1), r2=223(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 219
LDI r2, 223
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
