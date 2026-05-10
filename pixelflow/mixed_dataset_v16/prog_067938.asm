; DESCRIPTION: Renders a black line between points (133, 88) and (490, 102).
; PLAN: r0=133(x1), r1=88(y1), r2=490(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 88
LDI r2, 490
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
