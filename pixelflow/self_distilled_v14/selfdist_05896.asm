; DESCRIPTION: Renders a purple line segment connecting (241, 121) to (349, 118).
; PLAN: r0=241(x1), r1=121(y1), r2=349(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 121
LDI r2, 349
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
