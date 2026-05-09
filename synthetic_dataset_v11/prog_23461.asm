; DESCRIPTION: Places a orange line segment connecting (2, 4) to (4, 132).
; PLAN: r0=2(x1), r1=4(y1), r2=4(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 4
LDI r2, 4
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
