; DESCRIPTION: Renders a black line between points (84, 158) and (15, 201).
; PLAN: r0=84(x1), r1=158(y1), r2=15(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 158
LDI r2, 15
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
