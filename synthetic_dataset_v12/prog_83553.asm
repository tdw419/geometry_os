; DESCRIPTION: Renders a purple line between points (356, 121) and (318, 133).
; PLAN: r0=356(x1), r1=121(y1), r2=318(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 121
LDI r2, 318
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
