; DESCRIPTION: Renders a purple line between points (190, 58) and (49, 29).
; PLAN: r0=190(x1), r1=58(y1), r2=49(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 58
LDI r2, 49
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
