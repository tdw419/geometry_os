; DESCRIPTION: Places a orange line segment connecting (490, 6) to (500, 230).
; PLAN: r0=490(x1), r1=6(y1), r2=500(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 6
LDI r2, 500
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
