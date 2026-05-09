; DESCRIPTION: Places a black line segment connecting (119, 158) to (233, 233).
; PLAN: r0=119(x1), r1=158(y1), r2=233(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 158
LDI r2, 233
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
