; DESCRIPTION: Renders a blue line between points (166, 3) and (139, 133).
; PLAN: r0=166(x1), r1=3(y1), r2=139(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 3
LDI r2, 139
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
