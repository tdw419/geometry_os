; DESCRIPTION: Places a blue line segment connecting (484, 33) to (412, 198).
; PLAN: r0=484(x1), r1=33(y1), r2=412(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 33
LDI r2, 412
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
