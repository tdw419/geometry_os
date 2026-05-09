; DESCRIPTION: Places a blue line segment connecting (142, 128) to (222, 22).
; PLAN: r0=142(x1), r1=128(y1), r2=222(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 128
LDI r2, 222
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
