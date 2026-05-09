; DESCRIPTION: Renders a purple line between points (96, 222) and (119, 120).
; PLAN: r0=96(x1), r1=222(y1), r2=119(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 222
LDI r2, 119
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
