; DESCRIPTION: Places a white line segment connecting (144, 20) to (163, 217).
; PLAN: r0=144(x1), r1=20(y1), r2=163(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 20
LDI r2, 163
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
