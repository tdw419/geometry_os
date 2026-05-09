; DESCRIPTION: Renders a blue line between points (432, 175) and (161, 230).
; PLAN: r0=432(x1), r1=175(y1), r2=161(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 175
LDI r2, 161
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
