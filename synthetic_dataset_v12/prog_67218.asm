; DESCRIPTION: Places a blue line segment connecting (2, 240) to (441, 39).
; PLAN: r0=2(x1), r1=240(y1), r2=441(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 240
LDI r2, 441
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
