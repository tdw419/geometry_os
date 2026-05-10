; DESCRIPTION: Places a orange line segment connecting (156, 51) to (44, 5).
; PLAN: r0=156(x1), r1=51(y1), r2=44(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 51
LDI r2, 44
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
