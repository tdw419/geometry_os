; DESCRIPTION: Places a orange line segment connecting (102, 33) to (296, 137).
; PLAN: r0=102(x1), r1=33(y1), r2=296(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 33
LDI r2, 296
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
