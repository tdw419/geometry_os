; DESCRIPTION: Places a purple line segment connecting (48, 88) to (155, 55).
; PLAN: r0=48(x1), r1=88(y1), r2=155(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 88
LDI r2, 155
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
