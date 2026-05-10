; DESCRIPTION: Creates a red filled rectangle of size 62x102 starting at (182, 129).
; PLAN: r0=182(x), r1=129(y), r2=62(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 129
LDI r2, 62
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
