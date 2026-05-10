; DESCRIPTION: Creates a yellow filled rectangle of size 68x36 starting at (78, 122).
; PLAN: r0=78(x), r1=122(y), r2=68(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 122
LDI r2, 68
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
