; DESCRIPTION: Places a orange line segment connecting (505, 19) to (138, 19).
; PLAN: r0=505(x1), r1=19(y1), r2=138(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 19
LDI r2, 138
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
