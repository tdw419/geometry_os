; DESCRIPTION: Creates a magenta filled rectangle of size 114x101 starting at (231, 57).
; PLAN: r0=231(x), r1=57(y), r2=114(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 57
LDI r2, 114
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
