; DESCRIPTION: Places a blue line segment connecting (222, 119) to (354, 188).
; PLAN: r0=222(x1), r1=119(y1), r2=354(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 119
LDI r2, 354
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
