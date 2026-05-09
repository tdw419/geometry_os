; DESCRIPTION: Places a orange line segment connecting (94, 51) to (52, 100).
; PLAN: r0=94(x1), r1=51(y1), r2=52(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 51
LDI r2, 52
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
