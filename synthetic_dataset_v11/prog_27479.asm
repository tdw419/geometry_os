; DESCRIPTION: Places a purple line segment connecting (184, 155) to (192, 152).
; PLAN: r0=184(x1), r1=155(y1), r2=192(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 155
LDI r2, 192
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
