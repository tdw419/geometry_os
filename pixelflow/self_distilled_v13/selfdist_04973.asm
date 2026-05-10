; DESCRIPTION: Creates a magenta filled rectangle of size 76x14 starting at (212, 46).
; PLAN: r0=212(x), r1=46(y), r2=76(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 46
LDI r2, 76
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
