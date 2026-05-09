; DESCRIPTION: Places a white line segment connecting (163, 175) to (423, 229).
; PLAN: r0=163(x1), r1=175(y1), r2=423(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 175
LDI r2, 423
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
