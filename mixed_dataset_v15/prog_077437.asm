; DESCRIPTION: Places a black line segment connecting (476, 5) to (504, 255).
; PLAN: r0=476(x1), r1=5(y1), r2=504(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 5
LDI r2, 504
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
