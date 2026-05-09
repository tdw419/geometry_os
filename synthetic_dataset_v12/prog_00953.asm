; DESCRIPTION: Renders a blue line between points (177, 20) and (22, 121).
; PLAN: r0=177(x1), r1=20(y1), r2=22(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 20
LDI r2, 22
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
