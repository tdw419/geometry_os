; DESCRIPTION: Places a orange line segment connecting (234, 24) to (288, 94).
; PLAN: r0=234(x1), r1=24(y1), r2=288(x2), r3=94(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 24
LDI r2, 288
LDI r3, 94
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
