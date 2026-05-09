; DESCRIPTION: Places a orange line segment connecting (67, 158) to (39, 42).
; PLAN: r0=67(x1), r1=158(y1), r2=39(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 158
LDI r2, 39
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
