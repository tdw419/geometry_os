; DESCRIPTION: Renders a purple line between points (104, 83) and (185, 95).
; PLAN: r0=104(x1), r1=83(y1), r2=185(x2), r3=95(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 83
LDI r2, 185
LDI r3, 95
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
