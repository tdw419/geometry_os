; DESCRIPTION: Places a orange line segment connecting (77, 4) to (28, 36).
; PLAN: r0=77(x1), r1=4(y1), r2=28(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 4
LDI r2, 28
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
