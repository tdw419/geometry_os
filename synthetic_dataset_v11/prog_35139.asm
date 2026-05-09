; DESCRIPTION: Renders a blue line between points (118, 124) and (39, 133).
; PLAN: r0=118(x1), r1=124(y1), r2=39(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 124
LDI r2, 39
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
