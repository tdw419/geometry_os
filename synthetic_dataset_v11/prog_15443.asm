; DESCRIPTION: Renders a purple line between points (183, 241) and (34, 43).
; PLAN: r0=183(x1), r1=241(y1), r2=34(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 241
LDI r2, 34
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
