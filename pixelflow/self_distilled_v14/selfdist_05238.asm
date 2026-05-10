; DESCRIPTION: Creates a magenta filled rectangle of size 89x114 starting at (176, 28).
; PLAN: r0=176(x), r1=28(y), r2=89(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 28
LDI r2, 89
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
