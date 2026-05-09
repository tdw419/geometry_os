; DESCRIPTION: Places a orange line segment connecting (191, 127) to (203, 28).
; PLAN: r0=191(x1), r1=127(y1), r2=203(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 127
LDI r2, 203
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
