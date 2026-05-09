; DESCRIPTION: Places a blue line segment connecting (288, 227) to (436, 9).
; PLAN: r0=288(x1), r1=227(y1), r2=436(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 227
LDI r2, 436
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
