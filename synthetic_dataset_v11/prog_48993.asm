; DESCRIPTION: Renders a purple line between points (95, 62) and (73, 53).
; PLAN: r0=95(x1), r1=62(y1), r2=73(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 62
LDI r2, 73
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
