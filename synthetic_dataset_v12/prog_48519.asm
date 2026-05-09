; DESCRIPTION: Places a orange line segment connecting (490, 207) to (395, 181).
; PLAN: r0=490(x1), r1=207(y1), r2=395(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 207
LDI r2, 395
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
