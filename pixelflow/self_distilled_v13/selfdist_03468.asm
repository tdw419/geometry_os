; DESCRIPTION: Creates a red filled rectangle of size 45x75 starting at (78, 162).
; PLAN: r0=78(x), r1=162(y), r2=45(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 162
LDI r2, 45
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
