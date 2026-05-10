; DESCRIPTION: Places a orange line segment connecting (402, 144) to (67, 133).
; PLAN: r0=402(x1), r1=144(y1), r2=67(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 144
LDI r2, 67
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
