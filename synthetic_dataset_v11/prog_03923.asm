; DESCRIPTION: Places a blue line segment connecting (114, 53) to (232, 37).
; PLAN: r0=114(x1), r1=53(y1), r2=232(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 53
LDI r2, 232
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
