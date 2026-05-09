; DESCRIPTION: Places a orange line segment connecting (151, 7) to (400, 99).
; PLAN: r0=151(x1), r1=7(y1), r2=400(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 7
LDI r2, 400
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
