; DESCRIPTION: Places a white line segment connecting (114, 119) to (43, 205).
; PLAN: r0=114(x1), r1=119(y1), r2=43(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 119
LDI r2, 43
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
