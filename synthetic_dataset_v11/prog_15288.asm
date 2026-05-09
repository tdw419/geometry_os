; DESCRIPTION: Renders a purple line between points (115, 3) and (29, 99).
; PLAN: r0=115(x1), r1=3(y1), r2=29(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 3
LDI r2, 29
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
