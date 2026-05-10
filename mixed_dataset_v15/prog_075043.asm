; DESCRIPTION: Creates a yellow filled rectangle of size 67x28 starting at (62, 72).
; PLAN: r0=62(x), r1=72(y), r2=67(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 72
LDI r2, 67
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
