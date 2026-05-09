; DESCRIPTION: Places a white line segment connecting (241, 83) to (78, 97).
; PLAN: r0=241(x1), r1=83(y1), r2=78(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 83
LDI r2, 78
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
