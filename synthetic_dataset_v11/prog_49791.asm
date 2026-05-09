; DESCRIPTION: Renders a blue line between points (159, 138) and (227, 178).
; PLAN: r0=159(x1), r1=138(y1), r2=227(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 138
LDI r2, 227
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
