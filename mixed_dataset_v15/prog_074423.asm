; DESCRIPTION: Creates a red filled rectangle of size 91x84 starting at (176, 78).
; PLAN: r0=176(x), r1=78(y), r2=91(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 78
LDI r2, 91
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
