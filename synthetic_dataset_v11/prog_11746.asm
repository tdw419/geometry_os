; DESCRIPTION: Places a orange line segment connecting (195, 143) to (38, 63).
; PLAN: r0=195(x1), r1=143(y1), r2=38(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 143
LDI r2, 38
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
