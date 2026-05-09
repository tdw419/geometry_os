; DESCRIPTION: Places a blue line segment connecting (53, 63) to (49, 35).
; PLAN: r0=53(x1), r1=63(y1), r2=49(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 63
LDI r2, 49
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
