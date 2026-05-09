; DESCRIPTION: Places a blue line segment connecting (453, 0) to (149, 88).
; PLAN: r0=453(x1), r1=0(y1), r2=149(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 0
LDI r2, 149
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
