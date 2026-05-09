; DESCRIPTION: Places a orange line segment connecting (262, 144) to (198, 245).
; PLAN: r0=262(x1), r1=144(y1), r2=198(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 144
LDI r2, 198
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
