; DESCRIPTION: Renders a purple line between points (191, 109) and (159, 122).
; PLAN: r0=191(x1), r1=109(y1), r2=159(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 109
LDI r2, 159
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
