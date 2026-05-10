; DESCRIPTION: Places a white line segment connecting (43, 169) to (461, 61).
; PLAN: r0=43(x1), r1=169(y1), r2=461(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 169
LDI r2, 461
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
