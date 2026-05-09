; DESCRIPTION: Places a blue line segment connecting (43, 84) to (289, 217).
; PLAN: r0=43(x1), r1=84(y1), r2=289(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 84
LDI r2, 289
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
