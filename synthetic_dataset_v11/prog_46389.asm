; DESCRIPTION: Places a white line segment connecting (77, 148) to (37, 121).
; PLAN: r0=77(x1), r1=148(y1), r2=37(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 148
LDI r2, 37
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
