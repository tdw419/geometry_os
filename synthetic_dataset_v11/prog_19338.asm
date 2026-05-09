; DESCRIPTION: Renders a blue line between points (185, 109) and (55, 106).
; PLAN: r0=185(x1), r1=109(y1), r2=55(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 109
LDI r2, 55
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
