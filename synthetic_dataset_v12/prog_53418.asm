; DESCRIPTION: Places a white line segment connecting (302, 66) to (335, 3).
; PLAN: r0=302(x1), r1=66(y1), r2=335(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 66
LDI r2, 335
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
