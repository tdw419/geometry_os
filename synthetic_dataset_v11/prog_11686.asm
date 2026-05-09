; DESCRIPTION: Places a blue line segment connecting (214, 198) to (227, 90).
; PLAN: r0=214(x1), r1=198(y1), r2=227(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 198
LDI r2, 227
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
