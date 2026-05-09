; DESCRIPTION: Places a black line segment connecting (118, 118) to (163, 142).
; PLAN: r0=118(x1), r1=118(y1), r2=163(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 118
LDI r2, 163
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
