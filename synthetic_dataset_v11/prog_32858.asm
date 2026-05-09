; DESCRIPTION: Places a orange line segment connecting (12, 121) to (241, 239).
; PLAN: r0=12(x1), r1=121(y1), r2=241(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 121
LDI r2, 241
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
