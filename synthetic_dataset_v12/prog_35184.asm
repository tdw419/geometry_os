; DESCRIPTION: Renders a purple line between points (159, 238) and (211, 126).
; PLAN: r0=159(x1), r1=238(y1), r2=211(x2), r3=126(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 238
LDI r2, 211
LDI r3, 126
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
