; DESCRIPTION: Places a blue line segment connecting (325, 88) to (310, 8).
; PLAN: r0=325(x1), r1=88(y1), r2=310(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 88
LDI r2, 310
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
