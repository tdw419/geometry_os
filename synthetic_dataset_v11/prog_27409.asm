; DESCRIPTION: Places a magenta 77x114 rectangle at position (53, 71).
; PLAN: r0=53(x), r1=71(y), r2=77(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 71
LDI r2, 77
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
