; DESCRIPTION: Places a orange line segment connecting (333, 55) to (85, 100).
; PLAN: r0=333(x1), r1=55(y1), r2=85(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 55
LDI r2, 85
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
