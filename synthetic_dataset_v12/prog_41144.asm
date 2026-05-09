; DESCRIPTION: Places a purple line segment connecting (214, 198) to (203, 155).
; PLAN: r0=214(x1), r1=198(y1), r2=203(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 198
LDI r2, 203
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
