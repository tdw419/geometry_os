; DESCRIPTION: Places a orange line segment connecting (148, 38) to (121, 73).
; PLAN: r0=148(x1), r1=38(y1), r2=121(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 38
LDI r2, 121
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
