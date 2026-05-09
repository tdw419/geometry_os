; DESCRIPTION: Places a orange line segment connecting (371, 244) to (466, 239).
; PLAN: r0=371(x1), r1=244(y1), r2=466(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 244
LDI r2, 466
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
