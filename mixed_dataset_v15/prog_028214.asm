; DESCRIPTION: Renders a blue line between points (311, 112) and (53, 230).
; PLAN: r0=311(x1), r1=112(y1), r2=53(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 112
LDI r2, 53
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
