; DESCRIPTION: Places a white line segment connecting (89, 218) to (407, 127).
; PLAN: r0=89(x1), r1=218(y1), r2=407(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 218
LDI r2, 407
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
