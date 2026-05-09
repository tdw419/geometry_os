; DESCRIPTION: Renders a purple line between points (472, 121) and (73, 49).
; PLAN: r0=472(x1), r1=121(y1), r2=73(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 121
LDI r2, 73
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
