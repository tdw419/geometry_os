; DESCRIPTION: Places a orange line segment connecting (114, 239) to (389, 191).
; PLAN: r0=114(x1), r1=239(y1), r2=389(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 239
LDI r2, 389
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
