; DESCRIPTION: Places a orange line segment connecting (153, 160) to (234, 82).
; PLAN: r0=153(x1), r1=160(y1), r2=234(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 160
LDI r2, 234
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
