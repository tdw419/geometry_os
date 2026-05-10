; DESCRIPTION: Creates a green filled rectangle of size 86x118 starting at (74, 69).
; PLAN: r0=74(x), r1=69(y), r2=86(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 69
LDI r2, 86
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
