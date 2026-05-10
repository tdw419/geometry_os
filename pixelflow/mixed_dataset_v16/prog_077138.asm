; DESCRIPTION: Places a blue line segment connecting (412, 88) to (258, 166).
; PLAN: r0=412(x1), r1=88(y1), r2=258(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 88
LDI r2, 258
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
