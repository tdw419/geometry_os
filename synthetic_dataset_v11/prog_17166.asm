; DESCRIPTION: Places a orange line segment connecting (90, 101) to (156, 13).
; PLAN: r0=90(x1), r1=101(y1), r2=156(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 101
LDI r2, 156
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
