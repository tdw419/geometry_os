; DESCRIPTION: Places a blue line segment connecting (477, 111) to (2, 39).
; PLAN: r0=477(x1), r1=111(y1), r2=2(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 111
LDI r2, 2
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
