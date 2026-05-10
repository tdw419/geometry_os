; DESCRIPTION: Places a blue line segment connecting (137, 30) to (496, 240).
; PLAN: r0=137(x1), r1=30(y1), r2=496(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 30
LDI r2, 496
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
