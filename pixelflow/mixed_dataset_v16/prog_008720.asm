; DESCRIPTION: Places a blue line segment connecting (375, 227) to (365, 53).
; PLAN: r0=375(x1), r1=227(y1), r2=365(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 227
LDI r2, 365
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
