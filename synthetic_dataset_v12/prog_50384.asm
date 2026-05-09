; DESCRIPTION: Places a orange line segment connecting (424, 206) to (194, 129).
; PLAN: r0=424(x1), r1=206(y1), r2=194(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 206
LDI r2, 194
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
