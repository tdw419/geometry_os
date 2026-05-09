; DESCRIPTION: Places a orange line segment connecting (236, 55) to (222, 122).
; PLAN: r0=236(x1), r1=55(y1), r2=222(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 55
LDI r2, 222
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
