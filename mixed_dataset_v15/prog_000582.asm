; DESCRIPTION: Places a orange line segment connecting (43, 195) to (133, 67).
; PLAN: r0=43(x1), r1=195(y1), r2=133(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 195
LDI r2, 133
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
