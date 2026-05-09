; DESCRIPTION: Places a blue line segment connecting (91, 142) to (119, 94).
; PLAN: r0=91(x1), r1=142(y1), r2=119(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 142
LDI r2, 119
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
