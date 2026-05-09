; DESCRIPTION: Places a orange line segment connecting (86, 194) to (151, 123).
; PLAN: r0=86(x1), r1=194(y1), r2=151(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 194
LDI r2, 151
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
