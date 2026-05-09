; DESCRIPTION: Places a orange line segment connecting (207, 238) to (145, 206).
; PLAN: r0=207(x1), r1=238(y1), r2=145(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 238
LDI r2, 145
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
