; DESCRIPTION: Places a orange line segment connecting (108, 6) to (454, 210).
; PLAN: r0=108(x1), r1=6(y1), r2=454(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 6
LDI r2, 454
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
