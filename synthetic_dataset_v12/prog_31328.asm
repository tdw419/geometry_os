; DESCRIPTION: Places a white line segment connecting (302, 75) to (270, 78).
; PLAN: r0=302(x1), r1=75(y1), r2=270(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 75
LDI r2, 270
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
