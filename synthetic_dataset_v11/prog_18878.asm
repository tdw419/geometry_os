; DESCRIPTION: Renders a purple line between points (149, 76) and (86, 165).
; PLAN: r0=149(x1), r1=76(y1), r2=86(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 76
LDI r2, 86
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
