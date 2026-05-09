; DESCRIPTION: Renders a blue line between points (93, 67) and (377, 145).
; PLAN: r0=93(x1), r1=67(y1), r2=377(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 67
LDI r2, 377
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
