; DESCRIPTION: Places a orange line segment connecting (51, 158) to (193, 124).
; PLAN: r0=51(x1), r1=158(y1), r2=193(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 158
LDI r2, 193
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
