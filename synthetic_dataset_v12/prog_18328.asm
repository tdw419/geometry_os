; DESCRIPTION: Renders a blue line between points (318, 71) and (109, 139).
; PLAN: r0=318(x1), r1=71(y1), r2=109(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 71
LDI r2, 109
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
