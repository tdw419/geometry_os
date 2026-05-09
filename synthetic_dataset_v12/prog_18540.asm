; DESCRIPTION: Places a blue line segment connecting (378, 155) to (135, 244).
; PLAN: r0=378(x1), r1=155(y1), r2=135(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 155
LDI r2, 135
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
