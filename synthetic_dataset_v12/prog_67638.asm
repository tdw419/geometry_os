; DESCRIPTION: Places a white line segment connecting (131, 8) to (339, 119).
; PLAN: r0=131(x1), r1=8(y1), r2=339(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 8
LDI r2, 339
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
