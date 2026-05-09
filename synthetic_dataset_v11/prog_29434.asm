; DESCRIPTION: Places a orange line segment connecting (80, 92) to (51, 99).
; PLAN: r0=80(x1), r1=92(y1), r2=51(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 92
LDI r2, 51
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
