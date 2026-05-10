; DESCRIPTION: Creates a magenta filled rectangle of size 44x88 starting at (294, 66).
; PLAN: r0=294(x), r1=66(y), r2=44(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 66
LDI r2, 44
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
