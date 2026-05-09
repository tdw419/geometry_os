; DESCRIPTION: Renders a purple line between points (50, 155) and (172, 183).
; PLAN: r0=50(x1), r1=155(y1), r2=172(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 155
LDI r2, 172
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
