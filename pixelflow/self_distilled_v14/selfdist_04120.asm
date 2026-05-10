; DESCRIPTION: Creates a red filled rectangle of size 78x114 starting at (73, 85).
; PLAN: r0=73(x), r1=85(y), r2=78(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 85
LDI r2, 78
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
