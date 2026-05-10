; DESCRIPTION: Creates a yellow filled rectangle of size 34x103 starting at (37, 71).
; PLAN: r0=37(x), r1=71(y), r2=34(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 71
LDI r2, 34
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
