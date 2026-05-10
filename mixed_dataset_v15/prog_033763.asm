; DESCRIPTION: Creates a red filled rectangle of size 101x114 starting at (22, 61).
; PLAN: r0=22(x), r1=61(y), r2=101(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 61
LDI r2, 101
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
