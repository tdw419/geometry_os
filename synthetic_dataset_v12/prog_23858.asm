; DESCRIPTION: Places a orange line segment connecting (317, 105) to (174, 227).
; PLAN: r0=317(x1), r1=105(y1), r2=174(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 105
LDI r2, 174
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
