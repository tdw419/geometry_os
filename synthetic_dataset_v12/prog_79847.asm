; DESCRIPTION: Places a purple line segment connecting (210, 75) to (476, 40).
; PLAN: r0=210(x1), r1=75(y1), r2=476(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 75
LDI r2, 476
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
