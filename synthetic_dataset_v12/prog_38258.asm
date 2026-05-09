; DESCRIPTION: Places a orange line segment connecting (489, 96) to (25, 47).
; PLAN: r0=489(x1), r1=96(y1), r2=25(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 96
LDI r2, 25
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
