; DESCRIPTION: Creates a magenta filled rectangle of size 50x88 starting at (397, 114).
; PLAN: r0=397(x), r1=114(y), r2=50(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 114
LDI r2, 50
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
