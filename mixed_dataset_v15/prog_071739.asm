; DESCRIPTION: Places a orange line segment connecting (228, 228) to (129, 157).
; PLAN: r0=228(x1), r1=228(y1), r2=129(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 228
LDI r2, 129
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
