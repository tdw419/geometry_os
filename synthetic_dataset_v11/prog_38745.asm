; DESCRIPTION: Places a orange line segment connecting (42, 96) to (67, 140).
; PLAN: r0=42(x1), r1=96(y1), r2=67(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 96
LDI r2, 67
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
