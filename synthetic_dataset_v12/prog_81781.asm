; DESCRIPTION: Places a orange line segment connecting (282, 7) to (431, 225).
; PLAN: r0=282(x1), r1=7(y1), r2=431(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 7
LDI r2, 431
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
