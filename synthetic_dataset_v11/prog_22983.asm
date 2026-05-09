; DESCRIPTION: Renders a blue line between points (29, 19) and (84, 62).
; PLAN: r0=29(x1), r1=19(y1), r2=84(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 19
LDI r2, 84
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
