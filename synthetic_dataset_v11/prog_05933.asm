; DESCRIPTION: Renders a blue line between points (226, 105) and (68, 119).
; PLAN: r0=226(x1), r1=105(y1), r2=68(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 105
LDI r2, 68
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
