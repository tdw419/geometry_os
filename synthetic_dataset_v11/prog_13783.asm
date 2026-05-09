; DESCRIPTION: Places a orange line segment connecting (90, 46) to (156, 84).
; PLAN: r0=90(x1), r1=46(y1), r2=156(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 46
LDI r2, 156
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
