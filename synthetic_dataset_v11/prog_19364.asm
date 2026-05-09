; DESCRIPTION: Places a orange line segment connecting (156, 89) to (156, 143).
; PLAN: r0=156(x1), r1=89(y1), r2=156(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 89
LDI r2, 156
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
