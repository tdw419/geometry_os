; DESCRIPTION: Places a orange line segment connecting (49, 19) to (393, 148).
; PLAN: r0=49(x1), r1=19(y1), r2=393(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 19
LDI r2, 393
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
