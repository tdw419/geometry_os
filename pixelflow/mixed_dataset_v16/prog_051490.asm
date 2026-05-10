; DESCRIPTION: Renders a orange line segment connecting (210, 101) to (366, 194).
; PLAN: r0=210(x1), r1=101(y1), r2=366(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 101
LDI r2, 366
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
