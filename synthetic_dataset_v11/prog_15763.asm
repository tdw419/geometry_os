; DESCRIPTION: Places a orange line segment connecting (117, 9) to (148, 163).
; PLAN: r0=117(x1), r1=9(y1), r2=148(x2), r3=163(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 9
LDI r2, 148
LDI r3, 163
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
