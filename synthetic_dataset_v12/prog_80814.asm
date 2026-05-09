; DESCRIPTION: Places a blue line segment connecting (289, 157) to (381, 58).
; PLAN: r0=289(x1), r1=157(y1), r2=381(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 157
LDI r2, 381
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
