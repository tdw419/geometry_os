; DESCRIPTION: Places a orange line segment connecting (382, 24) to (476, 42).
; PLAN: r0=382(x1), r1=24(y1), r2=476(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 24
LDI r2, 476
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
