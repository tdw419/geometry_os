; DESCRIPTION: Creates a magenta filled rectangle of size 74x43 starting at (223, 74).
; PLAN: r0=223(x), r1=74(y), r2=74(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 74
LDI r2, 74
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
