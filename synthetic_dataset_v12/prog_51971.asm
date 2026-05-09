; DESCRIPTION: Places a blue line segment connecting (123, 198) to (442, 156).
; PLAN: r0=123(x1), r1=198(y1), r2=442(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 198
LDI r2, 442
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
