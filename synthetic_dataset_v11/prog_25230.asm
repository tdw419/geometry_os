; DESCRIPTION: Places a white line segment connecting (201, 105) to (236, 205).
; PLAN: r0=201(x1), r1=105(y1), r2=236(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 105
LDI r2, 236
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
