; DESCRIPTION: Creates a yellow filled rectangle of size 24x69 starting at (121, 191).
; PLAN: r0=121(x), r1=191(y), r2=24(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 191
LDI r2, 24
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
