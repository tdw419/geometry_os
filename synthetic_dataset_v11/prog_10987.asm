; DESCRIPTION: Places a orange line segment connecting (228, 92) to (168, 123).
; PLAN: r0=228(x1), r1=92(y1), r2=168(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 92
LDI r2, 168
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
