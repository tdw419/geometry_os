; DESCRIPTION: Renders a purple line between points (141, 51) and (246, 61).
; PLAN: r0=141(x1), r1=51(y1), r2=246(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 51
LDI r2, 246
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
