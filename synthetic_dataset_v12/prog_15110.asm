; DESCRIPTION: Places a blue line segment connecting (478, 45) to (259, 133).
; PLAN: r0=478(x1), r1=45(y1), r2=259(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 45
LDI r2, 259
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
