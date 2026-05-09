; DESCRIPTION: Places a orange line segment connecting (460, 156) to (148, 219).
; PLAN: r0=460(x1), r1=156(y1), r2=148(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 156
LDI r2, 148
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
