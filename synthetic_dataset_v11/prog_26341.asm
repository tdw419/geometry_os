; DESCRIPTION: Places a white line segment connecting (112, 175) to (49, 130).
; PLAN: r0=112(x1), r1=175(y1), r2=49(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 175
LDI r2, 49
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
