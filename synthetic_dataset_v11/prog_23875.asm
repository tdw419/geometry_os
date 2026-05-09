; DESCRIPTION: Renders a blue line between points (159, 50) and (53, 254).
; PLAN: r0=159(x1), r1=50(y1), r2=53(x2), r3=254(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 50
LDI r2, 53
LDI r3, 254
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
