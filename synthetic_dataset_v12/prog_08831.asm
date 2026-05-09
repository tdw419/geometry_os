; DESCRIPTION: Places a orange line segment connecting (279, 203) to (383, 144).
; PLAN: r0=279(x1), r1=203(y1), r2=383(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 203
LDI r2, 383
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
