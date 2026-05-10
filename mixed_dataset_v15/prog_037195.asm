; DESCRIPTION: Places a orange line segment connecting (286, 178) to (381, 84).
; PLAN: r0=286(x1), r1=178(y1), r2=381(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 178
LDI r2, 381
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
