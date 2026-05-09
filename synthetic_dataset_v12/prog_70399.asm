; DESCRIPTION: Places a blue line segment connecting (454, 110) to (324, 135).
; PLAN: r0=454(x1), r1=110(y1), r2=324(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 110
LDI r2, 324
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
