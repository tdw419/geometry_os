; DESCRIPTION: Places a orange line segment connecting (28, 37) to (251, 1).
; PLAN: r0=28(x1), r1=37(y1), r2=251(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 37
LDI r2, 251
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
