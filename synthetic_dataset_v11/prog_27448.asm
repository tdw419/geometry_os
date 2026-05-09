; DESCRIPTION: Places a white line segment connecting (194, 145) to (97, 188).
; PLAN: r0=194(x1), r1=145(y1), r2=97(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 145
LDI r2, 97
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
