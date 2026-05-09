; DESCRIPTION: Renders a purple line between points (104, 34) and (74, 49).
; PLAN: r0=104(x1), r1=34(y1), r2=74(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 34
LDI r2, 74
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
