; DESCRIPTION: Places a white line segment connecting (136, 175) to (43, 102).
; PLAN: r0=136(x1), r1=175(y1), r2=43(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 175
LDI r2, 43
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
