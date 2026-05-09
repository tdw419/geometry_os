; DESCRIPTION: Renders a purple line between points (306, 159) and (163, 63).
; PLAN: r0=306(x1), r1=159(y1), r2=163(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 159
LDI r2, 163
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
