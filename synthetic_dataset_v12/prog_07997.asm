; DESCRIPTION: Places a blue line segment connecting (13, 35) to (76, 183).
; PLAN: r0=13(x1), r1=35(y1), r2=76(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 35
LDI r2, 76
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
