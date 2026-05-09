; DESCRIPTION: Places a orange line segment connecting (276, 19) to (140, 108).
; PLAN: r0=276(x1), r1=19(y1), r2=140(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 19
LDI r2, 140
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
