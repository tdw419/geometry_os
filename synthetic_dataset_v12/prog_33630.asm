; DESCRIPTION: Renders a blue line between points (62, 124) and (353, 74).
; PLAN: r0=62(x1), r1=124(y1), r2=353(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 124
LDI r2, 353
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
