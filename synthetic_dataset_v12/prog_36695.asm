; DESCRIPTION: Places a orange line segment connecting (332, 40) to (225, 14).
; PLAN: r0=332(x1), r1=40(y1), r2=225(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 40
LDI r2, 225
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
