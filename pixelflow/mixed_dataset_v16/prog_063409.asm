; DESCRIPTION: Places a orange line segment connecting (476, 144) to (179, 50).
; PLAN: r0=476(x1), r1=144(y1), r2=179(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 144
LDI r2, 179
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
