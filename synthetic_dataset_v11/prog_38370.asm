; DESCRIPTION: Places a black line segment connecting (240, 100) to (221, 1).
; PLAN: r0=240(x1), r1=100(y1), r2=221(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 100
LDI r2, 221
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
