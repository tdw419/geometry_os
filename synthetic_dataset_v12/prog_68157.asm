; DESCRIPTION: Places a white line segment connecting (34, 13) to (200, 149).
; PLAN: r0=34(x1), r1=13(y1), r2=200(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 13
LDI r2, 200
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
