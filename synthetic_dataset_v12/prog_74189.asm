; DESCRIPTION: Places a orange line segment connecting (449, 78) to (472, 249).
; PLAN: r0=449(x1), r1=78(y1), r2=472(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 78
LDI r2, 472
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
