; DESCRIPTION: Renders a orange line between points (476, 58) and (4, 157).
; PLAN: r0=476(x1), r1=58(y1), r2=4(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 58
LDI r2, 4
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
