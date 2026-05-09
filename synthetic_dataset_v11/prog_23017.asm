; DESCRIPTION: Renders a purple line between points (69, 192) and (194, 100).
; PLAN: r0=69(x1), r1=192(y1), r2=194(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 192
LDI r2, 194
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
