; DESCRIPTION: Places a orange line segment connecting (84, 146) to (6, 77).
; PLAN: r0=84(x1), r1=146(y1), r2=6(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 146
LDI r2, 6
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
