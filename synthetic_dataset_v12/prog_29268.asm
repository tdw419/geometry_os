; DESCRIPTION: Places a orange line segment connecting (418, 62) to (217, 181).
; PLAN: r0=418(x1), r1=62(y1), r2=217(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 62
LDI r2, 217
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
