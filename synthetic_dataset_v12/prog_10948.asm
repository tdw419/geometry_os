; DESCRIPTION: Places a purple line segment connecting (241, 232) to (453, 222).
; PLAN: r0=241(x1), r1=232(y1), r2=453(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 232
LDI r2, 453
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
