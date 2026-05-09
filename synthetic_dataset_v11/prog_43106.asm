; DESCRIPTION: Renders a purple line between points (212, 24) and (204, 11).
; PLAN: r0=212(x1), r1=24(y1), r2=204(x2), r3=11(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 24
LDI r2, 204
LDI r3, 11
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
