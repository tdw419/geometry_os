; DESCRIPTION: Renders a blue line between points (74, 184) and (161, 130).
; PLAN: r0=74(x1), r1=184(y1), r2=161(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 184
LDI r2, 161
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
