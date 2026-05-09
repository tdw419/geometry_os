; DESCRIPTION: Places a black line segment connecting (476, 239) to (85, 49).
; PLAN: r0=476(x1), r1=239(y1), r2=85(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 239
LDI r2, 85
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
