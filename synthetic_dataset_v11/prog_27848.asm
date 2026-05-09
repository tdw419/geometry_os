; DESCRIPTION: Renders a blue line between points (194, 118) and (40, 14).
; PLAN: r0=194(x1), r1=118(y1), r2=40(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 118
LDI r2, 40
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
