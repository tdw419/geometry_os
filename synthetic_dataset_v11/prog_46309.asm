; DESCRIPTION: Renders a purple line between points (55, 70) and (101, 142).
; PLAN: r0=55(x1), r1=70(y1), r2=101(x2), r3=142(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 70
LDI r2, 101
LDI r3, 142
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
