; DESCRIPTION: Places a white line segment connecting (106, 218) to (399, 105).
; PLAN: r0=106(x1), r1=218(y1), r2=399(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 218
LDI r2, 399
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
