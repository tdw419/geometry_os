; DESCRIPTION: Places a orange line segment connecting (165, 253) to (38, 31).
; PLAN: r0=165(x1), r1=253(y1), r2=38(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 253
LDI r2, 38
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
