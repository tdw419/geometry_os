; DESCRIPTION: Places a orange line segment connecting (475, 23) to (214, 175).
; PLAN: r0=475(x1), r1=23(y1), r2=214(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 23
LDI r2, 214
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
