; DESCRIPTION: Places a white line segment connecting (444, 183) to (508, 205).
; PLAN: r0=444(x1), r1=183(y1), r2=508(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 183
LDI r2, 508
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
