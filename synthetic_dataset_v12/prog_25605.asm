; DESCRIPTION: Renders a orange line between points (338, 67) and (100, 62).
; PLAN: r0=338(x1), r1=67(y1), r2=100(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 67
LDI r2, 100
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
