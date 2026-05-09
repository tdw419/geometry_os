; DESCRIPTION: Renders a blue line between points (3, 195) and (155, 169).
; PLAN: r0=3(x1), r1=195(y1), r2=155(x2), r3=169(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 195
LDI r2, 155
LDI r3, 169
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
