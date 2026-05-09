; DESCRIPTION: Places a orange line segment connecting (138, 56) to (262, 49).
; PLAN: r0=138(x1), r1=56(y1), r2=262(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 56
LDI r2, 262
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
