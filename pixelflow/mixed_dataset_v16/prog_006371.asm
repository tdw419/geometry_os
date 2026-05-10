; DESCRIPTION: Places a blue line segment connecting (431, 48) to (436, 99).
; PLAN: r0=431(x1), r1=48(y1), r2=436(x2), r3=99(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 48
LDI r2, 436
LDI r3, 99
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
