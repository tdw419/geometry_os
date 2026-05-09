; DESCRIPTION: Places a blue line segment connecting (44, 248) to (414, 155).
; PLAN: r0=44(x1), r1=248(y1), r2=414(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 248
LDI r2, 414
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
