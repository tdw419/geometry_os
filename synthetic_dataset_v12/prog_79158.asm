; DESCRIPTION: Places a white line segment connecting (227, 9) to (266, 0).
; PLAN: r0=227(x1), r1=9(y1), r2=266(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 9
LDI r2, 266
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
