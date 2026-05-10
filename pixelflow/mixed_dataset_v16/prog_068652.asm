; DESCRIPTION: Places a orange line segment connecting (175, 203) to (90, 135).
; PLAN: r0=175(x1), r1=203(y1), r2=90(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 203
LDI r2, 90
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
