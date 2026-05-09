; DESCRIPTION: Places a orange line segment connecting (136, 121) to (91, 101).
; PLAN: r0=136(x1), r1=121(y1), r2=91(x2), r3=101(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 121
LDI r2, 91
LDI r3, 101
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
