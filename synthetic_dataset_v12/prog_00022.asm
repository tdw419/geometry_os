; DESCRIPTION: Places a orange line segment connecting (280, 203) to (108, 150).
; PLAN: r0=280(x1), r1=203(y1), r2=108(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 203
LDI r2, 108
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
