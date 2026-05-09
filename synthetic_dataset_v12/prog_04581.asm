; DESCRIPTION: Places a orange line segment connecting (53, 228) to (414, 19).
; PLAN: r0=53(x1), r1=228(y1), r2=414(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 228
LDI r2, 414
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
