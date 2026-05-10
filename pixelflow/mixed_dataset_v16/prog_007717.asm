; DESCRIPTION: Renders a blue line between points (56, 81) and (461, 197).
; PLAN: r0=56(x1), r1=81(y1), r2=461(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 81
LDI r2, 461
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
