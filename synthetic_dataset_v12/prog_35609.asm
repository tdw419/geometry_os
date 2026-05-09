; DESCRIPTION: Places a orange line segment connecting (216, 51) to (474, 15).
; PLAN: r0=216(x1), r1=51(y1), r2=474(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 51
LDI r2, 474
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
