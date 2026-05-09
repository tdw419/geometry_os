; DESCRIPTION: Renders a blue line between points (47, 143) and (62, 163).
; PLAN: r0=47(x1), r1=143(y1), r2=62(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 143
LDI r2, 62
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
