; DESCRIPTION: Places a white line segment connecting (129, 76) to (88, 77).
; PLAN: r0=129(x1), r1=76(y1), r2=88(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 76
LDI r2, 88
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
