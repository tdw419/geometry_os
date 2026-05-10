; DESCRIPTION: Creates a red filled rectangle of size 86x38 starting at (19, 18).
; PLAN: r0=19(x), r1=18(y), r2=86(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 18
LDI r2, 86
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
