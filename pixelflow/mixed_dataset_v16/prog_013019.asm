; DESCRIPTION: Renders a purple line between points (95, 102) and (381, 165).
; PLAN: r0=95(x1), r1=102(y1), r2=381(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 102
LDI r2, 381
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
