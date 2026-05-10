; DESCRIPTION: Renders a purple line between points (459, 104) and (322, 25).
; PLAN: r0=459(x1), r1=104(y1), r2=322(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 104
LDI r2, 322
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
