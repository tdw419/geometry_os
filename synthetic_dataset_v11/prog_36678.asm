; DESCRIPTION: Places a blue line segment connecting (76, 241) to (161, 53).
; PLAN: r0=76(x1), r1=241(y1), r2=161(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 241
LDI r2, 161
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
