; DESCRIPTION: Renders a purple line between points (192, 161) and (10, 133).
; PLAN: r0=192(x1), r1=161(y1), r2=10(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 161
LDI r2, 10
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
