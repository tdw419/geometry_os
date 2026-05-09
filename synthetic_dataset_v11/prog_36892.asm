; DESCRIPTION: Places a orange line segment connecting (29, 167) to (47, 141).
; PLAN: r0=29(x1), r1=167(y1), r2=47(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 167
LDI r2, 47
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
