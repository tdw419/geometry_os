; DESCRIPTION: Places a orange line segment connecting (123, 32) to (182, 109).
; PLAN: r0=123(x1), r1=32(y1), r2=182(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 32
LDI r2, 182
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
