; DESCRIPTION: Renders a blue line between points (139, 55) and (129, 168).
; PLAN: r0=139(x1), r1=55(y1), r2=129(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 55
LDI r2, 129
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
