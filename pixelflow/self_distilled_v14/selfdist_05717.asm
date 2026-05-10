; DESCRIPTION: Creates a green filled rectangle of size 26x69 starting at (252, 61).
; PLAN: r0=252(x), r1=61(y), r2=26(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 61
LDI r2, 26
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
