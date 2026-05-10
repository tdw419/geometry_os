; DESCRIPTION: Draws a orange line from (339, 64) to (438, 62).
; PLAN: r0=339(x1), r1=64(y1), r2=438(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 64
LDI r2, 438
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
