; DESCRIPTION: Places a orange line segment connecting (200, 79) to (469, 239).
; PLAN: r0=200(x1), r1=79(y1), r2=469(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 79
LDI r2, 469
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
