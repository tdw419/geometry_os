; DESCRIPTION: Places a orange line segment connecting (87, 108) to (472, 250).
; PLAN: r0=87(x1), r1=108(y1), r2=472(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 108
LDI r2, 472
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
