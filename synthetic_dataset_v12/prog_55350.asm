; DESCRIPTION: Places a orange line segment connecting (447, 43) to (370, 47).
; PLAN: r0=447(x1), r1=43(y1), r2=370(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 43
LDI r2, 370
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
