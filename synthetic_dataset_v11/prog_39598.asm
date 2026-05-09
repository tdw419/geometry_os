; DESCRIPTION: Places a orange line segment connecting (67, 170) to (42, 212).
; PLAN: r0=67(x1), r1=170(y1), r2=42(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 170
LDI r2, 42
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
