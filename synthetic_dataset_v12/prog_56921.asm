; DESCRIPTION: Places a orange line segment connecting (501, 191) to (84, 210).
; PLAN: r0=501(x1), r1=191(y1), r2=84(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 191
LDI r2, 84
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
