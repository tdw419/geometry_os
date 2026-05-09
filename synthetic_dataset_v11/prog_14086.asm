; DESCRIPTION: Places a white line segment connecting (78, 211) to (223, 77).
; PLAN: r0=78(x1), r1=211(y1), r2=223(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 211
LDI r2, 223
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
