; DESCRIPTION: Creates a yellow filled rectangle of size 34x102 starting at (264, 74).
; PLAN: r0=264(x), r1=74(y), r2=34(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 74
LDI r2, 34
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
