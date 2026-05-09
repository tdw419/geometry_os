; DESCRIPTION: Places a orange line segment connecting (72, 76) to (81, 63).
; PLAN: r0=72(x1), r1=76(y1), r2=81(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 76
LDI r2, 81
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
