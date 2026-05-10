; DESCRIPTION: Creates a magenta filled rectangle of size 81x61 starting at (328, 88).
; PLAN: r0=328(x), r1=88(y), r2=81(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 88
LDI r2, 81
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
