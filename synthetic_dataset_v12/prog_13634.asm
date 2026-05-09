; DESCRIPTION: Places a blue line segment connecting (325, 26) to (99, 122).
; PLAN: r0=325(x1), r1=26(y1), r2=99(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 26
LDI r2, 99
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
