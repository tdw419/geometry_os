; DESCRIPTION: Renders a blue line between points (266, 185) and (153, 106).
; PLAN: r0=266(x1), r1=185(y1), r2=153(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 185
LDI r2, 153
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
