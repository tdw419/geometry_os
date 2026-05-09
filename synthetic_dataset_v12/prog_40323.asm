; DESCRIPTION: Places a orange line segment connecting (491, 249) to (323, 45).
; PLAN: r0=491(x1), r1=249(y1), r2=323(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 249
LDI r2, 323
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
