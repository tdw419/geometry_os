; DESCRIPTION: Places a orange line segment connecting (14, 38) to (233, 169).
; PLAN: r0=14(x1), r1=38(y1), r2=233(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 38
LDI r2, 233
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
