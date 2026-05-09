; DESCRIPTION: Places a orange line segment connecting (291, 105) to (415, 153).
; PLAN: r0=291(x1), r1=105(y1), r2=415(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 105
LDI r2, 415
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
