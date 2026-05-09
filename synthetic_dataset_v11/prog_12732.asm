; DESCRIPTION: Places a orange line segment connecting (38, 38) to (128, 10).
; PLAN: r0=38(x1), r1=38(y1), r2=128(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 38
LDI r2, 128
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
