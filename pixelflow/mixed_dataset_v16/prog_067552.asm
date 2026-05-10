; DESCRIPTION: Places a white line segment connecting (339, 20) to (490, 119).
; PLAN: r0=339(x1), r1=20(y1), r2=490(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 20
LDI r2, 490
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
