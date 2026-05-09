; DESCRIPTION: Renders a magenta box of size 49x10 starting at (316, 151).
; PLAN: r0=316(x), r1=151(y), r2=49(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 151
LDI r2, 49
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
