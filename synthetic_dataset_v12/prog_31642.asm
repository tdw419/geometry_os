; DESCRIPTION: Renders a purple line between points (244, 171) and (93, 145).
; PLAN: r0=244(x1), r1=171(y1), r2=93(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 171
LDI r2, 93
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
