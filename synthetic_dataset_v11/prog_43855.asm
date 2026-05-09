; DESCRIPTION: Renders a purple line between points (14, 104) and (35, 29).
; PLAN: r0=14(x1), r1=104(y1), r2=35(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 104
LDI r2, 35
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
