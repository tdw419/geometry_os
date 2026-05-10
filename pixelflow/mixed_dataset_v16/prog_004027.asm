; DESCRIPTION: Places a magenta 49x114 rectangle at position (233, 88).
; PLAN: r0=233(x), r1=88(y), r2=49(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 88
LDI r2, 49
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
