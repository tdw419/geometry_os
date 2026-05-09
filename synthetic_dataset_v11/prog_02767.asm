; DESCRIPTION: Places a orange line segment connecting (50, 4) to (156, 149).
; PLAN: r0=50(x1), r1=4(y1), r2=156(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 4
LDI r2, 156
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
