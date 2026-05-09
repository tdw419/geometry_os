; DESCRIPTION: Renders a magenta line between points (402, 29) and (159, 119).
; PLAN: r0=402(x1), r1=29(y1), r2=159(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 29
LDI r2, 159
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
