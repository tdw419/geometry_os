; DESCRIPTION: Renders a blue line between points (14, 177) and (169, 197).
; PLAN: r0=14(x1), r1=177(y1), r2=169(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 177
LDI r2, 169
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
