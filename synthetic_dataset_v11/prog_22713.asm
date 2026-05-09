; DESCRIPTION: Places a orange line segment connecting (2, 117) to (88, 166).
; PLAN: r0=2(x1), r1=117(y1), r2=88(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 117
LDI r2, 88
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
