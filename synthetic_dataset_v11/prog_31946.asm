; DESCRIPTION: Places a orange line segment connecting (203, 142) to (50, 59).
; PLAN: r0=203(x1), r1=142(y1), r2=50(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 142
LDI r2, 50
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
