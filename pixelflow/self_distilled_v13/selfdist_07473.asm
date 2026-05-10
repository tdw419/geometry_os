; DESCRIPTION: Creates a white filled rectangle of size 69x53 starting at (52, 118).
; PLAN: r0=52(x), r1=118(y), r2=69(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 118
LDI r2, 69
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
