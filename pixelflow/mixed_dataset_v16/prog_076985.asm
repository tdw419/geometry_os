; DESCRIPTION: Places a orange line segment connecting (34, 188) to (107, 112).
; PLAN: r0=34(x1), r1=188(y1), r2=107(x2), r3=112(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 188
LDI r2, 107
LDI r3, 112
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
