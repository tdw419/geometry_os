; DESCRIPTION: Renders a purple line between points (172, 251) and (159, 232).
; PLAN: r0=172(x1), r1=251(y1), r2=159(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 251
LDI r2, 159
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
