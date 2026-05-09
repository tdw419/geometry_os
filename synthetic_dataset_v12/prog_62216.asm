; DESCRIPTION: Places a orange line segment connecting (19, 96) to (476, 62).
; PLAN: r0=19(x1), r1=96(y1), r2=476(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 96
LDI r2, 476
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
