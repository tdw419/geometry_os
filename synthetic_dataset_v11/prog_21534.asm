; DESCRIPTION: Places a white line segment connecting (155, 10) to (34, 97).
; PLAN: r0=155(x1), r1=10(y1), r2=34(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 10
LDI r2, 34
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
