; DESCRIPTION: Places a orange line segment connecting (157, 169) to (129, 184).
; PLAN: r0=157(x1), r1=169(y1), r2=129(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 169
LDI r2, 129
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
