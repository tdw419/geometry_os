; DESCRIPTION: Places a orange line segment connecting (369, 174) to (476, 254).
; PLAN: r0=369(x1), r1=174(y1), r2=476(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 174
LDI r2, 476
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
