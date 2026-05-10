; DESCRIPTION: Renders a purple line between points (473, 118) and (149, 33).
; PLAN: r0=473(x1), r1=118(y1), r2=149(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 118
LDI r2, 149
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
