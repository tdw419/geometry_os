; DESCRIPTION: Creates a red filled rectangle of size 46x114 starting at (115, 14).
; PLAN: r0=115(x), r1=14(y), r2=46(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 14
LDI r2, 46
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
