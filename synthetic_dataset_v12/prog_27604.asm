; DESCRIPTION: Places a green line segment connecting (332, 83) to (476, 101).
; PLAN: r0=332(x1), r1=83(y1), r2=476(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 83
LDI r2, 476
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
