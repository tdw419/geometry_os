; DESCRIPTION: Places a orange line segment connecting (399, 215) to (156, 84).
; PLAN: r0=399(x1), r1=215(y1), r2=156(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 215
LDI r2, 156
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
