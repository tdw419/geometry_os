; DESCRIPTION: Places a blue line segment connecting (353, 3) to (454, 194).
; PLAN: r0=353(x1), r1=3(y1), r2=454(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 3
LDI r2, 454
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
