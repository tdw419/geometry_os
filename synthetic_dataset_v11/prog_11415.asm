; DESCRIPTION: Places a blue line segment connecting (64, 114) to (153, 53).
; PLAN: r0=64(x1), r1=114(y1), r2=153(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 114
LDI r2, 153
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
