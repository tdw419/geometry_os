; DESCRIPTION: Creates a magenta filled rectangle of size 115x88 starting at (343, 70).
; PLAN: r0=343(x), r1=70(y), r2=115(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 70
LDI r2, 115
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
