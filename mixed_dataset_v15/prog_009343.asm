; DESCRIPTION: Renders a purple line between points (358, 165) and (407, 114).
; PLAN: r0=358(x1), r1=165(y1), r2=407(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 165
LDI r2, 407
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
