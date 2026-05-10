; DESCRIPTION: Places a blue line segment connecting (178, 88) to (455, 3).
; PLAN: r0=178(x1), r1=88(y1), r2=455(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 88
LDI r2, 455
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
