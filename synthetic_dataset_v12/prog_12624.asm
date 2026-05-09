; DESCRIPTION: Places a white line segment connecting (77, 227) to (3, 60).
; PLAN: r0=77(x1), r1=227(y1), r2=3(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 227
LDI r2, 3
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
