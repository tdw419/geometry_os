; DESCRIPTION: Places a white line segment connecting (34, 169) to (129, 232).
; PLAN: r0=34(x1), r1=169(y1), r2=129(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 169
LDI r2, 129
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
