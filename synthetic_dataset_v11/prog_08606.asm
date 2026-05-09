; DESCRIPTION: Places a orange line segment connecting (165, 240) to (101, 254).
; PLAN: r0=165(x1), r1=240(y1), r2=101(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 240
LDI r2, 101
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
