; DESCRIPTION: Renders a purple line between points (188, 80) and (288, 128).
; PLAN: r0=188(x1), r1=80(y1), r2=288(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 80
LDI r2, 288
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
