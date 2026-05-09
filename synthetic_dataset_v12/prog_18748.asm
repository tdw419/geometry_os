; DESCRIPTION: Places a yellow line segment connecting (232, 238) to (142, 63).
; PLAN: r0=232(x1), r1=238(y1), r2=142(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 238
LDI r2, 142
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
