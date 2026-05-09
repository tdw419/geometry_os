; DESCRIPTION: Places a orange line segment connecting (264, 100) to (35, 239).
; PLAN: r0=264(x1), r1=100(y1), r2=35(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 100
LDI r2, 35
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
