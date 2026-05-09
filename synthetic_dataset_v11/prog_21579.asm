; DESCRIPTION: Renders a purple line between points (53, 92) and (55, 192).
; PLAN: r0=53(x1), r1=92(y1), r2=55(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 92
LDI r2, 55
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
