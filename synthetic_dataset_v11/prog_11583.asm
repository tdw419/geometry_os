; DESCRIPTION: Places a orange line segment connecting (137, 241) to (215, 239).
; PLAN: r0=137(x1), r1=241(y1), r2=215(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 241
LDI r2, 215
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
