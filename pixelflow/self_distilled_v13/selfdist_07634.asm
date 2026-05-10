; DESCRIPTION: Creates a magenta filled rectangle of size 112x10 starting at (212, 114).
; PLAN: r0=212(x), r1=114(y), r2=112(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 114
LDI r2, 112
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
