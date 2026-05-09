; DESCRIPTION: Places a blue line segment connecting (105, 53) to (53, 56).
; PLAN: r0=105(x1), r1=53(y1), r2=53(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 53
LDI r2, 53
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
