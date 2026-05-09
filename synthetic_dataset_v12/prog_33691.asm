; DESCRIPTION: Renders a blue line between points (159, 141) and (131, 197).
; PLAN: r0=159(x1), r1=141(y1), r2=131(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 141
LDI r2, 131
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
