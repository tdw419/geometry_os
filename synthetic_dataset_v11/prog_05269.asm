; DESCRIPTION: Renders a purple line between points (7, 241) and (158, 183).
; PLAN: r0=7(x1), r1=241(y1), r2=158(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 241
LDI r2, 158
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
