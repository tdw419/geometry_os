; DESCRIPTION: Places a green line segment connecting (47, 175) to (137, 22).
; PLAN: r0=47(x1), r1=175(y1), r2=137(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 175
LDI r2, 137
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
