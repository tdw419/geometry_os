; DESCRIPTION: Places a orange line segment connecting (194, 165) to (336, 164).
; PLAN: r0=194(x1), r1=165(y1), r2=336(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 165
LDI r2, 336
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
