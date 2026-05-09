; DESCRIPTION: Places a orange line segment connecting (112, 105) to (159, 174).
; PLAN: r0=112(x1), r1=105(y1), r2=159(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 105
LDI r2, 159
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
