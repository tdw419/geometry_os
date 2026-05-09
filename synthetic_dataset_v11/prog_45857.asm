; DESCRIPTION: Places a white line segment connecting (34, 251) to (89, 180).
; PLAN: r0=34(x1), r1=251(y1), r2=89(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 251
LDI r2, 89
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
