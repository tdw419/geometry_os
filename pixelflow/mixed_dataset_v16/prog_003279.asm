; DESCRIPTION: Places a orange line segment connecting (490, 188) to (33, 126).
; PLAN: r0=490(x1), r1=188(y1), r2=33(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 188
LDI r2, 33
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
