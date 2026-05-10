; DESCRIPTION: Creates a red filled rectangle of size 34x46 starting at (167, 101).
; PLAN: r0=167(x), r1=101(y), r2=34(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 101
LDI r2, 34
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
