; DESCRIPTION: Places a black line segment connecting (24, 1) to (428, 163).
; PLAN: r0=24(x1), r1=1(y1), r2=428(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 1
LDI r2, 428
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
