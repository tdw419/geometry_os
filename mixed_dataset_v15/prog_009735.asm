; DESCRIPTION: Places a orange line segment connecting (493, 100) to (495, 90).
; PLAN: r0=493(x1), r1=100(y1), r2=495(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 100
LDI r2, 495
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
