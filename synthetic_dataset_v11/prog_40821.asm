; DESCRIPTION: Places a blue line segment connecting (245, 84) to (92, 39).
; PLAN: r0=245(x1), r1=84(y1), r2=92(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 84
LDI r2, 92
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
