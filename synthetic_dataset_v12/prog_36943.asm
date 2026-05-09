; DESCRIPTION: Places a orange line segment connecting (40, 234) to (438, 38).
; PLAN: r0=40(x1), r1=234(y1), r2=438(x2), r3=38(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 234
LDI r2, 438
LDI r3, 38
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
