; DESCRIPTION: Renders a blue line between points (395, 158) and (121, 255).
; PLAN: r0=395(x1), r1=158(y1), r2=121(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 158
LDI r2, 121
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
