; DESCRIPTION: Renders a blue line between points (234, 216) and (81, 118).
; PLAN: r0=234(x1), r1=216(y1), r2=81(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 216
LDI r2, 81
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
