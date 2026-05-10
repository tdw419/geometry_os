; DESCRIPTION: Places a black line segment connecting (117, 37) to (476, 148).
; PLAN: r0=117(x1), r1=37(y1), r2=476(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 37
LDI r2, 476
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
