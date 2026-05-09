; DESCRIPTION: Places a blue line segment connecting (71, 160) to (244, 88).
; PLAN: r0=71(x1), r1=160(y1), r2=244(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 160
LDI r2, 244
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
