; DESCRIPTION: Renders a blue line between points (29, 70) and (227, 142).
; PLAN: r0=29(x1), r1=70(y1), r2=227(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 70
LDI r2, 227
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
