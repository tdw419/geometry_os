; DESCRIPTION: Creates a magenta filled rectangle of size 29x11 starting at (129, 52).
; PLAN: r0=129(x), r1=52(y), r2=29(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 52
LDI r2, 29
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
