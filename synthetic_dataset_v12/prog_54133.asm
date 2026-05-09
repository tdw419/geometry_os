; DESCRIPTION: Places a orange line segment connecting (434, 3) to (462, 85).
; PLAN: r0=434(x1), r1=3(y1), r2=462(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 3
LDI r2, 462
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
