; DESCRIPTION: Places a blue line segment connecting (418, 88) to (466, 30).
; PLAN: r0=418(x1), r1=88(y1), r2=466(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 88
LDI r2, 466
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
